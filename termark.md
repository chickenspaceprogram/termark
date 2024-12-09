# termark specification

## Primitives:

<pre>`\replace{a}{b}{src}`</pre>

expands to the text of `src`, with every instance of `a` replaced with an instance of `b`.

<pre>`\def{\macro}{num_args}{expansion}`</pre>

expands to nothing, but creates a new macro called `\macro` that can take `num_args` arguments, and expands to `expansion`. 

Arguments can be accessed with `#1` for the first argument, `#2` for the second, and so on. For example, to concatenate 4 arguments,

`\def{\cat}[4]{#1#2#3#4}` should define a macro called `\cat` that takes 4 arguments. `\cat{This}{is}{a}{test}` should expand to `Thisisatest`.

<pre>`\undef{\macro}`</pre>

Removes `\macro` from the symbol table

<pre>`for{\min}{max}{text}`</pre>

expands to a number of instances of `text`, each with the argument `#i` replaced with a value $v$ such that `min` $\leq v \lt$ `max`. These instances shall occur in sequence, such that the instance where `#i` $=v$ occurs directly before the instance where `#i` $=v+1$.

<pre>`\/` => `/`</pre>
<pre>`\\` => `\`</pre>
<pre>`\ ` => ` `</pre>

### Optional primitives

The following will be provided as compiler options; if it's not intended for these to be expanded they won't be (such as if the output of this is going directly into a source code file to be compiled).

`\n` : Expands to newline<br>
`\r` : Expands to carriage return<br>
`\t` : Expands to tab<br>
`\b` : Expands to backspace<br>
`\f` : Expands to form feed<br>
`\v` : Expands to vertical tab<br>
`\0` : Expands to null character<br>
`\xFF` : Expands to character represented by byte<br>

## Standard macros

The following standard macros shall be defined:

`\def{\esc_spaces}[1]{\replace{ }{}{#1}}` - will require tokenizing all \`\ \` macros beforehand

`\def{\redef}[1]{\undef{\#1}}`

`\def{\bold}[1]{\x1B[1m#1\x1B[22m}`<br>
`\def{\faint}[1]{\x1B[2m#1\x1B[22m}`<br>
`\def{\italic}[1]{\x1B[3m#1\x1B[23m}`<br>
`\def{\under}[1]{\x1B[4m#1\x1B[24m}`<br>
`\def{\blink}[1]{\x1B[5m#1\x1B[25m}`<br>
`\def{\invert}[1]{\x1B[7m#1\x1B[27m}`<br>
`\def{\hidden}[1]{\x1B[8m#1\x1B[28m}`<br>
`\def{\stkout}[1]{\x1B[9m#1\x1B[29m}`<br>

`\def{\draw}[1]{\x1B(0#1\x1B(B}`<br>

`\def{\clrtoend}[0]{\x1B[0J}`<br>
`\def{\clrtocur}[0]{\x1B[1J}`<br>

... keep doing this for all ANSI codes :)))

## termark grammar:

`<text> ::= <char> <text> | <macro> <text> | <comment> <text> | ""`<br>
`<char> ::= [^\]`<br>
`<macro> ::= <id> <args>`<br>
`<args> ::= "{" <text> "}"`<br>
`<id> ::= \[a-zA-Z_][a-zA-Z0-9_]+`

Comments are defined as beginning with // and continuing to the end of the line. They are removed by the `termark` tokenizer, as are all newlines and indentation. Spaces are meaningful in `termark`.

## termark compiler structure

### Tokenizer

1. Tokenizes input into one of the following tokens:<br>
`<char> ::= [^\]`<br>
`<id> ::= [a-zA-Z_][a-zA-Z0-9_]+`<br>
`<space> ::= "\ "`
2. Evaluates `\def` macros and adds their entries to the symbol table
3. Returns errors when an `<id>` is found that is not in the symbol table

### Parser


