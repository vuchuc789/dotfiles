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

## 🐍 Python

If a virtual environment is active, it will be automatically sourced:

```
if [ -n "$VIRTUAL_ENV" ]; then
    source $VIRTUAL_ENV/bin/activate
fi
```

> ⚠️ My actual Zsh configuration is not included in this repository because it contains sensitive information and machine-specific settings.
