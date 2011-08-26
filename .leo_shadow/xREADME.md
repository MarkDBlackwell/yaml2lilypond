#--unknown-language--@+leo-ver=4-thin
#--unknown-language--@+node:georgesawyer.20110825192845.1920:@shadow README.md
#--unknown-language--@@language plain
#--unknown-language--@<< readme >>
#--unknown-language--@+node:georgesawyer.20110825192845.1922:<< readme >>
#yaml2lilypond

A program to convert music specifications, from YAML format into LilyPond (input) format.

It is written in Ruby.

##invocation

cd <directory containing LilyPond movement directories>
yaml2lilypond

#requirements

When yaml2lilypond is invoked, each filesystem tree, starting one level below the current directory, must contain the *.yml files of only a single musical movement: even if there is only one movement.

The easiest way is to make a subdirectory (in your LilyPond project) called 'all-movements', and place the files pertaining to each musical movement in a further, separate, subdirectory ('CHILD') under it. For example, if your project were called, 'my-suite', then one of 'my-suite's filesystem descendents would be called, 'all-movements', and 'all-movements' descendents might be 'adagio', 'minuet' and 'sarabande'.

BTW, in LilyPond, you should be using relative paths by specifying, in your (e.g.) book.ly:

#(ly:set-option 'relative-includes #t)

Within each CHILD, there must be a file, 'template.yml' containing, for all the movement's measures:

* time signatures, and
* unique string identifiers

Any other *.yml files are converted to LilyPond input format using an output filename having the same full pathname but the extension, '.gly' (for 'generated Lilypond').
#--unknown-language--@-node:georgesawyer.20110825192845.1922:<< readme >>
#--unknown-language--@nl
#--unknown-language--@+others
#--unknown-language--@-others
#--unknown-language--@nonl
#--unknown-language--@-node:georgesawyer.20110825192845.1920:@shadow README.md
#--unknown-language--@-leo
