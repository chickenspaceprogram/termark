# termark

### A terminal markup language

`termark` is a script written in M4 (a macro processing utility available on UNIX systems) that defines a series of macros for ANSI escape codes.

Some familiarity with M4 is probably beneficial, however it is not necessary to know M4 in order to use this script. In fact, it is likely that `termark` will be rewritten in `lmap`, a macro processing utility that I am developing currently, since I don't like the syntax of M4. I'd prefer macros to always start with a backslash, like \macro, as that provides at least some sort of namespacing to keep users from accidentally using macros. As it is, the macros in termark start with _underscores, which looks like absolute crap but hey.
