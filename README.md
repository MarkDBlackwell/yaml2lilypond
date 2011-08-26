#yaml2lilypond

A program to convert music specifications from YAML to LilyPond input format.

The program is written in Ruby.

##invocation

cd <directory containing LilyPond movement directories>
yaml2lilypond

#requirements

When yaml2lilypond is invoked, the filesystem trees, starting one level down from the current directory, each must contain the *.yml files of only a single musical movement.

This is so, even if there is only a single movement.

The easiest way to accomplish this is to make a subdirectory of the your LilyPond project, called 'all-movements', and place the files pertaining to each musical movement under or in a sepparate, further subdirectory ('CHILD') inside it. For example, if your project is called, 'my-suite', then 'my-suite's filesystem descendent is 'all-movements' and 'all-movements' descendents are 'adagio', 'minuet' and 'sarabande'.

(Note about relative paths in LilyPond.)


Within each CHILD, there must be a file, 'template.yml' containing, for all the movement's measures:

* time signatures, and
* unique string identifiers

Any other *.yml files are converted to LilyPond input format in a file having the same full pathname but for the extension, '.gly' (generated Lilypond).
s
