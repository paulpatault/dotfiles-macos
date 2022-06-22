# NVIM AUX

pip3 install neovim
npm install neovim
npm i -g vscode-langservers-extracted

# LUA LSP

git clone --depth 1 https://github.com/sumneko/lua-language-server.git $HOME/dotfiles/config/lua-language-server
cd $HOME/dotfiles/config/lua-language-server
git submodule update --depth 1 --init --recursive
brew install ninja
cd 3rd/luamake
./compile/install.sh
cd ../..
./3rd/luamake/luamake rebuild
