## vim

Install plugin manager:

```bash
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
```

Open vim and install plugins:

```bash
vim
:PlugInstall
```

## neovim

Using [AstroNvim](https://github.com/AstroNvim/AstroNvim)

Pull config file from github

```bash
git clone https://github.com/convers39/astro-nvim-config.git ~/.config/nvim/lua/user/
```

Launch AstroNvim and install plugins:

```bash
:AstroUpdate
:PackerInstall
:PackerSync
```

NOTE: Loading config file might fail, try those installation commands several times

Enter command `space+l + I` to install language server

Add dependencies:

```bash
brew install ripgrep jesseduffield/lazygit/lazygit htop ncdu
```

In most cases you may already have:

```bash
brew install python node

```

## vscode

`settings.json` and `keybindings.json` file

## zsh

Install [ omz ](https://github.com/ohmyzsh/ohmyzsh):

```bash
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

```

plugins:

```bash
brew install autojump
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
```

Apply changes:

```bash
source ~/.zshrc
```

## tmux

Install [ tmux package manager ](https://github.com/tmux-plugins/tpm)

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

Start new session:

```bash
tmux
```

Install plugins

```bash
prefix + I
```

NOTE: The prefix is set as ctrl+z, ctrl+z + shift+I to install
