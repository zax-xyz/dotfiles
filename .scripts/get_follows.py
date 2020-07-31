#!/usr/bin/env python
import argparse
import json
import os

import requests
from dateutil.parser import isoparse
from tabulate import tabulate

parser = argparse.ArgumentParser(
    description='get follows to/from a user on Twitch'
)
parser.add_argument('--to', '-t', help='username of user being followed')
parser.add_argument('--from', '-f', help='username of user following')
args = vars(parser.parse_args())

if not any(args.values()):
    parser.error('No arguments provided.')

with open(os.path.expanduser('~/.config/twitch-auth.json')) as f:
    auth: dict = json.load(f)

client_id: str = auth['clientId']
token: str = auth['oauthToken']


def get(endpoint: str, params: dict = {}) -> dict:
    return requests.get(
        f'https://api.twitch.tv/helix/{endpoint}',
        params=params,
        headers={
            'Client-ID': client_id,
            'Authorization': f'Bearer {token}',
        }
    ).json()


to_id = from_id = ''
if args['to']:
    to_id = get('users', {'login': args['to']})['data'][0]['id']
if args['from']:
    from_id = get('users', {'login': args['from']})['data'][0]['id']


def get_follows(cursor: str = '', more: int = 0):
    follows = get('users/follows', {
        'to_id': to_id,
        'from_id': from_id,
        'after': cursor
    })

    follow_data = follows['data']
    if not follow_data:
        return '', 0

    try:
        cursor = follows['pagination']['cursor']
    except KeyError:
        cursor = ''

    if not more:
        more = follows['total']
        print('Total:', more)
        print()

    more -= len(follow_data)

    print(tabulate(
        [[
            f['to_name'],
            f['from_name'],
            isoparse(f['followed_at']).strftime('%Y/%m/%d %H:%M:%S'),
        ] for f in follow_data],
        headers=['To User', 'From User', 'Follow Date']
    ))

    return cursor, more


def get_cont():
    try:
        return input('\nContinue? (Y/n) ')
    except KeyboardInterrupt:
        print()
        return 'n'


cursor, more = get_follows()
while more and get_cont() != 'n':
    print()
    cursor, more = get_follows(cursor, more)
