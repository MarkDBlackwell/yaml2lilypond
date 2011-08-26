#--unknown-language--@+leo-ver=4-thin
#--unknown-language--@+node:georgesawyer.20110825192845.1920:@shadow README.md
#--unknown-language--@@language plain
#--unknown-language--@<< readme >>
#--unknown-language--@+node:georgesawyer.20110825192845.1922:<< readme >>
#yaml2lilypond

A program to convert music specifications, from YAML format, into LilyPond (input) format.

It is written in Ruby.

##invocation

```bash
cd &lt;directory containing LilyPond movement directories&gt;
yaml2lilypond
```

##requirements

When yaml2lilypond is invoked, each tree below the current directory (in the filesystem) must contain the *.yml files of only a single musical movement (even if there is only one).

The easiest way is to make a subdirectory (in your LilyPond project), e.g., 'all-movements', and place the files pertaining to each musical movement in a separate, ('CHILD') subdirectory under it. For example, if your project were called, 'my-suite', then one of my-suite's filesystem children would be called, 'all-movements', and all-movements' children might be 'adagio', 'minuet' and 'sarabande'.

BTW, in LilyPond, you can and should be using relative paths, for example by specifying in your book.ly:

\#(ly:set-option 'relative-includes #t)

Within each CHILD, there must be a file, 'template.yml' containing, for all the movement's measures:

* time signatures, and
* unique string identifiers

Any other *.yml files are converted to LilyPond input format. The output filenames will have the same full pathnames but with the extension, '.gly' (for 'generated Lilypond').
#--unknown-language--@-node:georgesawyer.20110825192845.1922:<< readme >>
#--unknown-language--@nl
#--unknown-language--@+others
#--unknown-language--@-others
#--unknown-language--@nonl
#--unknown-language--@-node:georgesawyer.20110825192845.1920:@shadow README.md
#--unknown-language--@-leo
