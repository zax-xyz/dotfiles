c.colors.completion.category.bg = 'qlineargradient(x1:0, y1:0, x2:0, y2:1, stop:0 #121212, stop:1 #121212)'
c.colors.completion.even.bg = '#232323'
c.colors.completion.fg = ['white']
c.colors.completion.item.selected.bg = '#e5c07b'
c.colors.completion.item.selected.border.bottom = '#e5c07b'
c.colors.completion.item.selected.border.top = '#e5c07b'
c.colors.completion.item.selected.fg = '#16181d'
c.colors.completion.item.selected.match.fg = '#e06c75'
c.colors.completion.match.fg = '#e06c75'
c.colors.completion.odd.bg = '#232323'

c.colors.downloads.bar.bg = '#3e4452'
c.colors.downloads.error.bg = '#e06c75'
c.colors.downloads.error.fg = 'white'
c.colors.downloads.stop.bg = '#61afef'
c.colors.downloads.stop.fg = '#16181d'

c.colors.messages.error.bg = '#e06c75'
c.colors.messages.error.border = '#e06c75'
c.colors.messages.error.fg = 'black'

c.colors.statusbar.caret.bg = '#232323'
c.colors.statusbar.caret.fg = '#c678dd'
c.colors.statusbar.caret.selection.bg = '#232323'
c.colors.statusbar.caret.selection.fg = '#a12dff'
c.colors.statusbar.command.bg = '#232323'
c.colors.statusbar.command.fg = '#abb2bf'
c.colors.statusbar.insert.bg = '#232323'
c.colors.statusbar.insert.fg = '#61afef'
c.colors.statusbar.normal.bg = '#232323'
c.colors.statusbar.normal.fg = '#abb2bf'
c.colors.statusbar.passthrough.bg = '#232323'
c.colors.statusbar.passthrough.fg = '#61afef'

c.colors.statusbar.url.success.https.fg = '#98c379'

c.colors.tabs.bar.bg = '#232323'
c.colors.tabs.even.bg = '#232323'
c.colors.tabs.indicator.start = '#61dfef'
c.colors.tabs.indicator.stop = '#98c379'
c.colors.tabs.odd.bg = '#232323'
c.colors.tabs.selected.even.bg = '#454545'
c.colors.tabs.selected.odd.bg = '#454545'

c.content.autoplay = False

c.fonts.downloads = 'default_size noto sans'
c.fonts.tabs = 'default_size noto sans'

c.scrolling.bar = 'never'

c.statusbar.padding = {'top': 2, 'bottom': 2, 'left': 5, 'right': 5}

c.tabs.close_mouse_button = 'right'
c.tabs.indicator.padding = {'top': 2, 'bottom': 2, 'left': 0, 'right': 8}
c.tabs.indicator.width = 2
c.tabs.last_close = 'close'
c.tabs.padding = {'top': 4, 'bottom': 4, 'left': 10, 'right': 10}
c.tabs.position = 'left'
c.tabs.show = 'multiple'

c.url.default_page = 'file:///home/mvo/Code/web/startpage2/index.html'
c.url.start_pages = ['file:///home/mvo/Code/web/startpage2/index.html']

config.bind('tt', 'set tabs.show never')
config.bind('tT', 'set tabs.show multiple')

import glob

c.content.user_stylesheets = glob.glob('/home/mvo/.local/share/qutebrowser/styles/*.user.css')
