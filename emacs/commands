
==================================================
 Entering and Exiting
==================================================
emacs &        - Start emacs in the background [1]
C-z            - Suspend emacs
fg             - Resume emacs
%emacs         - Resume emacs
C-x C-c        - End emacs session
M-x kill-emacs - Kill emacs without being prompted to save [2]

[1] If the variable inhibit-startup-screen is non-nil, Emacs does not display the startup screen. In
that case, if one or more files were specified on the command line, Emacs simply displays those files;
otherwise, it displays a buffer named *scratch*, which can be used to evaluate Emacs Lisp expressions
interactively. You can also force Emacs to display a file or directory at startup by setting the
variable initial-buffer-choice to a non-nil value.

[2] If the value of the variable confirm-kill-emacs is non-nil, C-x C-c assumes that its value is a
predicate function, and calls that function. If the result of the function call is non-nil, the
session is killed, otherwise Emacs continues to run. One convenient function to use as the value of
confirm-kill-emacs is the function yes-or-no-p. The default value of confirm-kill-emacs is nil.

==================================================
 Movement
==================================================
C-v       - Next screen
M-v       - Previous screen
C-f       - Move forward a character
C-b       - Move backward a character
M-f       - Move forward a word
M-b       - Move backward a word
C-n       - Move to next line
C-p       - Move to previous line
C-a       - Move to beginning of line
C-e       - Move to end of line
M-a       - Move back to beginning of sentence [1]
M-e       - Move forward to end of sentence
M-<       - Beginning of entire text
M->       - End of entire text
C-u 8 C-f - Moves forward eight characters
C-u 8 C-b - Moves backward eight characters
C-u 8 C-v - Moves forward 8 lines
C-u 8 M-v - Moves backward 8 lines


[1] a sentence ends wherever there is a ‘.’, ‘?’ or ‘!’ followed by the end of a line or two spaces,
with any number of ‘)’, ‘]’, ‘'’, or ‘"’ characters allowed in between. A sentence also begins or ends
wherever a paragraph begins or ends.

==================================================
 Display
==================================================
C-l                             - Clear screen and redisplay all the text moving the text around the 
                                  cursor to the center of the screen. Twice (C-l C-l) scrolls so that 
                                  point in on the topmost screen line. Thrice brings it to its original
                                  position. [1]
M-x recenter                    - Scroll the selected window so the current line is the center-most 
                                  text line. Possibly redisplay the screen too.
C-M-l                           - Scroll heuristically to bring useful information onto the screen [2]
C-x n n                         - Narrow down to between point and mark. Narrowing means focusing in on
                                  some portion of the buffer, making the rest temporarily 
                                  inaccessible [3]
C-x n w                         - Widen to make the entire buffer accessible again
C-x n p                         - Narrow down to the current page
C-x n d                         - Narrow down to the current defun
M-x view-buffer                 - Prompts for an existing Emacs buffer, switches to it, and enables 
                                  View mode <SPC> to scroll forward and <DEL> to scroll backward and 
                                  's' to start an incremental search. 'e' disables view mode.
M-x view-file                   - Prompts for a file and visits it with View mode enabled
M-x follow-mode                 - Makes two windows, both showing the same buffer, scroll as a single 
                                  tall “virtual window”. To use Follow mode, go to a frame with just 
                                  one window, split into two side-by-side windows using C-x 3, and then
                                  type M-x follow-mode. To turn off Follow mode, type M-x follow-mode a
                                  second time.
M-x list-faces-display          - To see what faces are currently defined. Emacs can display text in 
                                  several different styles, called faces.
M-x highlight-changes-mode      - Enable and disable highlight changes mode that highlights the parts 
                                  of the buffer that were changed most recently, by giving that text a 
                                  different face.
M-x hi-lock-mode                - Enable and disable this mode that highlights text that matches 
                                  regular expressions you specify [4]
M-s h r regexp <RET> face <RET> - Highlight text that matches regexp using face face. While being 
                                  prompted for a face use M-n and M-p to cycle through them. Same as
                                  C-x w h regexp <RET> face <RET>
M-s h u regexp <RET>            - Unhighlight regexp. Same as C-x w r regexp <RET>
M-s h l regexp <RET> face <RET> - Highlight entire lines containing a match for regexp, using face face.
                                  Same as C-x w l regexp <RET> face <RET>
M-s h p phrase <RET> face <RET> - Highlight matches of phrase, using face face. Phrase can be any 
                                  regexp, but spaces will be replaced by matches to whitespace and 
                                  initial lower-case letters will become case insensitive. Same as
                                  C-x w p phrase <RET> face <RET>
M-s h .                         - Highlight the symbol found near point, using the next available face.
                                  Same as C-x w .
M-s h w                         - Insert all the current highlighting regexp/face pairs into the buffer
                                  at point, with comment delimiters to prevent them from changing your 
                                  program. Same as C-x w b
M-s h f                         - Extract regexp/face pairs from comments in the current buffer. Same 
                                  as C-x w i [5]
M-x delete-trailing-whitespace  - Delete all trailing whitespace
M-x toggle-truncate-lines       - All the characters that do not fit in the width of the screen or 
                                  window do not appear at all. This is indicated with ‘$’ signs in the 
                                  leftmost and/or rightmost columns.
M-x visual-line-mode            - Emacs attempts to wrap the line at word boundaries near the right 
                                  window edge [6]
C-x C-+                         - Increase the height of the default face [!!!!!]
C-x C--                         - Decrease the height of the default face [!!!!!]
C-x C-0                         - Restore the default face height [!!!!!]

[1] You can also give C-l a prefix argument. A plain prefix argument, C-u C-l, simply recenters point.
A positive argument n puts point n lines down from the top of the window. An argument of zero puts 
point on the topmost line. A negative argument -n puts point n lines from the bottom of the window. 
When given an argument, C-l does not clear the screen or cycle through different screen positions.

[2] For example, in a Lisp file, this command tries to get the entire current defun onto the screen if 
possible.

[3] You can't see the rest, you can't move into it (motion commands won't go outside the accessible 
part), you can't change it in any way. However, it is not gone, and if you save the file all the 
inaccessible text will be saved.

[4] To enable Hi Lock mode for all buffers, use M-x global-hi-lock-mode or place 
(global-hi-lock-mode 1) in your .emacs file.

[5] You can enter patterns interactively with M-s h r, store them into the file with M-s h w, edit them
(perhaps including different faces for different parenthesized parts of the match), and finally use 
this command to have Hi Lock highlight the edited patterns.

[6] The command M-x global-visual-line-mode toggles Visual Line mode in all buffers. In Visual Line 
mode, some editing commands work on screen lines instead of logical lines: C-a moves to the beginning 
of the screen line, C-e moves to the end of the screen line, and C-k kills text to the end of the 
screen line.

==================================================
 Files
==================================================
C-x C-f - Find a file
C-x C-s - Save the file [1]

[1] On some systems, typing C-x C-s will freeze the screen and you will see no further output from
Emacs . This indicates that an operating system "feature" called "flow control" is intercepting the
C-s and not letting it get through to Emacs. To unfreeze the screen, type C-q.  Then see the section
"Spontaneous Entry to Incremental Search" in the Emacs manual for advice on dealing with this
"feature".

==================================================
 Help
==================================================
C-h c - Basic help. (eg. C-h c C-p)
C-h k - More info on command (eg. C-h k C-p)
C-h f - describe a function (eg. C-h f previous-line)
C-h v - describe a variable used to customize emacs
C-h a - Command Apropos. list all  the commands whose names contain that keyword
C-h i - Read online manual (m emacs - emacs manual, ? - info mode)

==================================================
 MiniBuffer
==================================================
The minibuffer is where Emacs commands read complicated arguments, such as file names, buffer names,
Emacs command names, or Lisp expressions.

C-a C-k                  - Kill the entire default to specify a file in the minibuffer in a completely
                           different directory [1]
C-q C-j                  - Insert a new line in the minibuffer
C-q <TAB>, <SPC>, ?      - To insert the <TAB>, <SPC>, ? character in the minibuffer
<TAB>                    - Complete the text in the minibuffer as much as possible
<SPC>                    - Complete up to one word 
<RET>                    - Submit the text in the minibuffer as the argument
?                        - Display a list of completions
M-v                      - While in the minibuffer, selects the window showing the completion list
<ESC><ESC><ESC>          - Gets out of the completion list window [2]
M-p                      - Move to the previous item in the minibuffer history
M-n                      - Move to the next item in the minibuffer history 
M-r regexp <RET>         - Move to an earlier item in the minibuffer history that matches regexp
M-s regexp <RET>         - Move to a later item in the minibuffer history that matches regexp 
C-x <ESC> <ESC>          - Re-execute a recent minibuffer command from the command history. A numeric
                           argument specifies which command to repeat; 
                           1 means the last one, 2 the previous
M-x list-command-history - Display the entire command history, showing all the commands
                           C-x <ESC> <ESC> can repeat, most recent first [3][4]

[1] Alternatively, you can ignore the default, and enter an absolute file name starting with a slash
or a tilde after the default directory Emacs interprets ~/ as your home directory. In addition,
~user-id/ means the home directory of a user whose login name is user-id.

[2] When completing file names, case differences are ignored if the variable
read-file-name-completion-ignore-case is non-nil. Default is nil for Linux. When completing buffer
names, case differences are ignored if the variable read-buffer-completion-ignore-case is non-nil.
Default is nil.

[3] Incremental search does not, strictly speaking, use the minibuffer. Therefore, it normally does
not appear in the history list for C-x <ESC> <ESC>. You can make incremental search commands appear in
the history by setting isearch-resume-in-command-history to a non-nil value.

[4] To pass a numeric argument to the command you are invoking with M-x, specify the numeric argument
before M-x.

==================================================
 Blank Lines
==================================================
C-o     - Insert a blank line after the cursor [1]
C-x C-o - Delete all but one of many consecutive blank lines. Once more to delete the remaining blank
          line. Deletes all blank lines before or after point. [2]

[1] C-n normally stops at the end of the buffer when you use it on the last line in the buffer.
However, if you set the variable next-line-add-newlines to a non-nil value, C-n on the last line of a
buffer creates an additional line at the end and moves down into it.

[2] Sometimes, you may need to edit files containing many long logical lines, and it may not be
practical to break them all up by adding newlines. In that case, you can use Visual Line mode, which
enables word wrapping: instead of wrapping long lines exactly at the right window edge, Emacs wraps
them at the word boundaries (i.e., space or tab characters) nearest to the right window edge. Visual
Line mode also redefines editing commands such as C-a, C-n, and C-k to operate on screen lines rather
than logical line.

==================================================
 Cursor Position
==================================================
M-x what-line            - Display the line number of point (cursor)
M-x line-number-mode     - Enable / disable line number on mode line
M-x column-number-mode   - Enable / disable column number on mode line
M-=                      - Display the number of lines, words, and characters that are present in the
                           region
                           M-| wc (on older emacs)
M-x count-words          - Display the number of lines, words, and characters that are present in the
                           buffer
M-x hl-line-mode         - Enable or disable highlighting of the current line 
M-x size-indication-mode - Toggle display of size of the buffer
C-x =                    - Displays the character code of character at point, its position in the
                           buffer, and its current column in the window

==================================================
 Repeating Commands
==================================================
C-x z - repeat the previous command more than once, type additional z's: each z repeats the command
        one more time

==================================================
 Erasing Text and Undo
==================================================
DEL         - Delete the character just before the cursor
C-d         - Delete the next character after the cursor
M-DEL       - Kill the word immediately before the cursor
M-d         - Kill the next word after the cursor
C-SHIFT-DEL - Kill an entire line at once [!!!!!] (global-set-key [f7] 'kill-whole-line)
C-k         - Kill from the cursor position to end of line
M-k         - Kill to the end of the current sentence
C-u 0 C-k   - Kill from the cursor position to beginning of line
              also C-0 C-k or M-0 C-k (on mac)
C-x DEL     - Kill from the cursor position to beginning of sentence
M-z char    - Kill through the next occurrence of char
M-\         - Delete spaces and tabs around point
M-SPC       - Delete spaces and tabs around point, leaving one space
M-^         - Join two lines by deleting the intervening newline
C-x u       - Undo. A numeric argument to C-_ or C-x u acts as a repeat count

==================================================
 Mark and Region
==================================================
Many Emacs commands operate on an arbitrary contiguous part of the current buffer. To specify the text
for such a command to operate on, you set the mark at one end of it, and move point to the other end.
The text between point and the mark is called the region. The region always extends between point and
the mark, no matter which one comes earlier in the text; each time you move point, the region changes.

C-<SPC>                 - Set the mark [1][2]
C-x C-x                 - Set the mark at point, and activate it; then move point where the mark used
                          to be
M-@                     - Set mark after end of next word. This command also accepts a numeric
                          argument n, which tells it to advance the mark by n words.
                          A neg argument moves mark back by n words
C-M-@                   - Set mark after end of following balanced expression
M-h                     - Move point to the beginning of the current paragraph, and set mark at the
                          end 
C-M-h                   - Move point to the beginning of the current defun, and set mark at the end
C-x C-p                 - Move point to the beginning of the current page, and set mark at the end
C-x h                   - Move point to the beginning of the buffer, and set mark at the end
C-<SPC> C-<SPC>         - Set the mark, pushing it onto the mark ring, without activating it
C-u C-<SPC>             - Move point to where the mark was, and restore the mark from the ring of
                          former marks [3]
C-x C-<SPC>             - Jumps to the buffer and position of the latest entry in the global ring
M-x transient-mark-mode - Toggle transient mode [4]

[1] You can explicitly deactivate the mark at any time, by typing C-g

[2] When multiple windows show the same buffer, they can have different values of point, and thus
different regions, but they all share one common mark position.

[3] If you set set-mark-command-repeat-pop to non-nil, then immediately after you type C-u C-<SPC>,
you can type C-<SPC> instead of C-u C-<SPC> to cycle through the mark ring. By default,
set-mark-command-repeat-pop is nil. The variable mark-ring-max specifies the maximum number of entries
to keep in the mark ring. This defaults to 16 entries. In addition to the ordinary mark ring that
belongs to each buffer, Emacs has a single global mark ring. The length of the global mark ring is
controlled by global-mark-ring-max, and is 16 by default.

[4] The default behavior of the mark and region, in which setting the mark activates it and highlights
the region, is called Transient Mark mode.

C-x C-l   - Convert region to lower case
C-x C-u   - Convert region to upper case
M-%       - Replace text within the region (y-replace, n-skip, !-replace all, C-g-cancel)
C-M-%     - Regex replace text within the region [!!!!!]
C-u C-/   - Undo changes within the region
M-$       - Check spelling of words within the region
C-x r s   - Save it in a register
C-x <TAB> - Indent text in the region

==================================================
 Killing
==================================================
Killing means erasing text and copying it into the kill ring. Yanking means bringing text from the
kill ring back into the buffer. The kill ring is so-named because it can be visualized as a set of
blocks of text arranged in a ring, which you can access in cyclic order. Killing and yanking are the
most common way to move or copy text within Emacs.

C-w                   - Kill the text in the region
M-w                   - Copy the region to the kill ring
C-y                   - reinserts the last killed text, at point [1]
M-y                   - Replace the text just yanked with an earlier batch of killed text [2]
C-M-w                 - append the text it kills to the last killed text, instead of starting a new
                        entry
M-x append-to-buffer  - Append region to the contents of a specified buffer [3]
M-x prepend-to-buffer - Prepend region to the contents of a specified buffer
M-x copy-to-buffer    - Copy region into a specified buffer, deleting that buffer's old contents
M-x insert-buffer     - Insert the contents of a specified buffer into current buffer at point
M-x append-to-file    - Append region to the contents of a specified file, at the end [4]

[1] Several C-k's in a row, all of the killed text is saved together, so that one C-y will yank all of
the lines at once M-y replaces that yanked text with the previous kill. Typing M-y again and again
brings in earlier and earlier kills.you can try giving M-y positive and negative arguments.

[2] C-y yanks the entry which the “last yank” pointer points to. M-y moves the “last yank” pointer to
a different entry.  As long as no new killing is done, the “last yank” pointer remains at the same
place in the kill ring, so repeating C-y will yank another copy of the same previous kill.

[3] M-x append-to-buffer reads a buffer name, then inserts a copy of the region into the buffer
specified. If you specify a nonexistent buffer, append-to-buffer creates the buffer. The text is
inserted wherever point is in that buffer. Point in that buffer is left at the end of the copied text,
so successive uses of append-to-buffer accumulate the text in the specified buffer in the same order
as they were copied.

[4] Instead of accumulating text in a buffer, you can append text directly into a file with M-x
append-to-file. This prompts for a filename, and adds the text of the region to the end of the
specified file. The file is changed immediately on disk. You should use append-to-file only with files
that are not being visited in Emacs. Using it on a file that you are editing in Emacs would change the
file behind Emacs's back, which can lead to losing some of your editing.

==================================================
 Search and Replacement
==================================================
C-s           - Incremental search forward [1][2][3][6]
C-r           - Incremental search backward
C-u C-<SPC>   - Return to where you were before beginning the search
C-s C-s       - After exiting a search, you can search for the same string again
C-r C-r       - After exiting a search, you can search for the same string again
M-c           - Toggles the case sensitivity of that search [14]
M-p           - Reuse earlier search strings [4]
M-n           - Reuse earlier search strings
C-g           - Cancels the entire search if search input was found or removes from the search string 
                the characters that could not be found. A second C-g at that point cancels the search 
                entirely
M-s <SPC>     - Toggle lax space matching [5]
C-s C-j       - To search for a newline character
C-s C-q octal - To search for non-ASCII characters (or C-S C-x 8 <RET> unicode name/code point)
C-s M-<TAB>   - Attempts to complete the search string using the search ring as a list of completion 
                alternatives.
C-s C-y       - Appends the current kill to the search string
C-s M-y       - Called after C-y, replaces that appended text with an earlier kill
C-s C-w       - Appends the next character or word at point to the search string [7]
C-s M-s C-e   - Appends the rest of the current line to the search string. If point is already at the 
                end of a line, it appends the next line. With a prefix argument n, it appends the next 
                n lines.
C-M-w         - Deletes the last character from the search string
C-M-y         - Appends the character after point to the search string [8]
C-s <RET> string <RET> - Nonincremental forward search
C-r <RET> string <RET> - Nonincremental backward search
M-s w         - Incremental word search forward. A word search finds a sequence of words without regard 
                to the type of punctuation between them [9]
M-s w C-r     - Word search backwards        
M-s w <RET> words <RET>     - Forward nonincremental word search
M-s w C-r <RET> words <RET> - Backward nonincremental word search
M-s _         - Symbol search [10]
M-s .         - Start a symbol incremental search forward with the symbol found near point added to the 
                search string initially
M-s _ <RET> symbol <RET>     - Search forward for symbol, nonincrementally
M-s _ C-r <RET> symbol <RET> - Search backward for symbol, nonincrementally
C-M-s         - Begin incremental regexp search [11][12][13]
C-M-r         - Begin reverse incremental regexp search
M-x replace-string <RET> string <RET> newstr <RET> - Replace every occurrence of string with newstr [15]
                                                     C-u C-<SPC> to move back to original position
M-x replace-regexp <RET> regexp <RET> newstr <RET> - Replace every match for regexp with newstr [16]


[1] If you make a mistake typing the search string, type <DEL>. When you are satisfied with the place 
you have reached, type <RET>. As a special exception, entering <RET> when the search string is empty 
launches nonincremental search. 

[2] Type another C-s to move to the next occurrence of the search string. If you overshoot, you can 
cancel some C-s characters with <DEL>. Similarly, each C-r in a backward incremental search repeats the 
backward search. 

[3] If you are searching forward but you realize you were looking for something before the starting 
point, type C-r to switch to a backward search, leaving the search string unchanged. Similarly, C-s in 
a backward search switches to a forward search.

[4] To edit the current search string in the minibuffer without replacing it with items from the search 
ring, type M-e. Type <RET>, C-s or C-r to finish editing the string and search for it.

[5] By default, incremental search performs lax space matching: each space, or sequence of spaces, 
matches any sequence of one or more spaces in the text. More precisely, Emacs matches each sequence of 
space characters in the search string to a regular expression specified by the variable 
search-whitespace-regexp. For example, to make spaces match sequences of newlines as well as spaces, set
it to ‘"[[:space:]\n]+"’. To disable this feature entirely, change search-whitespace-regexp to nil; then
each space in the search string matches exactly one space.

[6] If the search string you entered contains only lower-case letters, the search is case-insensitive; 
as long as an upper-case letter exists in the search string, the search becomes case-sensitive. If you 
delete the upper-case character from the search string, it ceases to have this effect.

[7] If the search is currently case-insensitive, both C-w and M-s C-e convert the text they copy to 
lower case, so that the search remains case-insensitive.

[8] An alternative method to add the character after point is to enter the minibuffer with M-e and type 
C-f at the end of the search string in the minibuffer.

[9] For instance, if you enter a search string that consists of two words separated by a single space, 
the search matches any sequence of those two words separated by one or more spaces, newlines, or other 
punctuation characters.

[10] The meaning of symbol in this context depends on the major mode, and usually refers to a source 
code token, such as a Lisp symbol in Emacs Lisp mode. This feature is thus mainly useful for searching 
source code.

[11] Or by invoking C-s with a prefix argument (whose value does not matter), or by typing M-r within a 
forward incremental search.

[12] Unlike ordinary incremental search, incremental regexp search do not use lax space matching by 
default. To toggle this feature use M-s <SPC>. Then any <SPC> typed in incremental regexp search will 
match any sequence of one or more whitespace characters. The variable search-whitespace-regexp 
specifies the regexp for the lax space matching.

[13] To include a ‘]’ in a character set or eg [a-z], you must make it the first character. To include a
‘-’, write ‘-’ as the first or last character of the set. To include ‘^’ in a set, put it anywhere but 
at the beginning of the set.

.          - matches any single character except a newline
*          - match the preceding regular expression repetitively any number of times
+          - match the preceding expression at least once
?          - match the preceding expression either once or not at all
*?, +?, ?? - are non-greedy variants of the operators
\{n\}      - is a postfix operator specifying n repetitions
\{n,m\}    - is a postfix operator specifying between n and m repetitions
[ ... ]    - the characters between the two brackets are what this set can match
[^ ... ]   -  matches any character except the ones specified
^          - matches the empty string, but only at the beginning of a line in the text being matched
$          - matches only at the end of a line
\          - quotes the special characters
\|         - specifies an alternative. ‘foo\|bar’ matches either ‘foo’ or ‘bar’ but no other string
\( ... \)  - is a grouping construct. ‘\(foo\|bar\)x’ matches either ‘foox’ or ‘barx’. ‘ba\(na\)*’ 
             matches ‘bananana’. \(?: ... \) specifies a “shy” group that does not record the matched 
             substring; you can't refer back to it with ‘\d’. 
\d         - matches the same text that matched the dth occurrence of a ‘\( ... \)’ construct. This is 
             called a back reference. ‘\(.*\)\1’ matches any newline-free string that is composed of 
             two identical halves
\`         - matches the empty string, but only at the beginning of the string or buffer
\'         - matches the empty string, but only at the end of the string or buffer
\=         - matches the empty string, but only at point
\b         - matches the empty string, but only at the beginning or end of a word
\B         - matches the empty string, but not at the beginning or end of a word
\<         - matches the empty string, but only at the beginning of a word
\>         - matches the empty string, but only at the end of a word
\w         - matches any word character
\W         - matches any non word character

[14] Searches in Emacs normally ignore the case of the text they are searching through, if you specify 
the text in lower case. An upper-case letter anywhere in the incremental search string makes the search 
case-sensitive. If you set the variable case-fold-search to nil, then all letters must match exactly, 
including case.

[15] Replacement happens only in the text after point, so if you want to cover the whole buffer you 
must go to the beginning first. All occurrences up to the end of the buffer are replaced; to limit 
replacement to part of the buffer, activate the region around that part. To move back to the original 
position of point use C-u C-<SPC>.

[16] The newstring need not be constant: it can refer to all or part of what is matched by the regexp.
M-x replace-regexp <RET> c[ad]+r <RET> \&-safe <RET> replaces (for example) ‘cadr’ with ‘cadr-safe’ and 
‘cddr’ with ‘cddr-safe’. M-x replace-regexp <RET> \(c[ad]+r\)-safe <RET> \1 <RET> performs the inverse 
transformation. To include a ‘\’ in the text to replace with, you must enter ‘\\’. 

If you want to enter part of the replacement string by hand each time, use ‘\?’ in the replacement 
string. Each replacement will ask you to edit the replacement string in the minibuffer, putting point 
where the ‘\?’ was.[!!!!!]

‘\&’ - in newstring stands for the entire match being replaced
‘\d’ - in newstring, where d is a digit, stands for whatever matched the dth parenthesized grouping in 
       regexp.

==================================================
 Rectangles
==================================================
Rectangle commands operate on rectangular areas of the text: all the characters between a certain pair
of columns, in a certain range of lines. Rectangle commands are useful with text in multicolumn 
formats, and for changing text into or out of such formats. To specify a rectangle for a command to
work on, set the mark at one corner and point at the opposite corner. The region-rectangle is
controlled in much the same way as the region is controlled. But remember that a given combination of
point and mark values can be interpreted either as a region or as a rectangle, depending on the 
command that uses them.

C-x r k                - Kill the text of the region-rectangle, saving its contents as the
                         “last killed rectangle”
C-x r M-w              - Save the text of the region-rectangle as the “last killed rectangle”
C-x r d                - Delete the text of the region-rectangle
C-x r y                - Yank the last killed rectangle with its upper left corner at point
C-x r o                - Insert blank space to fill the space of the region-rectangle. This pushes the
                         previous contents of the region-rectangle to the right
C-x r N                - Insert line numbers along the left edge of the region-rectangle. This pushes 
                         the previous contents of the region-rectangle to the right
C-x r c                - Clear the region-rectangle by replacing all of its contents with spaces
C-x r t 'string' <RET> - Replace rectangle contents with 'string' on each line 
M-x string-insert-rectangle <RET> 'string' <RET> - Insert 'string' on each line of the rectangle

M-x delete-whitespace-rectangle - Delete whitespace in each of the lines on the specified rectangle,
                                  starting from the left edge column of the rectangle [!!!!!]
C-x <SPC> - Toggle Rectangle Mark mode [1] [!!!!!]

[1] When this mode is active, the region-rectangle is highlighted and can be shrunk/grown, and the 
standard kill and yank commands operate on it.

==================================================
 Registers
==================================================
Emacs registers are compartments where you can save text, rectangles, positions, and other things for 
later use. Once you save text or a rectangle in a register, you can copy it into the buffer once, or 
many times; once you save a position in a register, you can jump back to that position once, or many 
times. Each register has a name that consists of a single character, which we will denote by r; r can 
be a letter (such as ‘a’) or a number (such as ‘1’); case matters, so register ‘a’ is not the same as 
register ‘A’. All of the commands that prompt for a register will display a “preview” window that 
lists the existing registers (if there are any) after a short delay. You can explicitly request a 
preview window by pressing C-h.

M-x view-register <RET> r       - Display a description of what register r contains
C-x r <SPC> r                   - Record the position of point and the current buffer in register r 
C-x r j r                       - Jump to the position and buffer saved in register r
C-x r s r                       - Copy region into register r
C-x r i r                       - Insert text from register r
M-x append-to-register <RET> r  - Append region to text in register r [1]
M-x prepend-to-register <RET> r - Prepend region to text in register r [1]
C-x r r r                       - Copy the region-rectangle into register r
C-x r i r                       - Insert the rectangle stored in register r
C-u number C-x r n r            - Store number into register r. With no numeric argument stores zero 
                                  in the register 
C-u number C-x r + r            - If r contains a number, increment the number in that register by 
                                  number
C-x r i r                       - Insert the number from register r into the buffer. With no numeric 
                                  argument increments the register value by 1
C-x r w r                       - Save the state of the selected frame's windows in register r [2]
C-x r f r                       - Save the state of all frames, including all their windows, in 
                                  register r
C-x r j r                       - Restore a window or frame configuration
C-x C-k x r                     - stores the last keyboard macro in register r
C-x r j r                       - Execute the keyboard macro in register r

# Filenames in registers 13.6

[1] When register r contains text, you can use C-x r + (increment-register) to append to that register
. Note that command C-x r + behaves differently if r contains a number. When you are collecting
text using append-to-register and prepend-to-register, you may want to separate individual collected 
pieces using a separator. In that case, configure a register-separator and store the separator text in
to that register. For example, to get double newlines as text separator during the collection process,
you can use the following setting. 
(setq register-separator ?+) (set-register register-separator "\n\n")

[2] Use C-x r j r to restore a window or frame configuration. This is the same command used to restore
a cursor position. When you restore a frame configuration, any existing frames not included in the 
configuration become invisible. If you wish to delete these frames instead, use C-u C-x r j r .

==================================================
 Bookmarks
==================================================
Bookmarks are somewhat like registers in that they record positions you can jump to. Unlike registers,
they have long names, and they persist automatically from one Emacs session to the next. The 
prototypical use for bookmarks is to record one current position in each of several files. So the 
command C-x r m, which sets a bookmark, uses the visited file name as the default for the bookmark 
name. If you name each bookmark after the file it points to, then you can conveniently revisit any of 
those files with C-x r b, and move to the position of the bookmark at the same time. Bookmarks are 
saved to the file ~/.emacs.d/bookmarks. If you set the variable bookmark-save-flag to 1, each command 
that sets a bookmark will also save your bookmarks; this way, you don't lose any bookmark values even 
if Emacs crashes. The value, if a number, says how many bookmark modifications should go by between 
saving. If you set this variable to nil, Emacs only saves bookmarks if you explicitly use M-x 
bookmark-save. The variable bookmark-default-file specifies the file in which to save bookmarks by
default. Bookmark position values are saved with surrounding context, so that bookmark-jump can find 
the proper position even if the file is modified slightly. The variable bookmark-search-size says how 
many characters of context to record on each side of the bookmark's position.

C-x r m <RET>                            - Set the bookmark for the visited file, at point
C-x r m bookmark <RET>                   - Set the bookmark named bookmark at point
C-x r b bookmark <RET>                   - Jump to the bookmark named bookmark
C-x r l                                  - List all bookmarks [1]
M-x bookmark-save                        - Save all the current bookmark values in the default 
                                           bookmark file
M-x bookmark-load <RET> filename <RET>   - Load a file named filename that contains a list of bookmark
                                           values
M-x bookmark-write <RET> filename <RET>  - Save all the current bookmark values in the file filename
M-x bookmark-delete <RET> bookmark <RET> - Delete the bookmark named bookmark
M-x bookmark-insert-location <RET> bookmark <RET> - Insert in the buffer the name of the file that 
                                                    bookmark bookmark points to
M-x bookmark-insert <RET> bookmark <RET> - Insert in the buffer the contents of the file that 
                                           bookmark bookmark points to

[1] Type C-h m in the bookmark buffer (bookmarks list) for more information about its special editing 
commands.


=======================================================================================================







C-g - When emacs is hung, stop or discard a command
C-x 1 -  One window (i.e., kill all other windows), get rid of buffer list

C-<SPC>  C-w - Kill any part of text
C-k C-k - kills the contents of the line, and a second C-k kills the line itself
C-u 2 C-k - kills two lines and their newlines



C-x C-b - List buffers
C-x b - Switch buffers 
C-x s - Save some buffers

M-x replace-string - Global replace after cursor. use <TAB>
M-x recover-file - Recover autosaved file (#filename#) after crash
M-x text-mode - Switch to 'text' major mode
C-u C-v - 
M-x auto-fill-mode - Turn on autofill minor mode (breaks the line in between words automatically whenever it exceeds the margin size) [3]
C-u 20 C-x f - change margin (line size) to 20. Default is 70
C-s - Search forward, <Delback> erases last character is the search
C-r - Search backwards
C-u 5 C-l - Bring line to the 5 lines from the top of the screen
C-x 2 - which splits the screen into two windows
C-M-v - to scroll the bottom window
C-x o - to switch between the windows
C-x 4 C-f filename - new window with cursor and file
<ESC> <ESC> <ESC> - get out of minibuffer or recursive editing level


M-` or <F10> - Menu bar, use up/down for different options [4]


C-q <DEL> - To insert non graphic characters. Also C-q followed by octal representation [7]
C-x 8 <RET> infinity <RET> - To insert non graphic characters with unicode name
C-x 8 <RET> 221e <RET> - To insert non graphic characters with unicode code point
M-r - Without moving the text on the screen, reposition point on the left margin of the center-most text line of the window
C-u 20 M-r - Move cursor to the 21st screen line. (zero means the top line. −1 means the bottom line)
M-g M-g - Go to buffer line number. Also M-g g. (Line 1 is the beginning of the buffer.) 
M-g c - 
M-g <TAB> - 
C-x C-n - Use the current column of point as the semipermanent goal column for C-n and C-p
C-u C-x C-n - Cancel the goal column [8][9]


C-u M-= - 

M-5 C-n - prefix argument. move down 5 lines
Meta-- - prefix argument of -1
M-5 C-u 0 C-u terminates the prefix argument to print 5 zeros
C-u - prefix argument of 4
C-u C-u C-f - moves forward by multiple of 4 i.e 16 
C-u C-u C-o - add 16 blank lines
C-u C-k - kill 4 lines
C-u 6 4 C-u 1 - additional C-u terminates prefix argument (print 64 ones)


C-x C-u - upcase-region, convert the selected region to upper case
C-g - deactivate the mark
C-<SPC> C-<SPC> - remember a position in the buffer
C-u C-<SPC> - jump back to the position later





M-\ - Delete spaces and tabs around point
M-<SPC> - Delete spaces and tabs around point, leaving one space
C-x C-o - Delete blank lines around the current line
M-^ - Join two lines by deleting the intervening newline, along with any indentation following it
C-k - Kill rest of line or one or more lines [18]
C-u 0 C-k - kills the text before point on the current line.
C-S-backspace - Kill an entire line at once (kill-whole-line)
C-w - Kill the region
M-w - Copy the region into the kill ring
C-x <DEL> - Kill back to beginning of sentence
M-k - Kill to the end of the sentence
M-z char - Kill through the next occurrence of char
C-y - Yank the last kill into the buffer, at point [19]
C-u 4 C-y - Reinserts the fourth most recent kill

C-h v kill-ring - See the value in the kill ring

M-w - Copy text into the kill region but do not kill text in the buffer [21]
M-<SPC> - Remove all whitespaces in front of point leaving one space
M-q - Remove all whitespaces in front of point leaving one space
# CUA Bindings 12.6

Notes:




[3] If you make changes in the middle of a paragraph, Auto Fill mode does not re-fill it for you. To re-fill the paragraph, type M-q (META-q) with the cursor inside
that paragraph.

[4] Typing the help character (C-h or <F1>) after a prefix key displays a list of the commands starting with that prefix. The sole exception to this rule is <ESC>:
<ESC> C-h is equivalent to C-M-h, which does something else entirely. You can, however, use <F1> to display a list of commands starting with <ESC>.


[7] To use decimal or hexadecimal instead of octal, set the variable read-quoted-char-radix to 10 or 16

[8] When a line of text in the buffer is longer than the width of the window, Emacs usually displays it on two or more screen lines. For convenience, C-n and C-p
move point by screen lines, as do the equivalent keys <down> and <up>. You can force these commands to move according to logical lines (i.e., according to the
text lines in the buffer) by setting the variable line-move-visual to nil

[9] When line-move-visual is nil, you can also set the variable track-eol to a non-nil value. Then C-n and C-p, when starting at the end of the logical line, move
to the end of the next logical line. Normally, track-eol is nil.






[18] When C-k is given a positive argument n, it kills n lines and the newlines that follow them (text on the current line before point is not killed). With a
negative argument −n, it kills n lines preceding the current line, together with the text on the current line before point.

[19] Yanking means reinserting text previously killed. The usual way to move or copy text is to kill it and then yank it elsewhere. The basic yanking command is
C-y (yank). It inserts the most recent kill, leaving the cursor at the end of the inserted text. It also sets the mark at the beginning of the inserted text,
without activating the mark; this lets you jump easily to that position, if you wish, with C-u C-<SPC>. With a plain prefix argument (C-u C-y), the command
instead leaves the cursor in front of the inserted text, and sets the mark at the end. The kill ring is a list of blocks of text that were previously
killed. There is only one kill ring, shared by all buffers, so you can kill text in one buffer and yank it in another buffer. This is the usual way to move text
from one buffer to another.


[21] Normally, each kill command pushes a new entry onto the kill ring. However, two or more kill commands in a row combine their text into a single entry, so
that a single C-y yanks all the text as a unit, just as it was before it was killed. If a kill command is separated from the last kill command by other commands
(not just numeric arguments), it starts a new entry on the kill ring. But you can force it to combine with the last killed text, by typing C-M-w
(append-next-kill) right beforehand. The C-M-w tells its following command, if it is a kill command, to treat the kill as part of the sequence of previous
kills. A kill command following M-w (kill-ring-save) does not append to the text that M-w copied into the kill ring.






# show line numbers by default
(global-linum-mode 1)

# Mark region coloring
(set-face-attribute 'region nil :background "#666" :foreground "#ffffff")

# goto line number
M-g g / M-g M-g 

how to scroll back in second window C M v for forward scroll