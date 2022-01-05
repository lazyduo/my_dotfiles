# my_dotfiles

Private Repository for Configuration and Setup files.

## SSH

[Link](https://github.com/lazyduo/my_dotfiles/tree/main/.ssh)

## Routing

`forward.sh` 80 -> 8000 port


## Ubuntu cmd

### tree
```bash
tree -L 2 -I "docs|build|thanosSQL*|__pycache__"
```

```
.
├── README.md
├── setup.py
└── thanos
    ├── __init__.py
    ├── execute.py
    ├── magic.py
    └── parse.py
```

### delete file
To delete all fiels in a directory except filename.
```bash
rm -v !("filename")
```
    
