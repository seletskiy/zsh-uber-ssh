## Aliases for quick SSH access

![demo](https://raw.githubusercontent.com/seletskiy/zsh-uber-ssh/master/example.gif)

### Rules

```zsh
alias -s <suffix>='uber-ssh:alias -s <ssh> -P <prepend> -A <append> -R <suffix>' -->

    $ blah.woow.<suffix> --> <ssh> <prepend>blah.woow<append> (<suffix> is removed)
```

### Examples

```zsh
alias -s L='uber-ssh:alias -P 192.168. -R .L'

    $ 2.1.L --> ssh 192.168.2.1

alias -s e='uber-ssh:alias -P example.in. -R .e'

    $ xxx.e --> ssh example.in.xxx

alias -s p='uber-ssh:alias -A .in.example.com -R .p'

    $ bla.p --> ssh bla.in.example.com

alias -s x='uber-ssh:alias -R .x'

    $ wtf.x --> ssh wtf (resolve via search domains)
```

### Tips and tricks

```zsh
alias -s L='uber-ssh:alias -P 192.168. -R .L'

    $ root@2.1.L --> ssh root@192.168.2.1

    $ 2.1.L -XY  --> ssh 192.168.2.1 -XY

    $ 2.1.L sudo -i  --> ssh 192.168.2.1 sudo -i

    $ 2.1.L sudo -i systemctl restart nginx  --> ssh 192.168.2.1 sudo -i systemctl restart nginx

alias -s U='sudo -i'

    $ 2.1.L U systemctl restart nginx  --> ssh 192.168.2.1 sudo -i systemctl restart nginx
```
