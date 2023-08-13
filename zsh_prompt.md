# Custom ZSH prompt

`~/.zshrc`

```zsh
...

PROMPT='%{$fg[yellow]%}[%m]%{$reset_color%}$(git_custom_status)%{$fg[cyan]%}[%~% ]%{$reset_color%}
$ '
```