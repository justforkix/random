
Sed reads data from the input stream until it finds the newline character \n. Then it places the data read so far,
without the newline, into the pattern space. Most of the sed commands operate on the data in the pattern space.
The hold buffer is there for your convenience. Think about it as temporary buffer. You can copy or exchange data
between the pattern space and the hold buffer. Once sed has executed all the commands, it outputs the pattern space
and adds a \n at the end.

'-n' switch does not print the pattern space to the output at the end which is the default
'-e' switch can be used to separate sed commands
'-i' swithc forces sed to do in place replacement

'h' command copies the current pattern space to the hold buffer
'g' command copies the hold buffer back to the pattern space
'x' command exchanges teh hold buffer and the pattern space
'p' command forces sed to print the line
'd' command deletes the lines that match

$ sed -n 's/foo/bar/'
'-n' command line switch does not print the pattern space to the output

$ sed -n 's/foo/bar/; p'
'p' switch forces sed to print the line. ';' is used to separate sed commands

$ sed -n -e 's/foo/bar/' -e 'p'
'-e' switch can also be used to separate sed commands

$ sed -i 's/:/;/' users
'-i' swtich forces sed to do in place editing of file

Addresses allow you to restrict sed commands to certain lines, or ranges of lines.

$ sed '5s/foo/bar/'
This limits the s/foo/bar/ only to the 5th line of file or input stream.

$ sed '5!s/foo/bar/'
Inversion that matches all lines except the 5th line

$ sed '5,10s/foo/bar/'
Matches a range of lines 5-10 inclusive

$ sed -n '5,10p'
Print lines 5-10 in the file

$ sed -n '$p'
Prints the last line of the file. Address '$' matches the last line of the file

$ sed -n '/a+b+/p'
Command 'p' gets executed for lines that match the regex

$ sed '/foo/,/bar/d'
Matches all lines between the first line that matches "/foo/" regex and the first
line that matches "/bar/" regex, inclusive. 'd' command deletes the lines that match

$ sed -n '/regex/{x;1!p;x}; h'
Prints the line before the line that matches a regular expression
every line gets copied to the hold buffer with the h command at the end of the script.
However, for every line that matches the /regex/, we exchange the hold buffer with the
pattern space by using the x command, print it with the p command, and then exchange the
buffers back, so that if the next line matches the /regex/ again, we could print the current line.
'1!p' command calls the 'p' command on all the lines that are not the 1st line.

