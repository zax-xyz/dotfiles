# pylint: disable=C0111
from qutebrowser.config.configfiles import ConfigAPI  # noqa: F401
from qutebrowser.config.config import ConfigContainer  # noqa: F401
config: ConfigAPI = config  # noqa: F821 pylint: disable=E0602,C0103
c: ConfigContainer = c  # noqa: F821 pylint: disable=E0602,C0103

base = '#1e1e2e'
mantle = '#181825'
crust = '#11111b'

text = '#cdd6f4'
subtext0 = '#a6adc8'
subtext1 = '#bac2de'

surface0 = '#313244'
surface1 = '#45475a'
surface2 = '#585b70'

overlay0 = '#6c7086'
overlay1 = '#7f849c'
overlay2 = '#9399b2'

blue = '#89b4fa'
lavender = '#b4befe'
sapphire = '#74c7ec'
sky = '#89dceb'
teal = '#94e2d5'
green = '#a6e3a1'
yellow = '#f9e2af'
peach = '#fab387'
maroon = '#eba0ac'
red = '#f38ba8'
mauve = '#cba6f7'
pink = '#f5c2e7'
flamingo = '#f2cdcd'
rosewater = '#f5e0dc'

c.colors.completion.category.bg = f'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 {mantle}, stop:1 {mantle})'
c.colors.completion.even.bg = base
c.colors.completion.fg = text
c.colors.completion.item.selected.bg = lavender
c.colors.completion.item.selected.border.bottom = lavender
c.colors.completion.item.selected.border.top = lavender
c.colors.completion.item.selected.fg = base
c.colors.completion.item.selected.match.fg = green
c.colors.completion.match.fg = blue
c.colors.completion.odd.bg = base

c.colors.downloads.bar.bg = surface0
c.colors.downloads.error.bg = red
c.colors.downloads.error.fg = text
c.colors.downloads.stop.bg = blue
c.colors.downloads.stop.fg = base

c.colors.messages.error.bg = red
c.colors.messages.error.border = red
c.colors.messages.error.fg = text

c.colors.statusbar.caret.bg = base
c.colors.statusbar.caret.fg = lavender
c.colors.statusbar.caret.selection.bg = base
c.colors.statusbar.caret.selection.fg = mauve
c.colors.statusbar.command.bg = base
c.colors.statusbar.command.fg = text
c.colors.statusbar.insert.bg = base
c.colors.statusbar.insert.fg = green
c.colors.statusbar.normal.bg = base
c.colors.statusbar.normal.fg = blue
c.colors.statusbar.passthrough.bg = base
c.colors.statusbar.passthrough.fg = blue

c.colors.statusbar.url.success.https.fg = green

c.colors.tabs.bar.bg = base
c.colors.tabs.even.bg = base
c.colors.tabs.indicator.start = sky
c.colors.tabs.indicator.stop = green
c.colors.tabs.odd.bg = base
c.colors.tabs.selected.even.bg = surface0
c.colors.tabs.selected.odd.bg = surface0

c.content.autoplay = False

sans = 'default_size lato'
c.fonts.downloads = sans
c.fonts.tabs.selected = sans
c.fonts.tabs.unselected = sans
# c.fonts.statusbar = sans

c.scrolling.bar = 'never'

c.statusbar.padding = {'top': 2, 'bottom': 2, 'left': 5, 'right': 5}

c.tabs.close_mouse_button = 'right'
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 8}
c.tabs.indicator.width = 2
c.tabs.last_close = 'close'
c.tabs.padding = {'top': 4, 'bottom': 4, 'left': 10, 'right': 10}
c.tabs.position = 'left'
c.tabs.show = 'multiple'

c.url.default_page = 'file:///home/michael/cloned/startpage2/index.html'
c.url.start_pages = ['file:///home/michael/cloned/startpage2/index.html']

c.colors.hints.bg = yellow
c.colors.hints.fg = mantle
c.hints.border = f"1px solid {overlay0}"
c.colors.hints.match.fg = overlay0
c.hints.radius = 2
c.hints.padding = {
    "top": 1,
    "bottom": 1,
    "left": 4,
    "right": 4,
}
c.hints.selectors['all'].remove('img')

c.colors.keyhint.bg = mantle
c.colors.keyhint.fg = text
c.colors.keyhint.suffix.fg = subtext1

config.bind('tt', 'set tabs.show never')
config.bind('tT', 'set tabs.show multiple')

import glob

c.content.user_stylesheets = glob.glob('/home/michael/.local/share/qutebrowser/styles/*.user.css')

config.load_autoconfig(False)
