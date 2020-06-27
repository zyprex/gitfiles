# quick view

a piece of .gitmessage template

```
<type>: F feat, N new, B fix, M change, D docs, R refactor, S style, C chore
<abbr>: +add -delete ~change @at `func` 'file' *important !notice [line:col]
```

# usage

1. under home path execute `git clone https://github.com/zyprex/gitfiles`

2. write those line in `~/.gitconfig`

```
[commit]
    template =~/gitfiles/.gitmessage
```

3. try commit with `git commit -v`

