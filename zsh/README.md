# 🐚 Shell

I use Zsh as my main shell, managed with [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh), and configured with:

## 🎨 Theme

- [Powerlevel10k](https://github.com/romkatv/powerlevel10k)

## 🔌 Plugins

- git
- z
- npm
- pip
- golang
- rust
- docker
- kubectl
- [zsh-history-substring-search](https://github.com/zsh-users/zsh-history-substring-search)
- [zsh-syntax-highlighting](https://github.com/zsh-users/zsh-syntax-highlighting)
- [zsh-autosuggestions](https://github.com/zsh-users/zsh-autosuggestions)
- [zsh-completions](https://github.com/zsh-users/zsh-completions)

## ⚡ Installing Oh My Zsh & Powerlevel10k

Install Oh My Zsh

```
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
```

Install Powerlevel10k theme

```
git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k"
```

Install additional plugins

```
git clone https://github.com/zsh-users/zsh-history-substring-search ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-history-substring-search
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions
```

In `.zshrc` file, replace the theme:

```
ZSH_THEME="powerlevel10k/powerlevel10k"
```

And update plugins section:

```
plugins=(
  git
  z
  npm
  pip
  golang
  rust
  docker
  kubectl
  zsh-history-substring-search
  zsh-syntax-highlighting
  zsh-autosuggestions
)

fpath+=${ZSH_CUSTOM:-${ZSH:-~/.oh-my-zsh}/custom}/plugins/zsh-completions/src
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh
```

## 🛠 Installing Zsh from Source (no root required)

Install ncurses

```
curl -L https://invisible-mirror.net/archives/ncurses/ncurses.tar.gz -o ncurses.tar.gz
tar -xf ncurses.tar.gz
cd ncurses-*

./configure --prefix=$HOME/.local --with-shared --with-termlib --enable-widec
make -j$(nproc)
make install
```

Add to `.bashrc` to set library paths:

```
export CPPFLAGS="-I$HOME/.local/include -I$HOME/.local/include/ncursesw"
export LDFLAGS="-L$HOME/.local/lib"
export PKG_CONFIG_PATH="$HOME/.local/lib/pkgconfig"
export LD_LIBRARY_PATH="$HOME/.local/lib:$LD_LIBRARY_PATH"
export PATH="$HOME/.local/bin:$PATH"
```

Install Zsh:

```
curl -L https://sourceforge.net/projects/zsh/files/latest/download -o zsh.tar.xz
tar -xf zsh.tar.xz
cd zsh-*

./configure --prefix=$HOME/.local CFLAGS="-Wno-error=incompatible-pointer-types"
make -j$(nproc)
make install
```

Add this to `.bashrc`:

```
# Automatically start Zsh for interactive shells
if [[ $- == *i* ]] && [ -x "$HOME/.local/bin/zsh" ] && [ -z "$ZSH_VERSION" ]; then
    exec "$HOME/.local/bin/zsh"
fi
```

## 🐍 Python

If a virtual environment is active, it will be automatically sourced:

```
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi
```

> ⚠️ My actual Zsh configuration is not included in this repository because it contains sensitive information and machine-specific settings.
