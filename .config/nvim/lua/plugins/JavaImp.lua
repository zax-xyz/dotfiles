local config_dir = os.getenv('XDG_CONFIG_HOME')
if config_dir == nil or #config_dir == 0 then
    config_dir = os.getenv('HOME') .. '/.config'
end

vim.g.JavaImpDataDir = config_dir .. '/JavaImp'
vim.g.JavaImpPaths = vim.g.JavaImpDataDir .. '/jmplst'
