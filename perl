
### Perl version
$ perl -v  

### Specify version
use 5.010;  # this script requires Perl 5.10 or greater
say "Hello World!"; # similar to print but adds newline

### Perl shebang
#!/usr/bin/perl
#!/usr/local/bin/perl
#!/usr/bin/env perl

* There are no integer values internal to Perl—an integer constant in the program is treated as the equivalent floating-point value.

### Non decimal integer literals
0377 # 377 octal, same as 255 decimal
0xff # FF hex, also 255 decimal
0b11111111 # also 255 decimal

### Use unicode characters in the program
use utf8;

### Single quoted string literals
To get a backslash, put two backslashes in a row, and to get a single quote, put a backslash followed by a single quote.

### Double quoted string literals
\007 Any octal ASCII value (here, 007 = bell)
\x7f Any hex ASCII value (here, 7f = delete)
\x{2744} Any hex Unicode code point (here, U+2744 = snowflake)
\cC A “control” character (here, Ctrl-C)
\\ Backslash
\“ Double quote
\l Lowercase next letter
\L Lowercase all following letters until \E
\u Uppercase next letter
\U Uppercase all following letters until \E
\Q Quote nonword characters by adding a backslash until \E
\E End \L, \U, or \Q

### String concatentation
"hello" . ' ' . "world"   # same as 'hello world'

### String repitition
5 x 4.8                   # is really "5" x 4, which is "5555"

### Enable warnings
use warnings;
$ perl -w my_program
#!/usr/bin/perl -w

### Enable diagnostics
use diagnostics;
$ perl -Mdiagnostics ./my_program    # -M to load pragma

### Binary assignment
$fred += 5;    # same as $fred = $fred + 5; 
$fred **= 3    # power
$str .= " ";   # concatenation

### Printing
print "The answer is ", 6 * 7, ".\n";    # You can give print a series of values, separated by commas

### Variable interpolation with double quoted strings
$barney = "fred ate a $meal";
print $fred;      # Don’t bother with interpolating if you have just the one lone variable:
print "fred ate ${what}s.\n";

### Creating strings containing non ascii characters
$beta = chr( 0x05D0 );
$alpha = chr( hex('03B1') );
$gamma = "\x{03B1}\x{03C9}"

### Get the code point for a character
$code_point = ord('א');

### String comparison operators
eq, ne, lt, gt, le, ge

### Perl boolean values
* If the value is a number, 0 means false; all other numbers mean true.
* Otherwise, if the value is a string, the empty string ('') means false; all other strings
  mean true.
* The string '0' is the only non-empty string that is false.

### Getting user input
$line = <STDIN>;

### Remove newline from the end of the string
chomp($text = <STDIN>);

### 'undef' value
Variables have the special undef value before they are first assigned. Neither a number or a string.
Automatically acts as a 0 or '' (empty) string.

### 'defined' function
<STDIN> line-input operator returns undef on end-of-file.
To tell whether a value is undef and not the empty string, use the defined function

$madonna = <STDIN>;
if ( defined($madonna) ) {
  print "The input was $madonna";
} else {
  print "No input available!\n";
}

### Accessing array elements
$fred[0] = "yabba";
$fred[99] = "abba";           # unassigned indices 1..98 return undef         
$fred[5] .= "whatsis";     
$blank = $fred[ 142_857 ];    # unused array element gives undef

### Last array element index
$rocks[ $#rocks ] = 'hard rock';
$rocks[ –1 ]      = 'hard rock';

### List literals
(1, 2, 3)            # list of three values 1, 2, and 3
()                   # empty list - zero elements
(1..100)             # list of 100 integers
(5..1)               # empty list; .. only counts "uphill"
(0, 2..6, 10, 12)    # same as (0, 2, 3, 4, 5, 6, 10, 12)
($m..$n)
(0..$#rocks)

### 'qw' shortcut
qw( fred barney betty wilma dino )      # list of strings ("fred", "barney", "betty", "wilma", "dino")
qw{ fred barney betty wilma dino }
qw[ fred barney betty wilma dino ]
qw< fred barney betty wilma dino >
qw! fred barney betty wilma dino !
qw/ fred barney betty wilma dino /
qw# fred barney betty wilma dino #

### List assignment
($fred, $barney) = ($barney, $fred); # swap those values
($fred, $barney) = qw< flintstone rubble slate granite >; # two ignored items
($wilma, $dino)  = qw[flintstone]; # $dino gets undef

### Array assignment
@rocks = qw/ bedrock slate lava /;
@tiny = ( ); # the empty list
@quarry = (@rocks, "crushed rock", undef, @tiny, $dino);
@copy = @quarry;           # copy a list from one array to another, it is still an assignment

### Array 'pop' and 'push' operators
@array = 5..9;
$barney = pop @array;      # $barney gets 8, @array now has (5, 6, 7)
pop @array;                # @array now has (5, 6). (The 7 is discarded.)
push @array, 8;            # @array now has (5, 6, 8)
push @array, 1..10;        # @array now has those 10 new elements
push @array, @others;

### Array 'shift' and 'unshift' operators
@array = qw# dino fred barney #;
$m = shift @array;                  # $m gets "dino", @array now has ("fred", "barney")
shift @array;
$o = shift @array;                  # $o gets undef
unshift @array, 5;                  # @array now has the one-element list (5)
unshift @array, @others;

### Array 'splice' operator
It takes up to four arguments, two of which are optional. The first argument is always the array
and the second argument is the position where you want to start. You can use a third argument to specify a length.
The fourth argument is a replacement list.

@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 2;                      # @removed is qw(fred barney betty), @array is qw(pebbles dino)

@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 2;                   # @removed is qw(dino fred), @array is qw(pebbles barney betty)

@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 2, qw(wilma);        # @removed is qw(dino fred), @array is qw(pebbles wilma barney betty)

@array = qw( pebbles dino fred barney betty );
@removed = splice @array, 1, 0, qw(wilma);        # @removed is qw(), @array is qw(pebbles wilma dino fred barney betty)

### Interpolating arrays into strings
print "quartz @rocks limestone\n";

$email = "fred@bedrock.edu";                      # WRONG! Tries to interpolate @bedrock array
$email = "fred\@bedrock.edu";                     # Correct
$email = 'fred@bedrock.edu';

### Array 'foreach' structure

foreach $rock (qw/ bedrock slate lava /) {
  print "One rock is $rock.\n";                   # Prints names of three rocks
}

$rock = 'shale';
foreach $rock (@rocks) {
  print "One rock is $rock.\n";                      
}
print "rock is still $rock\n";                     # 'rock is still shale' The value of the control variable is restored after the loop

### Perl default variable $_

foreach (1..10) {                                  # Uses $_ by default
  print "I can count to $_!\n";
}

### Array 'reverse' operator
@wilma = reverse 6..10;
@fred  = reverse @fred;

### Array 'sort' operator
Takes a list of values  and sorts them in the internal character ordering. For strings, that would be in code point order same as ascii order.

@rocks = qw/ bedrock slate rubble granite /;
@sorted = sort(@rocks);                            # gets bedrock, granite, rubble, slate
@back = reverse sort @rocks;
@numbers = sort 97..102;                           # gets 100, 101, 102, 97, 98, 99

### Array 'each' operator

use 5.012;                                         # from perl 5.12 onwards
@rocks = qw/ bedrock slate rubble granite /;
while( my( $index, $value ) = each @rocks ) {
  say "$index: $value";
}

foreach $index ( 0 .. $#rocks ) {
  print "$index: $rocks[$index]\n";                # without 'each'
}

### List and scalar context
An array in list context gives the list of elements. But in a scalar context, it returns the number of elements in the array
$n = @array;                     # number of elements in the array

$line  = <STDIN>;                # returns the next line of input in scalar context
@lines = <STDIN>;                # returns all the remainling lines upto the end-of-file in list context
chomp(@lines = <STDIN>);         # removes newlines from each item in the list

$fred = something;               # scalar context
@pebbles = something;            # list context
($wilma, $betty) = something;    # list context
($dino) = something;             # still list context!

if an expression doesn’t normally have a list value, the scalar value is automatically promoted to make a one-element list
@fred = 6 * 7;                   # gets the one-element list (42)
@wilma = undef;                  # OOPS! Gets the one-element list (undef). Does not clear the array
@betty = ( );                    # A correct way to empty an array

### Forcing scalar context with 'scalar'
print "I have ", @rocks, " rocks!\n";         # WRONG, prints names of rocks
print "I have ", scalar @rocks, " rocks!\n";  # Correct, gives a number

