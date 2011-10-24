#yaml2lilypond

A program to convert music specifications from YAML format into LilyPond (input) format.

The program works, but its tests (it was written as a spike solution) and documentation are<br />
NOT READY YET.

TODO: change invocation to, 'yaml2lilypond'.

Written in Ruby.

##Justification and purpose

Some music, especially some choral music, is largely irregular in measure length. During LilyPond music entry and editing, these measures often are (or could be) joined or split, depending on the source you are working with: especially in early music, or wherever music has been entered in a free way.

In a practical way, yaml2lilypond allows measures to be labeled by (text) strings, instead of (only) by measure numbers.

Given multiple instruments or voice parts, each often carries along or implies several, separate, parallel LilyPond files for various purposes, such as adjusting the piano or organ reduction. Other features which LilyPond doesn't do well yet (completely automatically) might necessitate more of these parallel files.

Whenever there are parallel files, they require careful synchronization of all the measures and measure lengths. What a bother!

Obviously, any time humans find themselves checking and synchronizing with difficulty is a good opportunity for a computer to do it, instead. I found myself in that situation, and that's why I wrote this program.

For all music input files (in YAML format), yaml2lilypond fills each measure with spacer rests, unless told otherwise.

Regarding a LilyPond file whose purpose is just a few measures, this eases synchronization, because you can include only those measures.

When joining and splitting measures, only those LilyPond files which specify something explicitly (for those measures) need be changed. They are changed more simply:
* the measures are easier to find;
* just those couple of labeled measure areas need be changed; and
* measure numbers following them don't need adjusting, because there aren't any.

What is YAML? YAML is a data (storage) format whose noise (extra characters you enter) is very spare. It seems the cleanest for entering LilyPond source (it interferes only minimally) while still allowing measures to be labeled by text strings.

##Invocation

```bash
cd <movements directory>
ruby <directory containing yaml2lilypond>/app/generate.rb
```

If on the Windows command line:

```
cd <movements directory>
ruby "<directory containing yaml2lilypond>/app/generate.rb"
```

##Requirements

Yaml2lilypond requires your LilyPond project files (at least the YAML files) to be organized in a certain way. First, make a directory (e.g., 'movements'). Under this, segregate each music movement's files into its own subdirectory (actually, filesystem tree). Note: if a LilyPond project only has one movement, there nevertheless must be a subdirectory for it.

Before running yaml2lilypond, change your current, working directory to 'movements'.

BTW, to allow relative include paths in LilyPond (useful for movements), insert this line somewhere, such as near the top of book.ly:

```lilypond
#(ly:set-option 'relative-includes #t)
```

For example, a LilyPond project in a directory, 'suite', should have a subdirectory, 'movements'. Under this you might make subdirectories, 'adagio', 'minuet' and 'sarabande':

```
suite
* movements
** adagio
** minuet
** sarabande
```

Within each movement's subdirectory, there must be a file, ('template.yml', in YAML format) describing all the measures (in music order) with:

* Unique string identifiers, and
* Time signatures.

For example, the following is for a movement of two measures, with time signatures 6/4 and 3/2:

```yaml
---
- SomeLabel
- SomeOtherLabel
---
- 6
- - 3
  - 2
...
```

##Results

All  YAML (*.yml) files (except, 'template.yml': see above) are converted to files in LilyPond input format in the same directories. The output files will have the same filenames, but with extension, '.gly' (for 'generated Lilypond').

For reference, and for copying, yaml2lilypond also will generate a useful, sample YAML file in each movement directory ('sample-yaml.txt', based on template.yml), with a spacer rest for each measure.

##Input format

YAML input files for various instruments, voices, or voice 'overlays', etc., can be placed anywhere in the filesystem tree of a given movement. They must start with variable, mode and a prefix for the file. Continuing the example from above:

```yaml
---
variable: someMovementSopranoNotes
mode: relative c''
prefix:
- %

SomeLabel:
- R1*6/4

SomeOtherLabel:
- R1*3/2
...
```

The above would generate:

```lilypond
someMovementSopranoNotes = {
  \relative c'' {
    %
    % SomeLabel
\time 6/4
| R1*6/4 |
    % SomeOtherLabel
\time 3/2
| R1*3/2 |
  }
}
```

Beside measure content ('R1*6/4', above), you can specify measure prefixes and suffixes, or both, e.g.:

```yaml
SomeLabel:
# New relative pitch location.
- prefix
- '} \relative c {'

SomeOtherLabel:
# New section.
- suffix
- \bar "||"
- \tempo "Poco più mosso" 2 = 56
```

You need not give any measure content. Also, you need not include measure labels for all measures. In both cases, a LilyPond spacer rest (for the full measure) will be used.

##YAML notes

If you want, you can include YAML comments. They can start anywhere with a hash character (#).

If you have any characters of '{}#' in a line (except YAML comments) or, as in tremolo, ':' at the end, then everything (after '- ') must be enclosed in single quotes (they will be removed). In that case, for single quotes in the result, you must enter them twice.

Be careful about the final, triple dots. If there are any characters after them, other than your computer's usual end of line sequence (required) you will get a mysterious error message.

Copyright (c) 2011 Mark D. Blackwell. See [MIT-LICENSE](MIT-LICENSE) for details.
