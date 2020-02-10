### Install zsh
```
sudo apt install zsh
```
```
chsh -s $(which zsh)
```

Log out and back in.

```
vi .zshrc
```
set `ZSH_THEME=avit`

### Install neovim
```
sudo apt-get install neovim
sudo apt-get install python-neovim
sudo apt-get install python3-neovim
cd .config && mkdir nvim && cd nvim
vim init.vim
```
Copy (maybe adjust) from [here](https://github.com/markvanlan/marks-config/blob/master/.config/nvim/init.vim)

After,

```
curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Then inside vim run `:PlugInstall`

### Install [xcape](https://github.com/alols/xcape)
```
sudo apt-get install git gcc make pkg-config libx11-dev libxtst-dev libxi-dev
git clone https://github.com/alols/xcape.git
cd xcape
make
sudo make install
xcape -e 'Control_L=Escape'
```

### Install tmux
```
sudo apt-get install tmux
vim .tmux.conf
```
Copy (maybe adjust) from [here](https://github.com/markvanlan/marks-config/blob/master/.tmux.conf)

