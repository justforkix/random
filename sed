
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

# sed commands
's///' command does substitution
'h' command copies the current pattern space to the hold buffer
'g' command copies the hold buffer back to the pattern space
'x' command exchanges teh hold buffer and the pattern space
'p' command forces sed to print the line
'd' command deletes the pattern space for the lines that match 
'H' command ...
'G' command appends a newline \n followed by the contents of the hold buffer to the pattern space
'b'
'D'
't'
'q'
'n' command prints out the current pattern space
'b' command branches execution to the specified named label 
'N' command appends the next line to the current pattern space, separating the next line from the
    current contents of the pattern space by a \n
'=' command operates directly on the output stream and prints the current line number


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

