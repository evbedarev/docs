# Vim commands
1. [vim-surround](#surround)
2. [vim-xml](#xml)

## vim-surround <a name="surround"></a>
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

## xml-plugin<a name="xml"></a>
- Help
```bash
Read the help documentation by typing from within vim  :help xml-plugin
```
- Create tag from word
```bash
;;              make element out previous word and close it         {{{2
          - when typing a word;; wil create <word>|</word>
            when word on its own line it will be
            <word>
               |
            </word>
```
- Navigation(<LocalLeader> is backslash "\")
```bash
          [[        Goto to the previous open tag 
          ]]        Goto to the next open tag 
          []        Goto to the previous close tag 
          ][        Goto to the next  close tag 
          ["        Goto to the next  comment
          ]"        Goto the previous comment
<LocalLeader>5  Jump to the matching tag.                           {{{2
<LocalLeader>%  Jump to the matching tag.   


<LocalLeader>c  Rename tag                                          {{{2

<LocalLeader>C  Rename tag and remove attributes                    {{{2
    Will ask for attributes
```
- Delete tags
```bash
<LocalLeader>d  Deletes the surrounding tags from the cursor.       {{{2
            <tag1>outter <tag2>inner text</tag2> text</tag1>
Turns to:  outter <tag2>inner text</tag2> text


<LocalLeader>D  Deletes the tag and it contents                     {{{2
        - and put it in register x.
            <tag1>outter <tag2>inner text</tag2> text</tag1>
       Turns to:  <tag1>outter text</tag1>
```
- provide endtag for open tags.

```bash
<LocalLeader>e  provide endtag for open tags.                       {{{2
        - provide endtag for open tags. Watch where de cursor is
            <para><listitem>list item content
                                            |
        pressing \e twice produces
            <para><listitem>list item content</para></listitem>
```

- Fold tags
```bash
<LocalLeader>f  fold the tag under the cursor                       {{{2
          <para>
            line 1
            line 2
            line 3
          </para>
        \f produces
        +--  5 lines: <para>--------------------------

<LocalLeader>F  all tags of name 'tag' will be fold.                {{{2
      - If there isn't a tag under
        the cursor you will be asked for one.
```
- Ident all tags
```bash
<LocalLeader>I  Indent all tags     {{{2
      - will create a multiline layout every opening tag will be shifted out
        and every closing tag will be shifted in. Be aware that the rendering
        of the XML through XSLT and/or DSSSL, might be changed by this.
        Be aware tha if the file is big, more than 1000 lines, the reformatting
        takes a long time because vim has to make a big undo buffer.
        For example using \I on the example below:
        
        <chapter><title>Indent</title><para>The documentation</para></chapter>

      - Becomes

        <chapter>
          <title>
            Indent
          </title>
          <para>
            The documentation
          </para>
        </chapter>
```
