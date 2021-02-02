# Vim commands

## vim-surround
- for help 
```bash
:help surround
```
- Provided are mappings to allow for removing, changing, and adding surroundings.
```bash
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  [123+4*56]/2              cs])        (123+456)/2
  "Look ma, I'm *HTML!"     cs"<q>      <q>Look ma, I'm HTML!</q>
  if *x>3 {                 ysW(        if ( x>3 ) {
  my $str = *whee!;         vllllS'     my $str = 'whee!';

```
- Delete surroundings is *ds* .
```bash
  Old text                  Command     New text ~
  "Hello *world!"           ds"         Hello world!
  (123+4*56)/2              ds)         123+456/2
  <div>Yo!*</div>           dst         Yo!
```
- Change surroundings is *cs* .
```bash
  Old text                  Command     New text ~
  "Hello *world!"           cs"'        'Hello world!'
  "Hello *world!"           cs"<q>      <q>Hello world!</q>
  (123+4*56)/2              cs)]        [123+456]/2
  (123+4*56)/2              cs)[        [ 123+456 ]/2
  <div>Yo!*</div>           cst<p>      <p>Yo!</p>
```

##
