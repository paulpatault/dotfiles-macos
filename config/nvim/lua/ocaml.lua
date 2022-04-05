local home = os.getenv('HOME')

vim.api.nvim_set_var('python_host_prog', "/usr/bin/python")
vim.api.nvim_set_var('python3_host_prog', "/opt/homebrew/bin/python3")
vim.api.nvim_set_var('opamshare', home .. '/.opam/default/share')
vim.api.nvim_set_var('merlin_python_version', 3)
utils.add_rtp(home .. '/.opam/default/share/merlin/vim/doc')
utils.add_rtp(home .. '/.opam/default/share/merlin/vim')
utils.add_rtp(home .. '/.opam/default/share/merlin/vimbufsync')
