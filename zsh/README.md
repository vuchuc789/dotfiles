# 🐚 Shell

I use Zsh as my main shell, configured with:

## 🎨 Theme

- Powerlevel10k

## 🔌 Plugins

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
```

## 🐍 Python

If a virtual environment is active, it will be automatically sourced:

```
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi
```
