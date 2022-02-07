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

## Linux System Log

`/var/log/messages` 문제 생겼을 시 무조건 봐야하는 기본 로그. grep으로 잘 구분해서 볼 것.

`/var/log/secure` 사용자 접속 정보가 (ssh 등) 나오기 때문에 해킹이 의심되면 확인 할 것.


    
