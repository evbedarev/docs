# Common commands
- find and replace string in files:
```bash
find ./ -type f -exec sed -i 's/string1/string2/g' {} \;
```
- find string in files
```bash
find / -type f -exec grep -H 'text-to-find-here' {} \;
```

