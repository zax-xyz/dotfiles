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
parser.add_argument('user', help='username of user to check')
parser.add_argument('--mode', choices=['to', 'from'], default='from',
                    help='whether to get follows to or from the user')
args = parser.parse_args()

with open(os.path.expanduser('~/.config/twitch-auth.json')) as f:
    auth: dict = json.load(f)

client_id: str = auth['clientId']
token: str = auth['oauthToken']


def get(endpoint: str) -> dict:
    return requests.get(f'https://api.twitch.tv/helix/{endpoint}', headers={
        'Client-ID': client_id,
        'Authorization': f'Bearer {token}',
    }).json()


user_id: str = get(f'users?login={args.user}')['data'][0]['id']


def get_follows(cursor: str = '', more: int = 0):
    follow_endpoint = f'users/follows?{args.mode}_id={user_id}'
    if cursor:
        follow_endpoint += f'&after={cursor}'

    follows = get(follow_endpoint)
    follow_data = follows['data']
    if not follow_data:
        return '', 0

    cursor = follows['pagination']['cursor']

    if not more:
        more = follows['total']
        print('Total:', more)
        print()

    more -= len(follow_data)

    mode = 'to' if args.mode == 'from' else 'from'

    print(tabulate(
        [[
            f[f'{mode}_name'],
            f[f'{mode}_id'],
            isoparse(f['followed_at']).strftime('%Y/%m/%d %H:%M:%S'),
        ] for f in follow_data],
        headers=['Username', 'User ID', 'Follow Date']
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
