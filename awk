
=============
Awk
=============
Awk consists of pattern-action statements. In each statement the pattern or action can be missing.
If pattern is missing the action is applied to every line of input.
If action is missing it is equivalent to {print}.

% awk 'pattern {action}; pattern {action}' file.txt
% awk [ -F fs ] [ -v var=value ... ] 'program' [ -- ] [ var=value ... ] [ file(s) ]
% awk [ -F fs ] [ -v var=value ... ] -f programfile [ -- ] [ var=value ... ] [ file(s) ]

# -f option to run programs in files or include libraries
# -v initialize awk variables the take effect before the program is started
# if no filename is specified awk reads the stdin
# -- indicates there are no further command line options for awk. Any following options are available to your program
# -F is the default field separator
# filename '-' represents standard input

% awk -F '\t' '{ ... }' files FS="[\f\v]" files  // -F is applied to first group of files and value assigned to FS is applied to second group of files
% awk '{...}' Pass=1 *.tex Pass=2 *.tex  // processes list of files twice, once with Pass set to 1 and second time with Pass set to 2

* -F:    - splits line on ':' . Expects a character, string or regex to split the line into fields $1,$2,...
* ARGC   - CLI argument count
* ARGV   - CLI argument values. ARGV[0] is 'awk'. Arguments associated with -f and -v options are not available
* ENVIRON - Read-only array gives access to environment variables.
* NR     - current line number
* NF     - number of fields on the current line
* FNR    - file line number. current line number for each file separately
* FS     - field separator. Default is single space meaning one or more whitespace characters. Leading and trailing whitespace is ignored
           set FS="[ ]" to match exactly one space. Leading and trailing whitespace is not ignored. When FS is an empty string each character
	   is a separate field. awk -F ":" is same as awk 'BEGIN { FS=":" }'
* $0     - entire line without the trailing '\n' character as read from the input stream
* $1     - first field
* $NF    - last field
* RS     - Input Record Separator. Newline by default. gawk allows regex as RS. Here RT can be used to determine the text that matches the separator
* ORS    - Output Record Separator. Newline by default
* OFS    - Output Field Separator. Whitespace by default
* print  - with no argument is equal to print $0. Each print statement is followed by ORS. Accepts list of arguments separated by commas.
* printf - formatted print. Not followed by ORS
* BEGIN  - Special pattern not tested against input. It is executed before any input is read
* END    - Special pattern not tested against input. It is executed after all input is read
* next   - Skip execution of statements after 'next'  for the current input line. Start execution with the first statement for the next input line
* nextfile - Skip execution for current input file. Supported by gawk
* getline t - reads the next line from input and stores it in variable t and update NF, NR, FNR. getline by itself sets the next line in $0
* in     - tests if value is in the array. eg. $0 in a 
* length - length([str]), returns the length of the string or length of $0 if no string is specified
* int    - int(-3.14) returns integer part of argument -3  
* 'pattern1, pattern2' - Range pattern. Selects all records matching  pattern1 upto and including  pattern2. If both expressions match a record
                         the selection consists of that single record.
* split  - split(str, arr, regex). Create an array from string
* delete array[index] - removes element from the array
* delete array - removes all elements from the array
* FILENAME - name of the current input file being processed
* exit   - Skip further execution and quit awk

# Print the current input record $0 to standard output
% awk 1
% awk NR > 0 { print }
% awk 1      { print }
% awk        { print }
% awk        { print $0 }
       

# String concatenation
s = "A" "BC" "D"
t = s s s

# Convert a number to a string by concatenating with an empty string
a = 123
s = "" a

# Convert a string to a number by adding 0. All numbers in awk are floating point values
s = "123"
n = s + 0    // 123
s = "ABC"
n = s + 0    // 0

# Matching regex
"ABC"  ~ "^[A-Z]+$"
"ABC" !~" ^[A-Z]+$"
"ABC" ~  /^[A-Z]+$/

# Ternary operation
a = (u>w) ? x^3 : y^7

# Arrays are associative
telephone["Alice"] = "555-0134"

# Multi index arrays
// simulates multi-dim arrays by treating comma separated indices as a single string.
// It replaces comma by unprintable string stored in builtin variable SUBSEP whose default value is '\034'
print maildrop[53, "Oak Lane", "T4Q 7XV"]                   // all same
print maildrop["53" SUBSEP "Oak Lane" SUBSEP "T4Q 7XV"]
print maildrop["53\034Oak Lane\034T4Q 7XV"]

# Test array membership
if ("Sally" in telephone)
         print "Sally is in the directory"

if (telephone["Sally"] != "")                  // incorrect! adds an entry with an empty value
         print "Sally is in the directory"

# For loops
for (k = n; k >= 1; k--)
  statement

for (name in telephone)
      print name "\t" telephone[name]


# Getline
nwords = 1
while ((getline words[nwords] < "/usr/dict/words") > 0)
  nwords++


"date" | getline now
close("date")                 // close the command pipeline at the end
print "The current time is", now

command = "head -n 15 /etc/hosts"
while ((command | getline s) > 0)
  print s
close(command)

for (name in telephone)
  print name "\t" telephone[name] | "sort"
close("sort")

tmpfile = "/tmp/telephone.tmp"
command = "sort > " tmpfile
for (name in telephone)
  print name "\t" telephone[name] | command
close(command)                                     // close pipeline command
while ((getline < tmpfile) > 0)
  print
close(tmpfile)                                     // close file

# system() function
There is no need to call close() for commands run by system(), because close()is only for files or pipes opened with the I/O
redirection operators and getline, print, or printf.
tmpfile = "/tmp/telephone.tmp"
for (name in telephone)
  print name "\t" telephone[name] > tmpfile
close(tmpfile)
system("sort < " tmpfile)

system("rm -f " tmpfile)
system("cat <<EOFILE\nuno\ndos\ntres\nEOFILE")

# FS - Input Field Separator. Splits the line into fields accessed via $1,$2,$3... variables. One or more spaces by default
% awk -F: '{print $1}'                 // using command line option -F
% awk 'BEGIN { FS=":" } {print $1}'    // set FS variable using BEGIN block
% awk -v FS=: '{print $1}'             // set FS variable using command line option '-v var-val'

# OFS - Output Field separator. Used to separate fields $1,$2,$3... when they get printed. Space by default.
% awk -v OFS=: '{ print $1, $3 }'
% echo 'one two three four' | awk '{ OFS = "\n"; print $0 }' // changing the OFS without asigning any field does not alter $0
% awk -v OFS=- '{ $1=$1; print }'  // if you modify any of the fields the whole line gets recomputed in the $0 variable and fields get separated by OFS

# NF - Number of Fields on the current line
% awk '{ print NF }'
% awk -F- '{ print NF }'    // update the field separator

# NR - Number of Records seen so far i.e current line number
% awk '{ print NR ". " $0 }'

# RS - Input Record Separator. Used to split the input into records. Newline by default
% awk 'BEGIN { RS=":" } { print }'

# ORS - Output Record Separator. Gets output after each record. Newline by default
% awk -v ORS=" X " '{ print }' | sed 's/ X $//'     // remove the last 'X'

# print each line in file
% awk '1'                                // pattern '1' is true and default action is print $0
% awk 1

# Read each line from file, split it on colon and print the first field
% awk -F: '{print $1}'

# Number the lines in a file
% awk '{ print NR ". " $0 }'             // string concatenation

# Add a blank line between lines
% awk '1; { print "" }'                  // '{print ""}' is not same as '{print}'
% awk '1 { print }; { print "" }'
% awk '{ print }; { print "" }'          // '1' as pattern means true
% awk '{ print } { print "" }'           // drop semicolon between two separate actions
% awk '{ print; print "" }'              // join two actions with same pattern
% awk '{ print $0 "\n" }'
% awk 'BEGIN { ORS="\n\n" }; 1'

# Filter out empty lines so no more than one blank line appears between lines of text
% awk 'NF { print $0 "\n" }'

# Add two blank lines between lines
% awk '1; { print "\n" }'
% awk '{ print; print "\n" }'
% awk '{ print } { print "" } { print "" }'
% awk '{ print; print ""; print "" }'
% awk '{ print $0 "\n\n" }'

# Join all lines
% awk '{ printf "%s ", $0 }'
% awk 'BEGIN { ORS=" " } { print }'
% awk 'BEGIN { ORS=" " } 1'
% awk -v ORS=" " 1                         // '-v' command line argument used to set variables

# Change default column separator
% awk -F: -v 'OFS=:' '{print $1, $5}'      // split fields by colon and print fields separated by colon 

# Number lines in each file separately
% awk '{ print FNR "\t" $0 }'

# Number lines for all files together
% awk '{ print NR "\t" $0 }'

# Number lines in custom format
% awk '{ printf("%5d : %s\n", NR, $0) }'          // right align, new line since printf not followed by ORS
% awk '{ printf("%-5d : %s\n", NR, $0) }'         // left align

# Number only non blank lines in files
% awk 'NF { $0=++a " :" $0 ; print }'             // awk variables come into existence when first used

# Count lines in files
% awk 'END { print NR }'

# Print sum of fields in every line
% awk '{ s = 0; for (i = 1; i <= NF; i++) s+=+$i; print s }'

# Print sum of fields in all lines
% awk '{ for (i = 1; i <= NF; i++) s = s+$i }; END { print s+0 }'  // 'print s+0' since s is undefined if there are no fields. undef+0 is 0

# Replace every field by its absolute value
% awk '{ for (i = 1; i <= NF; i++) if ($i < 0) $i = -$i; print }' // use curly braces with 'for' and 'if' for clarity. 'i=5; $i=3' sets 5th field to 3

# Count total number of fields (words) in a file
% awk '{ total = total + NF }; END { print total+0 }'

# Print total number of lines containing word 'Hello'
# awk '/Hello/ { n++ }; END { print n+0 }'                    // regular expression match

# Find the line containing the largest numerical first field
% awk '$1 > max { max=$1; maxline=$0 }; END { print max, maxline }'  // comparison in pattern instead of 'if'

# Find the line containing the largest numerical first field if all values are negative
% awk 'NR == 1 { max = $1; maxline = $0; next; } $1 > max { max=$1; maxline=$0 }; END { print max, maxline }'

# Print number of fields in each line followed by line
% awk '{ print NF ":" $0 }'

# Print the last field of each line
% awk '{ print $NF }'

# Print the last field of the last line
% awk '{ field = $NF }; END { print field }'
% awk 'END { print $NF }'

# Print every line with more than four fields
% awk 'NF > 4'

# Print every line where the value of the last field is greater than four
% awk '$NF > 4'

# Convert windows newlines CRLF to unix newlines LF
% awk '{ sub(/\r$/,""); print }'    // sub(regex, repl, [string]) if string is ommited $0 is used, ORS add '\n'

# Convert unix newlines LF to windows newlines CRLF
% awk '{ sub(/$/,"\r"); print }'    // ORS adds '\n'

# Delete leading whitespace from the beginning of each line
% awk '{ sub(/^[ \t]+/, ""); print }'

# Delete trailing whitespace from the end of each line
% awk '{ sub(/[ \t]+$/, ""); print }'

# Delete both leading and trailing whitespaces from each line
% awk '{ gsub(/^[ \t]+|[ \t]+$/, ""); print }'

# Remove whitespace between fields
% awk '{ $1=$1; print }'  // when you change a field, awk rebuilds $0 variable by concatenating all fields seperated by OFS

# Insert 5 blank spaces at the beginning of each line
% awk '{ sub(/^/, "     "); print }'

# Right text align
% awk '{ printf "%79s\n", $0 }'

# Center all text on a 79 character width
% awk '{ l=length(); s=int((79-l)/2); printf "%"(s+l)"s\n", $0 }'

# Find and replace "foo" with "bar" on each line
% awk '{ sub(/foo/,"bar"); print }'    // replaces first match. modifies string in place
% awk '{ gsub(/foo/,"bar"); print }'   // replace all. modifies string in place

# Replace the 4th match of "foo" with "bar"
% gawk '{ $0 = gensub(/foo/,"bar",4); print }'  // gensub(regex, s, h[, t]), h=4 and t=$0. Does not modify in place. Supported in GNU awk

# Substitue "foo" with "bar" only on lines that contain "baz"
% awk '/baz/ { gsub(/foo/, "bar") }; { print }'

# Substitue "foo" with "bar" only on lines that don't contain "baz"
% awk '!/baz/ { gsub(/foo/, "bar") }; { print }'

# Change "scarlet" or "ruby" or "puce" to "red"
% awk '{ gsub(/scarlet|ruby|puce/, "red"); print}'

# Reverse order lines
% awk '{ a[i++] = $0 } END { for (j=i-1; j>=0;) print a[j--] }'

# Join a line ending with a backslash with the next line
% awk '/\\$/ { sub(/\\$/,""); getline t; print $0 t; next }; 1'

# Print and sort the login names of all users
% awk -F ":" '{ print $1 | "sort" }' /etc/passwd    // awk -F ":" is same as awk 'BEGIN { FS=":" }'

# Print first two fields in reverse order on each line
% awk '{ print $2, $1 }'  

# Swap the first field with the second on every line
% awk '{ temp = $1; $1 = $2; $2 = temp; print }'

# Delete the second field on each line
% awk '{ $2 = ""; print }'

# Print the fields in reverse order on every line
% awk '{ for (i=NF; i>0; i--) printf("%s ", $i); printf("\n") }'

# Remove duplicate consecutive lines
% awk 'a != $0; { a = $0 }'

# Remove duplicate, non consecutive lines
% awk '!a[$0]++'
% awk '!($0 in a) { a[$0]; print }'    // a[$0] creates an element in the array

# Concatenate every 5 lines of input with a comma
% awk 'ORS=NR%5?", ":"\n"'

# Print the first 10 lines of a file
% awk 'NR < 11'

# Exit after printing first 10 lines of a file
% awk '1; NR == 10 { exit }'

# Print the first line of a file
% awk 'NR > 1 { exit }; 1'
% awk 'NR == 1 { print; exit }'

# Print the last two lines of a file
% awk '{ y=x "\n" $0; x=$0 }; END { print y }'  // ineffective, use tail -2

# Print the last line of a file
% awk 'END { print }'                  // incompatible, ineffective, use tail -1
% awk '{ rec=$0 } END{ print rec }'

# Print only the lines that match a regular expression
% awk '/regex/'            // missing action is equal to { print }

# Print only the lines that do not match the regular expression
% awk '!/regex/'

# Print the line immediately before a line that matches a regex
% awk '/regex/ { print x }; { x=$0 }'    // does not work if first line matches regex
% awk '/regex/ { print (NR==1 ? "match on line 1" : x) }; { x=$0 }'

# Print the line immediately after a line that matches a regex
% awk '/regex/ { getline; print }'

# Print lines that match any of "AAA" or "BBB" or "CCC"
% awk '/AAA|BBB|CCC/'

# Print lines that contain "AAA", "BBB" and "CCC" in this order
% awk '/AAA.*BBB.*CCC/'

# Print only lines that are 65 characters in length or longer
% awk 'length > 64'

# Print a section of file from regular expression to end of file
% awk '/regex/,0'           // uses range pattern. pattern1 is /regex/ and pattern 2 is 0 (false), therefore never matches and continues to end of file.

# Print lines 8 to 12 inclusive
% awk 'NR==8,NR==12'        // uses range pattern

# Print line number 52
% awk 'NR==52 { print; exit }'

# Print section of file between two regular expressions (inclusive)
% awk '/Iowa/,/Montana/'

# Print all lines where 5th field is equal to "abc123"
% awk '$5 == "abc123"'

# Print all lines where 5th field is not equal to "abc123"
% awk '$5 != "abc123"'
% awk '!($5 == "abc123")'

# Print all lines whose 7th field matches a regex
% awk '$7 ⇠ /^[a-f]/'

# Print all lines whose 7th field doesn't match a regex
% awk '$7 !⇠ /^[a-f]/'
% awk '$7 ⇠ /^[^a-f]/'

# Delete all blank lines from a file
% awk NF
% awk '/./'    // matches any single character

# Create a string of specific length ('x's of length 500)
% awk 'BEGIN { while (a++<513) s=s "x"; print s }'

# Insert a string of specific length at a certain character position (insert 50 'x's after 6th character)
% gawk --re-interval 'BEGIN{ while(a++<49) s=s "x" }; { sub(/^.{6}/,"&" s) }; 1'  // uses interval expressions not available in awk
% awk 'BEGIN{ while(a++<49) s=s "x" }; { sub(/^....../,"&" s) }; 1      // & in the sub function means the matched part of the regex

# Create an array from string
split("Jan Feb Mar Apr May Jun Jul Aug Sep Oct Nov Dec", month, " ")  // split(str, arr, regex)

# Create a reverse lookup array indexed by strings
for (i=1; i<=12; i++) mdigit[month[i]] = i

# Unix word count
% awk '{ C += length($0) + 1; W += NF } END { print NR, W, C }'  // plus 1 for default ORS

# Unix cat
% awk 1

# Unix grep
% awk '/pattern|pattern/ { print FILENAME ":" FNR ":" $0 }'

# Unix uniq
% sort file(s) | awk 'Last != $0 { print } { Last = $0 }'

# Sum of the nth column
% awk -v COLUMN=n '{ sum += $COLUMN } END { print sum }'

# Restrict search to just lines 100-150
% awk '(100 <= FNR) && (FNR <= 150) && /pattern/ { print FILENAME ":" FNR ":" $0 }'

# Swap the second and third column
% awk -F'\t' -v OFS='\t' '{ print $1, $3, $2, $4 }'
% awk 'BEGIN { FS = OFS = "\t" } { print $1, $3, $2, $4 }'
% awk -F'\t' '{ print $1 "\t" $3 "\t" $2 "\t" $4 }'

# Convert double space lines to single space
% gawk 'BEGIN { RS="\n *\n" } { print }'

# Lines that exceed 72 character length
% awk 'length($0) > 72 { print FILENAME ":" FNR ":" $0 }'

