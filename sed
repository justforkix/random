https://www.gnu.org/software/sed/manual/sed.html

# Sed reads data from the input stream until it finds the newline character \n. Then it places the data read so far,
without the newline, into the pattern space. Most of the sed commands operate on the data in the pattern space.
The hold buffer is there for your convenience. Think about it as temporary buffer. You can copy or exchange data
between the pattern space and the hold buffer. Once sed has executed all the commands, it outputs the pattern space
and adds a \n at the end.

# Addresses allow you to restrict sed commands to certain lines, or ranges of lines.
# Address '$' matches the last line of the file 

# { ... } - Command grouping executes all the commands in { ... } on the line that matches the restriction

# sed command line switches
'-n' switch does not print the pattern space to the output after it is processed
     The only way to make sed output anything with the -n switch being on is to use a command
     that modifies the output stream directly (these commands are =, a, c, i, I, p, P, r and w)
'-e' switch can be used to separate sed commands
'-i' switch forces sed to do in place replacement
'-r; switch turns on the extended regular expression support

# sed commands
's///' command does substitution. The & in substitution command means "the matched string"
'h' command copies the current pattern space to the hold buffer
'g' command copies the hold buffer back to the pattern space
'x' command exchanges teh hold buffer and the pattern space
'p' command forces sed to print the line if the substitution was made.
    This command is usually only used in conjunction with the -n command-line option. 
'd' command deletes the pattern space for the lines that match, reads the next line in the pattern space,
    aborts the current command and restarts execution of sed commands from the beginning 
'H' command ...
'G' command appends a newline \n followed by the contents of the hold buffer to the pattern space
'D' command deletes from the start of the input till and including the first newline and then resumes
    editing with the first command in the script. It creates a loop. Same as 'd' without newline.
't' command branches to a named label if the last substitute command modified the pattern space
'q' command exits sed without processing any more commands or input. Note that the current pattern space is
    printed if auto-print is not disabled with the -n options. 
'n' command prints the pattern space if auto-print is not disabled, then, regardless, replace the pattern space
    with the next line of input. If there is no more input then sed exits without processing any more commands. 
'b' command branches execution to the specified named label 
'N' command appends the next line to the current pattern space, separating the next line from the
    current contents of the pattern space by a \n
'=' command operates directly on the output stream and prints the current line number
'P' command prints out the portion of the pattern space up to the first newline
'y' command transliterates any characters in the pattern space which match any of the
    source-chars with the corresponding character in dest-chars.

# Don't print the pattern space to the output
$ sed -n 's/foo/bar/'
'-n' command line switch does not print the pattern space to the output

# Print the line
$ sed -n 's/foo/bar/; p'
'p' switch forces sed to print the line. ';' is used to separate sed commands

# Separate sed commands
$ sed -n -e 's/foo/bar/' -e 'p'
'-e' switch can also be used to separate sed commands

# In place file editing
$ sed -i 's/:/;/' users
'-i' swtich forces sed to do in place editing of file

# Limit to a particular line of the file
$ sed '5s/foo/bar/'
This limits the s/foo/bar/ only to the 5th line of file or input stream.

# Match all lines except a given line
$ sed '5!s/foo/bar/'
Inversion that matches all lines except the 5th line

# Match a range of lines inclusive
$ sed '5,10s/foo/bar/'
Matches a range of lines 5-10 inclusive

# Print a range of lines in a file
$ sed -n '5,10p'
Print lines 5-10 in the file

# Print the last line of the file
$ sed -n '$p'
Prints the last line of the file. Address '$' matches the last line of the file

# Print lines that match a regex
$ sed -n '/a+b+/p'
Command 'p' gets executed for lines that match the regex

# Match and delete lines within regex match range
$ sed '/foo/,/bar/d'
Matches all lines between the first line that matches "/foo/" regex and the first
line that matches "/bar/" regex, inclusive. 'd' command deletes the lines that match

# Prints the line before the line that matches a regular expression
$ sed -n '/regex/{x;1!p;x}; h'
Every line gets copied to the hold buffer with the h command at the end of the script.
However, for every line that matches the /regex/, we exchange the hold buffer with the
pattern space by using the x command, print it with the p command, and then exchange the
buffers back, so that if the next line matches the /regex/ again, we could print the current line.
'1!p' command calls the 'p' command on all the lines that are not the 1st line.

# Double space a file
$ sed G
One newline is added by the 'G' command and the other implicitly by sed’s printing mechanism.
Here the hold buffer is empty all the time

# Double-space a file which already has blank lines in it
$ sed '/^$/d;G'
The empty lines contain just the newline character, so after they have been put into the pattern space,
this newline character has been removed and the pattern space stays empty. The regular expression /^$/
matches an empty pattern space and sed applies the d command on it. The d command deletes the current
pattern space, reads in the next line, puts it into the pattern space, aborts the current command, and
starts the execution from the beginning.

# Triple-space a file
$ sed 'G;G'

# Undo double spacing
$ sed 'n;d'
The n command prints out the current pattern space (unless the -n command line flag has been specified),
empties the current pattern space and reads in the next line of input. The d command deletes the current
pattern space, reads in the next line, puts the new line into the pattern space and aborts the current
command, and starts the execution from the first sed command.

# Insert a blank line above every line that matches "regex"
$ sed '/regex/{x;p;x;}'
A line is read in pattern space. If it matches /regex/, then the x command exchanges it with the empty hold buffer.
Next the p command prints out emptiness followed by a newline, so we get an empty line printed before the actual line.
Then x exchanges the hold buffer (which now contains the line) with pattern space again. There are no more commands so
sed prints out the pattern space.

# Insert a blank line below every line that matches "regex"
$ sed '/regex/G'

# Insert a blank line above and below every line that matches "regex"
sed '/regex/{x;p;x;G;}'

# Join all lines 
$ sed ':a; $s/\n/ /g; N; ba'    // using 'tr' utility $ tr '\n' ' ' < file
The :a creates a named label a, which you can branch to with the b command. The $ before the command restricts
this command only to the last line of input. Then the N command appends the next line to the current pattern space,
separating the next line from the current contents of the pattern space by a \n. Finally the ba command branches to
label a. This process repeats until at one moment N command reads the final line of input.

# Duplicate all lines
$ sed 'p'
Each line gets printed twice, the first time with the p command, which prints the pattern space,
and then the second time implicitly by sed because the end of the script is reached.

# Substitue with newline in plain Old sed
$ sed 's/,/\
/g'
Break the sed command into two lines to include the literal newline in the command

# Number each line of file
$ sed = file.txt | sed 'N;s/\n/\t/'
The first one-liner uses a new command =. This command operates directly on the output stream and prints the current line number.
There is no way to capture the current line number to pattern space. That’s why the second one-liner is needed.
The second one-liner uses the N command. The N command appends a newline and the next line to the current pattern space
to join the line containing the line number with the actual line. Then the famous substitute s/// command gets executed

# Number each line of a file and right align the number
$ sed = file.txt | sed 'N; s/^/     /; s/ *\(.\{6,\}\)\n/\1: /'
The first 's' command appends 5 whitespace chars to the beginning of the line. The second 's' command captures at least six symbols
up to the newline and replaces the capture and the newline with the back-reference, followed by colon and a space.
The second 's' command matches some whitespace chars followed by at least 6 other characters followed by a newline.

# Number each non-empty line of a file
$ sed '/./=' file.txt | sed '/./N; s/\n/ /'
The regular expression /./ matches lines with at least one char in them. When the empty lines (containing just the newline)
get sent to the pattern space, the newline character gets removed, so the empty lines do not get matched.

# Count the number of lines in a file (wc -l)
$ sed -n '$='
The '-n' switch only outputs the pattern space if used with a command that modifies the output stream directly such as '='
The restriction pattern $ means "the last line of the file", so it applies the = command only to the last line.

# Convert DOS/Windows newlines (CRLF) to Unix newlines (LF)
$ sed 's/.$//'
Once the line gets read into the pattern space, the newline gets thrown away, so we are left with lines ending in CR.
The s/.$// command erases the last character by matching the trailing character of the line (regex .$) and substituting
it with nothing. Now when the pattern space gets output, a newline gets appended at the end and we are left with lines ending in LF.

$sed 's/^M$//'
Erases the carriage return (Ctrl-v + Ctrl-m) character.

$sed 's/\x0D$//'
Using version of sed that supports hex escape codes, CR is 0x0D.

# Convert Unix newlines (LF) to DOS/Windows newlines (CRLF)
$ sed "s/$/`echo -e \\\r`/"
The echo -e \\\r command inserts a literal carriage return character in the sed expression.

$ sed 's/$/\r/'
GNU sed can take escape characters in the replace part of the s/// command.

# Convert Unix newlines to DOS/Windows newlines from DOS/Windows
$ sed 's/$//"
A smart sed interpreter on Windows recognizes that the file is ending just in LF char and drops it when putting line
in the pattern space. The one-liner s/$// is basically a no-op one-liner. It replaces nothing with nothing and then 
sends out the line to output stream where it gets CRLF appended on Windows

Also no-op one-liners
$ sed -n p
$ sed ''
$ sed ':'  // Here the : char is an unnamed label

# Delete leading whitespace (tabs and spaces) from each line
$ sed 's/^[ \t]*//'
$ sed 's/^[[:blank:]]*//'

# Delete trailing whitespace (tabs and spaces) from each line
$ sed 's/[ \t]*$//'
$ sed 's/[[:blank:]]*$//'

# Delete both leading and trailing whitespace from each line (trim)
$ sed 's/^[ \t]*//; s/[ \t]*$//'
$ sed 's/^[[:blank:]]*//; s/[[:blank:]]*$//'

# Insert five blank spaces at the beginning of each line
$ sed 's/^/     /'  

# Align lines right on a 79-column width
$ sed -e :a -e 's/^.\{1,78\}$/ &/' -e ta
The substitute command left-pads the string (right aligns it) a single whitespace at a time, 
until the total length of the string exceeds 78 chars. The & in substitution command means "the matched string"

# Center all text in the middle of 79-column width
$ sed  -e :a -e 's/^.\{1,77\}$/ & /' -e 'ta'  
Pad on both sides of match until 77 chars. Two whitespaces added in last iteration

$ sed  -e :a -e 's/^.\{1,77\}$/ &/; ta' -e 's/\( *\)\1/\1/'
The additional s/\( *\)\1/\1/ command gets executed which divides the leading whitespace "in half".
It matches \( *\)\1, which means "match as many spaces as possible \( *\), followed by the same number of spaces \1.

# Substitute (find and replace) the 4th occurrence of "foo" with "bar" on each line
$ sed 's/foo/bar/4'
With no flags the first occurrence of pattern is changed.

# Substitute (find and replace) all occurrence of "foo" with "bar" on each line
$ sed 's/foo/bar/g'

# Substitute (find and replace) the first occurrence of a repeated occurrence of "foo" with "bar"
$ sed 's/\(.*\)foo\(.*foo\)/\1bar\2/'
Uses two regex capturing groups

# Substitute (find and replace) only the last occurrence of "foo" with "bar"
$ sed 's/\(.*\)foo/\1bar/'
Since .* is a greedy regular expression (matches as much as possible), it captures everything up to the last "foo".

# Substitute all occurrences of "foo" with "bar" on all lines that contain "baz"
$ sed '/baz/s/foo/bar/g'
Uses a regular expression to restrict the substitution to lines matching "baz"

# Substitute all occurrences of "foo" with "bar" on all lines that do not contain "baz"
$ sed '/baz/!s/foo/bar/g'

# Change text "scarlet", "ruby" or "puce" to "red"
$ sed 's/scarlet/red/g;s/ruby/red/g;s/puce/red/g'
$ sed 's/scarlet\|ruby\|puce/red/g'

# Reverse order of lines (emulate "tac" Unix command)
$ sed '1!G;h;$!d'
The first command G gets applied to all the lines which are not the first line.
The second command h gets applied to all lines.
The third command d gets applied to all lines except the last one.

$ sed -n '1!G;h;$p'
This one-liner silences the output with the -n switch and forces the output with p command only at the last line.
There is a correspondence between p and !d, when using -n switch.

# Reverse a line (emulates "rev" Unix command) 
$ sed '/\n/!G;s/\(.\)\(.*\n\)/&\2\1/;//D;s/.//'
/\n/!G means if there is no newline in your input stream, then you append one at the end.

s/\(.\)\(.*\n\)/&\2\1/ is a simple s/// expression which captures the first character as \1
and all the others as \2. Then it replaces the whole matched string with &\2\1, where & is the whole matched text (it’s \1\2).

//D in this one-liner an empty pattern // matches the last existing regex, so it’s exactly the same as /\(.\)\(.*\n\)/D
When /\(.\)\(.*\n\)/ fails then sed goes to the next command.

s/.// removes the first character in the pattern space which is the newline char.

# Join pairs of lines side-by-side (emulates "paste" Unix command)
$ sed '$!N;s/\n/ /'

# Append a line to the next if it ends with a backslash
$ sed -e :a -e '/\\$/N; s/\\\n//; ta'
The first expression :a creates a named label a. The second expression joins the current line with the line following it
using the N command if the current line ends with a backslash \. s/\\\n// command erases the slash and the newline between
the joined lines. If the substitution was successful we branch to the beginning of expression with the ta command, and do
the same again, hoping that we might have another backslash. If the substitution was not successful, the line did not end
with a backslash, and we just print it out.

# Append a line to the previous if it starts with an equal sign
$ sed -e :a -e '$!N;s/\n=/ /;ta' -e 'P;D'

# Digit group (commify) a numeric string
$ sed -e :a -e 's/\(.*[0-9]\)\([0-9]\{3\}\)/\1,\2/;ta'
$ sed ':a;s/\B[0-9]\{3\}\>/,&/;ta'  // gnu sed
'\B' matches anywhere except at the word boundary (it means it doesn’t match at the beginning of a new word;
it matches between first and second character in a word). The second pattern '\>' matches the null string
at the end of the word. It’s necessary because we need to match the right-most three digits.

# Add commas to numbers with decimal points and minus signs
$ sed -r ':a; s/(^|[^0-9.])([0-9]+)([0-9]{3})/\1\2,\3/g; ta'  // gnu sed
It turns on the extended regular expression support with the -r switch. The first group (^|[^[0-9.]) makes sure we
ignore the leading non-digit characters, such as "+" or "-". If there are no leading non-digit characters, then it
just anchors at the beginning of the string ^, which always matches.

# Add a blank line after every five lines
$ sed 'n;n;n;n;G'
Each time 'n' is called it prints out the current pattern space, empties it and reads in the next line of input.
The G command appends a newline to the fifth line, since this is the last command, the 5th line gets printed out
with two newlines at the end.

$ sed '0∼5G'  // gnu sed "step address" extension start∼|step
It matches every step-th line starting with line start. Since we don't want to match the first line we start with 0.
The 'G' command adds the newline to the matched text.

# Uppercase all letters of every line
$ sed 's/.*/\U&/'
The \U extension in the substitution part of the s/// command that uppercases all the text after it.
Here the .* matches the whole line, the & stands for the matched part (whole line) and \U& uppercases everything.


# Uppercase the first letter of every line
$ sed 's/.*/\u&/'
The \u extension turns the next character to uppercase

# Lowercase all letters of every line
$ sed 's/.*/\L&/'
The \L extension that lowercases the text after it

# Lowercase the first letter of every line
$ sed 's/.*/\l&/'
The \l extension lowercases the first character after it

# Duplicate every word on every line
$ sed 's/\([^ ]\+\)/\1 \1/g'
The g flag at the end makes it do it globally, that is, for all words.

$ sed 's/\(\w\+\)/\1 \1/g'   // gnu sed
$ sed -r 's/(\w+)/\1 \1/g'   // avoid excessive backslashes by enabling extended regex

# Remove all punctuation from every line
$ sed 's/[!-/:-@[-`{-∼]//g'    // listing ranges of punctuation characters
$ sed 's/[[:punct:]]//g'
The [:punct:] is a class of all punctuation characters and the other pair of [ ] around the class
makes sure that all the characters in the class are matched.

# ROT13 encode every line
$ sed 'y/abcdefghijklmnopqrstuvwxyz/nopqrstuvwxyzabcdefghijklm/y/ABCDEFGHIJKLMNOPQRSTUVWXYZ/NOPQRSTUVWXYZABCDEFGHIJKLM/'

# Print the first 10 lines of a file (emulates "head -10")
$ sed 10q
This command gets executed only when sed reads the 10th line. For all the other lines there
is no command specified. When there is no command specified, the default action is to print the line as-is.
The 'q' command actually prints the contents of pattern space and only then quits.

# Print the first line of a file (emulates "head -1")
sed q          // quits after printing the pattern space

# Print the last 10 lines of a file (emulates "tail -10")
sed -e :a -e '$q;N;11,$D;ba'
It always keeps the last 10 lines in the pattern space and at the very last line of input it quits and prints them.
The 11,$D command executes the D command if the current line number is greater than or equal to 11.
The D command deletes the portion of pattern space up to the first new line character.


