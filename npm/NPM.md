## AUTH to registry in base64
```bash
echo "login:password" | awk 1 ORS='' | base64
echo -n "login:password" | base64
```
##Install another npm or node version
[Using NVM](https://www.chrisjmendez.com/2018/02/07/install/)
