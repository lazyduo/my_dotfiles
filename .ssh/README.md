## SSH

ssh config

~/.ssh/config

```
Host <alias name>
    HostName <host ip or DN>
    IdentityFile /Users/dada/.ssh/yumi.pem (if needed)
    Port 22
    User <username>
```

### key gen for window

```
$ ssh-keygen
```

~/.ssh 디렉토리에 생성된

'id_rsa.pub'의 내용을 복사하여 접속하고자하는 서버의
'authorized_keys'에 붙여넣으면 더 이상 패스워드를 요청하지 않는다.
