# Vim commands
1. [vim-surround](#surround)
2. [vim-xml](#xml)
3. [vim-git](#git)
4. [commands](#cmd)

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
## Git <a name="git"></a>
Fugitive is the premier Vim plugin for Git.  Or maybe it's the premier Git
plugin for Vim?  Either way, it's "so awesome, it should be illegal".  That's
why it's called Fugitive.

The crown jewel of Fugitive is `:Git` (or just `:G`), which calls any
arbitrary Git command.  If you know how to use Git at the command line, you
know how to use `:Git`.  It's vaguely akin to `:!git` but with numerous
improvements:

* The default behavior is to directly echo the command's output.  Quiet
  commands like `:Git add` avoid the dreaded "Press ENTER or type command to
  continue" prompt.
* `:Git commit`, `:Git rebase -i`, and other commands that invoke an editor do
  their editing in the current Vim instance.
* `:Git diff`, `:Git log`, and other verbose, paginated commands have their
  output loaded into a temporary buffer.  Force this behavior for any command
  with `:Git --paginate` or `:Git -p`.
* `:Git blame` uses a temporary buffer with maps for additional triage.  Press
  enter on a line to view the commit where the line changed, or `g?` to see
  other available maps.  Omit the filename argument and the currently edited
  file will be blamed in a vertical, scroll-bound split.
* `:Git mergetool` and `:Git difftool` load their changesets into the quickfix
  list.
* Called with no arguments, `:Git` opens a summary window with dirty files and
  unpushed and unpulled commits.  Press `g?` to bring up a list of maps for
  numerous operations including diffing, staging, committing, rebasing, and
  stashing.  (This is the successor to the old `:Gstatus`.)
* This command (along with all other commands) always uses the current
  buffer's repository, so you don't need to worry about the current working
  directory.

Additional commands are provided for higher level operations:

* View any blob, tree, commit, or tag in the repository with `:Gedit` (and
  `:Gsplit`, etc.).  For example, `:Gedit HEAD~3:%` loads the current file as
  it existed 3 commits ago.
* `:Gdiffsplit` brings up the staged version of the file side by side with the
  working tree version.  Use Vim's diff handling capabilities to apply changes
  to the staged version, and write that buffer to stage the changes.  You can
  also give an arbitrary `:Gedit` argument to diff against older versions of
  the file.
* `:Gread` is a variant of `git checkout -- filename` that operates on the
  buffer rather than the file itself.  This means you can use `u` to undo it
  and you never get any warnings about the file changing outside Vim.
* `:Gwrite` writes to both the work tree and index versions of a file, making
  it like `git add` when called from a work tree file and like `git checkout`
  when called from the index or a blob in history.
* `:Ggrep` is `:grep` for `git grep`.  `:Glgrep` is `:lgrep` for the same.
* `:GMove` does a `git mv` on the current file and changes the buffer name to
  match.  `:GRename` does the same with a destination filename relative to the
  current file's directory.
* `:GDelete` does a `git rm` on the current file and simultaneously deletes
  the buffer.  `:GRemove` does the same but leaves the (now empty) buffer
  open.
* `:GBrowse` to open the current file on the web front-end of your favorite
  hosting provider, with optional line range (try it in visual mode).  Plugins
  are available for popular providers such as [GitHub][rhubarb.vim],
  [GitLab][fugitive-gitlab.vim], [Bitbucket][fubitive.vim],
  [Gitee][fugitive-gitee.vim], [Pagure][pagure], and
  [Phabricator][vim-phabricator].

[rhubarb.vim]: https://github.com/tpope/vim-rhubarb
[fugitive-gitlab.vim]: https://github.com/shumphrey/fugitive-gitlab.vim
[fubitive.vim]: https://github.com/tommcdo/vim-fubitive
[fugitive-gitee.vim]: https://github.com/linuxsuren/fugitive-gitee.vim
[pagure]: https://github.com/FrostyX/vim-fugitive-pagure
[vim-phabricator]: https://github.com/jparise/vim-phabricator

Add `%{FugitiveStatusline()}` to `'statusline'` to get an indicator
with the current branch in your statusline.

For more information, see `:help fugitive`.

## Screencasts

* [A complement to command line git](http://vimcasts.org/e/31)
* [Working with the git index](http://vimcasts.org/e/32)
* [Resolving merge conflicts with vimdiff](http://vimcasts.org/e/33)
* [Browsing the git object database](http://vimcasts.org/e/34)
* [Exploring the history of a git repository](http://vimcasts.org/e/35)

## Vim commands <a name="cmd"></a>
* In addition to the above answers, you can use the current vim buffer content as stdin for shell command using :%!.

* For example, suppose you want to filter lines from the current vim window content to contain only those with substring ca inside them. You could use:
```bash
:%! grep ca
```

* From a VIM help mirror:
```bash
:shell        :sh[ell]        start a shell
:!            :!{command}     execute {command} with a shell
```

* Open explorer in current window
```bash
:Ex
```

* Usefull commands
```bash
Ctrl+z - minimize vim window to foreground
fg - bring back vim  from foreground
:noh - disable hightlight last search
```
