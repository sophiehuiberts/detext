# detext

When changing notation in a draft paper, it is very easy to overlook some occurences of the variable/function
you want to rename. Moreover, you can't exactly run `grep a` on your file.

This program is intended to help. It strips everything from a tex file, leaving only the code
that would be set in math mode. Newlines are preserved.

Usage: `cat main.tex | detext | grep -n <regex here>`

Now that the `-n` flag makes `grep` output line numbers for all matches. The resulting line numbers will equal the
corresponding line numbers in the input file. If you want to find all instances of the variable called `a`, you could use the regex `[^a-z]a[^a-z]`.


Supports the following commands and environments for entering and leaving math mode, including `*`-ed versions.
* `$..$`, `$$..$$`, `\[..\]`, `\(..\)`
* `align`
* `equation`
* `flalign`
* `tabular`
* `eqnarray`
* `\mbox`
* `\intertext`

### Installation
Compilation requires having `flex` installed. Compile using `make`, put the resulting binary anywhere in your `$PATH`.


### Version history
* 7/9/19: supports exactly the features required for the draft I'm working on right now.
