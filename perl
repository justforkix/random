
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

### Subroutines
Whatever calculation is last performed in a sub-routine is automatically also the return value
Perl automatically stores the argument list in a special array variable named @_ for the duration of the subroutine.
This means that the first subroutine parameter is in $_[0], the second one is stored in $_[1], and so on but
these variables have nothing whatsoever to do with the $_ variable. Perl doesn’t care about insufficient parameters
and you get undef if you look beyond the end of the @_ array. It also ignores extra parameters.
The @_ variable is private to the subroutine. Perl saves it before it invokes the next subroutine and restores its
previous value upon return from that subroutine.

### Local variables
By default, all variables in Perl are global variables; that is, they are accessible from every part of the program.
But you can create private variables called lexical variables at any time with the 'my' operator.
These variables are private (or scoped) to the enclosing block (subroutine, if, while, or foreach)

my $fred, $barney;          # WRONG! Fails to declare $barney
my($fred, $barney);         # declares both

foreach my $rock (qw/ bedrock slate lava /) {         # lexical variable in foreach
 print "One rock is $rock.\n";
}

sub max {
 my($m, $n);                       # new, private variables for this block
 ($m, $n) = @_;                    # give names to the parameters
 if ($m > $n) { $m } else { $n }   # You can omit the last semicolon in a block, in practice you omit it only when
}                                  # the code is so simple that you can write the block in a single line.

### Variable length argument list

sub max {
 if (@_ != 2) {           # if test uses array in scalar context. Better to make subroutines adapt to parameters than use this check      
   print "WARNING!\n";
 }
}


sub max {                         # Improved subroutine
 my($max_so_far) = shift @_;      # the first one is the largest yet seen
 foreach (@_) {                   # look at the remaining arguments
  if ($_ > $max_so_far) {         # could this one be bigger yet?
   $max_so_far = $_;
  }
 }
 $max_so_far;
}

### Enable strict pragma
use strict;                         # Enforce some good programming rules
use 5.012;                          # loads strict for you
Perl will insist that you declare every new variable, usually done with 'my'

### Return operator

sub which_element_is {
 my($what, @array) = @_;
 foreach (0..$#array) { 
  if ($what eq $array[$_]) {
   return $_;
  }
 }
 –1;
}

### Subroutine call
$maximum = &max(3, 5, 10, 4, 6);

You can omit the '&' if Perl can see that it’s a subroutine call without the ampersand, from the syntax alone.
or if Perl’s internal compiler has already seen the subroutine definition. However, if the subroutine has the
same name as a Perl built-in, you must use the ampersand to call your version.

my @cards = shuffle(@deck_of_cards);        # No & necessary on &shuffle since there is parameter list in paranthesis

### Non scalar return values from subroutine
sub list_from_fred_to_barney {
 if ($fred < $barney) {
     $fred..$barney;
 } else {
     reverse $barney..$fred;
 }
}

@c = &list_from_fred_to_barney;

### Persistent, private variables with 'state' declaration
Declaring our variable with state tells Perl to retain the variable’s value between calls to the
subroutine and to make the variable private to the subroutine. You can make any variable type a state variable;
it’s not just for scalars.

use 5.010;                                     # feature starting with Perl 5.10

sub marine {
 state $n = 0;
 state @numbers;
 print "Hello, sailor number $n!\n";
}

You can’t initialize arrays and hashes as state variables in list contexts as of Perl 5.10:
state @array = qw(a b c);                          # Error!

### Reading from standard input stream
while (defined($line = <STDIN>)) {
  chomp($line);
  print "I saw $line";
}

while (defined($_ = <STDIN>)) {                 # shortcut
  chomp;
  print "I saw $_";
}

This shortcut works only if you write it just like that. If you put a line-input operator
anywhere else (in particular, as a statement all on its own), it won’t read a line into $_
by default. It works only if there’s nothing but the line-input operator in the conditional
of a while/for loop. If you put anything else into the conditional expression, this shortcut
won’t apply.

foreach (<STDIN>) {
  print "I saw $_";
}

Evaluating the line-input operator in a list context gives you all of the (remaining) lines
of input as a list—each element of the list is one line.

### Diamond operator

$ ./my_program fred -  betty

while (defined($line = <>)) {
  chomp($line);
  print "It was $line that I saw!\n";
}

while (<>) {                                   # shortcut
  chomp;
  print "It was $_ that I saw!\n";
}

If you give no invocation arguments, the program should process the standard input stream.
Or, as a special case, if you give just a hyphen as one of the arguments, that means standard
input as well.* So, if the invocation arguments had been fred - betty, that would have meant
that the program should process file fred, followed by the standard input stream, followed by file betty.

### Invocation arguments @ARGV
The diamond operator looks in @ARGV to determine what filenames it should use. If it finds an empty list,
it uses the standard input stream; otherwise it uses the list of files that it finds.

### Output to standard output
print @array;                               # print a list of items
print "@array";                             # print a string (containing an interpolated array)

That first print statement will print a list of items, one after another, with no spaces in between
and the second prints the contents of @array, separated by spaces.

Generally, if your strings contain newlines, you simply want to print them, after all:
print @array;

But if they don’t contain newlines, you generally want to add one at the end:
print "@array\n";

print is looking for a list of strings to print, it evaluates its arguments in list context.
Since the diamond operator (as a special kind of line-input operator) returns a list of lines
in a list context, these can work well together.

print <>;                 # source code for 'cat'
print sort <>;            # source code for 'sort'

print has optional parentheses, which can some- times cause confusion. Remember the rule that
parentheses in Perl may always be omitted—except when doing so would change the meaning of a statement.

print (2+3)*4;          # Oops!

It takes the return value from print, which is 1, and multiplies that times 4.

### Formatted output

printf "%g %g %g\n", 5/2, 51/17, 51 ** 17; # 2.5 3 1.0683e+29

To print a number in what’s generally a good way, use %g,‡ which automatically
chooses floating-point, integer, or even exponential notation, as needed

printf "in %d days!\n", 17.85; # in 17 days!

The %d format means a decimal integer, truncated as needed

printf "%10s\n", "wilma";

The %s conversion means a string

printf "%12.3f\n", 6 * 7 + 2/3; # looks like ``````42.667

The %f conversion for floating point

printf "Monthly interest rate: %.2f%%\n", 5.25/12;

To print a real percent sign, use %%

### Arrays and printf
printf "The items are:\n".("%10s\n" x @items), @items;

Here you have @items being used once in a scalar context, to get its length,
and once in a list context, to get its contents

### Hashes
Hash elements spring into existence when you first assign to them and accessing outside the hash gives undef

$family_name{'wilma'} = 'flintstone';
$granite = $family_name{'larry'};                  # No larry here: undef

Assigning to a hash is a list-context assignment
%some_hash = ('foo', 35, 'bar', 12.4, 2.5, 'hello', 'wilma', 1.72e30, 'betty', "bye\n");

The value of the hash (in a list context) is a simple list of key-value pairs
@any_array = %some_hash;

Making an inverse hash
%ip_address = reverse %host_name;

Another way of assigning to a hash
my %last_name = ( 
  'dino' => undef,
  'barney' => 'rubble',
  'betty' => 'rubble',
);

You may omit the quote marks on some hash keys when you use the fat comma, which
automatically quotes the values to its left
my %last_name = (
  fred => 'flintstone',
  dino => undef,
  barney => 'rubble',
  betty => 'rubble',
);

Another place you are permitted to use this shortcut is the most common place a hash key appears:
in the curly braces of a hash element reference
$score{fred}                   # same as $score{'fred'} for simple string keys

### The keys and values functions

my @k = keys %hash;
my @v = values %hash;

In a scalar context, these functions give the number of elements (key- value pairs) in the hash.
my $count = keys %hash;

### The each function

The list assignment is happening in the conditional expression of the while loop, which is a scalar context.
The value of a list assignment in a scalar context is the number of elements in the source list.

while ( ($key, $value) = each %hash ) {
  print "$key => $value\n";
}

foreach $key (sort keys %hash) {       # in sorted key order
  $value = $hash{$key};
  print "$key => $value\n";            # or print with hash element interpolation "$key => $hash{$key}\n";
}

### The exists function

if (exists $books{"dino"}) {
  print "Hey, there's a library card for dino!\n";
}

### The delete function

delete $books{$person};

### The %ENV environment hash

print "PATH is $ENV{PATH}\n";




