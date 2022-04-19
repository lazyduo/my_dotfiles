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


## disable SSH login welcome message

Another way that does not require administrative rights is to place an empty file called

`.hushlogin`

into your $HOME directory (using for example touch ~/.hushlogin).

## bash global profile

edit this file

`/etc/bash.bashrc`

## .bashrc vs .bash_profile

.bashrc는 non_login shell, .bash_profile은 login_shell으로 .bashrc는 ssh는 로그인 시에 나타나는 것이 아닌 새터미널을 열 때 로드됨.

그래서 .bash_profile에 유저 커스텀이 보통 들어간다

만약 .bashrc를 ssh login할 때 load하고 싶으면 `.bash_profile`에 아래 처럼 처리.

```
# Source bashrc
if [ -f ~/.bashrc ]; then
    . ~/.bashrc
fi
```

## shell script random

```
COWS=("dragon-and-cow" "frogs" "mutilated" "elephant-in-snake" "satanic" "hellokitty" "stegosaurus" "stimpy" "cheese" "vader")

#echo ${COWS[$(($RANDOM%10))]}
fortune | cowsay -f ${COWS[$(($RANDOM%10))]} | lolcat
```
