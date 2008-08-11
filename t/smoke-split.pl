use strict;

mkdir('split', 0777);

my $script = "split\\split.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# split
#----------------------------------------------------------------------------

print SCRIPT <<'END';

$_ = "ABCDEあいうえおN\nR\rT\tF\fかきくけこ";
print map {"($_)"} split(m//); print "\n";
print map {"($_)"} split(m //); print "\n";
print map {"($_)"} split( m//); print "\n";
print map {"($_)"} split( m //); print "\n";
print map {"($_)"} split (m//); print "\n";
print map {"($_)"} split (m //); print "\n";
print map {"($_)"} split ( m//); print "\n";
print map {"($_)"} split ( m //); print "\n";
print map {"($_)"} split(//); print "\n";
print map {"($_)"} split( //); print "\n";
print map {"($_)"} split (//); print "\n";
print map {"($_)"} split ( //); print "\n";
print map {"($_)"} split m//; print "\n";
print map {"($_)"} split m //; print "\n";
print map {"($_)"} split//; print "\n";
print map {"($_)"} split //; print "\n";

$_ = "ABC D E あいうえ お NRT Fかき くけこ";
print map {"($_)"} split(m/ +/); print "\n";
print map {"($_)"} split(m/ /); print "\n";
print map {"($_)"} split(m / +/); print "\n";
print map {"($_)"} split(m / /); print "\n";
print map {"($_)"} split( m/ +/); print "\n";
print map {"($_)"} split( m/ /); print "\n";
print map {"($_)"} split( m / +/); print "\n";
print map {"($_)"} split( m / /); print "\n";
print map {"($_)"} split (m/ +/); print "\n";
print map {"($_)"} split (m/ /); print "\n";
print map {"($_)"} split (m / +/); print "\n";
print map {"($_)"} split (m / /); print "\n";
print map {"($_)"} split ( m/ +/); print "\n";
print map {"($_)"} split ( m/ /); print "\n";
print map {"($_)"} split ( m / +/); print "\n";
print map {"($_)"} split ( m / /); print "\n";
print map {"($_)"} split(/ +/); print "\n";
print map {"($_)"} split(/ /); print "\n";
print map {"($_)"} split( / +/); print "\n";
print map {"($_)"} split( / /); print "\n";
print map {"($_)"} split (/ +/); print "\n";
print map {"($_)"} split (/ /); print "\n";
print map {"($_)"} split ( / +/); print "\n";
print map {"($_)"} split ( / /); print "\n";
print map {"($_)"} split m/ +/; print "\n";
print map {"($_)"} split m/ /; print "\n";
print map {"($_)"} split m / +/; print "\n";
print map {"($_)"} split m / /; print "\n";
print map {"($_)"} split/ +/; print "\n";
print map {"($_)"} split/ /; print "\n";
print map {"($_)"} split / +/; print "\n";
print map {"($_)"} split / /; print "\n";
print map {"($_)"} split; print "\n";

$_ = "ABCDEあいうえおN\nR\rT\tF\fかきくけこ";
print map {"($_)"} split(m/\n+/); print "\n";
print map {"($_)"} split(m/\n/); print "\n";
print map {"($_)"} split(m /\n+/); print "\n";
print map {"($_)"} split(m /\n/); print "\n";
print map {"($_)"} split( m/\n+/); print "\n";
print map {"($_)"} split( m/\n/); print "\n";
print map {"($_)"} split( m /\n+/); print "\n";
print map {"($_)"} split( m /\n/); print "\n";
print map {"($_)"} split (m/\n+/); print "\n";
print map {"($_)"} split (m/\n/); print "\n";
print map {"($_)"} split (m /\n+/); print "\n";
print map {"($_)"} split (m /\n/); print "\n";
print map {"($_)"} split ( m/\n+/); print "\n";
print map {"($_)"} split ( m/\n/); print "\n";
print map {"($_)"} split ( m /\n+/); print "\n";
print map {"($_)"} split ( m /\n/); print "\n";
print map {"($_)"} split(/\n+/); print "\n";
print map {"($_)"} split(/\n/); print "\n";
print map {"($_)"} split( /\n+/); print "\n";
print map {"($_)"} split( /\n/); print "\n";
print map {"($_)"} split (/\n+/); print "\n";
print map {"($_)"} split (/\n/); print "\n";
print map {"($_)"} split ( /\n+/); print "\n";
print map {"($_)"} split ( /\n/); print "\n";
print map {"($_)"} split m/\n+/; print "\n";
print map {"($_)"} split m/\n/; print "\n";
print map {"($_)"} split m /\n+/; print "\n";
print map {"($_)"} split m /\n/; print "\n";
print map {"($_)"} split/\n+/; print "\n";
print map {"($_)"} split/\n/; print "\n";
print map {"($_)"} split /\n+/; print "\n";
print map {"($_)"} split /\n/; print "\n";

$_ = "ABCDEあいうえおN\nR\rT\tF\fかきくけこ";
print map {"($_)"} split(m/\r+/); print "\n";
print map {"($_)"} split(m/\r/); print "\n";
print map {"($_)"} split(m /\r+/); print "\n";
print map {"($_)"} split(m /\r/); print "\n";
print map {"($_)"} split( m/\r+/); print "\n";
print map {"($_)"} split( m/\r/); print "\n";
print map {"($_)"} split( m /\r+/); print "\n";
print map {"($_)"} split( m /\r/); print "\n";
print map {"($_)"} split (m/\r+/); print "\n";
print map {"($_)"} split (m/\r/); print "\n";
print map {"($_)"} split (m /\r+/); print "\n";
print map {"($_)"} split (m /\r/); print "\n";
print map {"($_)"} split ( m/\r+/); print "\n";
print map {"($_)"} split ( m/\r/); print "\n";
print map {"($_)"} split ( m /\r+/); print "\n";
print map {"($_)"} split ( m /\r/); print "\n";
print map {"($_)"} split(/\r+/); print "\n";
print map {"($_)"} split(/\r/); print "\n";
print map {"($_)"} split( /\r+/); print "\n";
print map {"($_)"} split( /\r/); print "\n";
print map {"($_)"} split (/\r+/); print "\n";
print map {"($_)"} split (/\r/); print "\n";
print map {"($_)"} split ( /\r+/); print "\n";
print map {"($_)"} split ( /\r/); print "\n";
print map {"($_)"} split m/\r+/; print "\n";
print map {"($_)"} split m/\r/; print "\n";
print map {"($_)"} split m /\r+/; print "\n";
print map {"($_)"} split m /\r/; print "\n";
print map {"($_)"} split/\r+/; print "\n";
print map {"($_)"} split/\r/; print "\n";
print map {"($_)"} split /\r+/; print "\n";
print map {"($_)"} split /\r/; print "\n";

$_ = "ABCDEあいうえおN\nR\rT\tF\fかきくけこ";
print map {"($_)"} split(m/\t+/); print "\n";
print map {"($_)"} split(m/\t/); print "\n";
print map {"($_)"} split(m /\t+/); print "\n";
print map {"($_)"} split(m /\t/); print "\n";
print map {"($_)"} split( m/\t+/); print "\n";
print map {"($_)"} split( m/\t/); print "\n";
print map {"($_)"} split( m /\t+/); print "\n";
print map {"($_)"} split( m /\t/); print "\n";
print map {"($_)"} split (m/\t+/); print "\n";
print map {"($_)"} split (m/\t/); print "\n";
print map {"($_)"} split (m /\t+/); print "\n";
print map {"($_)"} split (m /\t/); print "\n";
print map {"($_)"} split ( m/\t+/); print "\n";
print map {"($_)"} split ( m/\t/); print "\n";
print map {"($_)"} split ( m /\t+/); print "\n";
print map {"($_)"} split ( m /\t/); print "\n";
print map {"($_)"} split(/\t+/); print "\n";
print map {"($_)"} split(/\t/); print "\n";
print map {"($_)"} split( /\t+/); print "\n";
print map {"($_)"} split( /\t/); print "\n";
print map {"($_)"} split (/\t+/); print "\n";
print map {"($_)"} split (/\t/); print "\n";
print map {"($_)"} split ( /\t+/); print "\n";
print map {"($_)"} split ( /\t/); print "\n";
print map {"($_)"} split m/\t+/; print "\n";
print map {"($_)"} split m/\t/; print "\n";
print map {"($_)"} split m /\t+/; print "\n";
print map {"($_)"} split m /\t/; print "\n";
print map {"($_)"} split/\t+/; print "\n";
print map {"($_)"} split/\t/; print "\n";
print map {"($_)"} split /\t+/; print "\n";
print map {"($_)"} split /\t/; print "\n";

$_ = "ABCDEあいうえおN\nR\rT\tF\fかきくけこ";
print map {"($_)"} split(m/\f+/); print "\n";
print map {"($_)"} split(m/\f/); print "\n";
print map {"($_)"} split(m /\f+/); print "\n";
print map {"($_)"} split(m /\f/); print "\n";
print map {"($_)"} split( m/\f+/); print "\n";
print map {"($_)"} split( m/\f/); print "\n";
print map {"($_)"} split( m /\f+/); print "\n";
print map {"($_)"} split( m /\f/); print "\n";
print map {"($_)"} split (m/\f+/); print "\n";
print map {"($_)"} split (m/\f/); print "\n";
print map {"($_)"} split (m /\f+/); print "\n";
print map {"($_)"} split (m /\f/); print "\n";
print map {"($_)"} split ( m/\f+/); print "\n";
print map {"($_)"} split ( m/\f/); print "\n";
print map {"($_)"} split ( m /\f+/); print "\n";
print map {"($_)"} split ( m /\f/); print "\n";
print map {"($_)"} split(/\f+/); print "\n";
print map {"($_)"} split(/\f/); print "\n";
print map {"($_)"} split( /\f+/); print "\n";
print map {"($_)"} split( /\f/); print "\n";
print map {"($_)"} split (/\f+/); print "\n";
print map {"($_)"} split (/\f/); print "\n";
print map {"($_)"} split ( /\f+/); print "\n";
print map {"($_)"} split ( /\f/); print "\n";
print map {"($_)"} split m/\f+/; print "\n";
print map {"($_)"} split m/\f/; print "\n";
print map {"($_)"} split m /\f+/; print "\n";
print map {"($_)"} split m /\f/; print "\n";
print map {"($_)"} split/\f+/; print "\n";
print map {"($_)"} split/\f/; print "\n";
print map {"($_)"} split /\f+/; print "\n";
print map {"($_)"} split /\f/; print "\n";
END

print WANT <<"END";
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
(A)(B)(C)(D)(E)(あ)(い)(う)(え)(お)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(か)(き)(く)(け)(こ)
END

print WANT <<"END";
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
(ABC)(D)(E)(あいうえ)(お)(NRT)(Fかき)(くけこ)
END

print WANT <<"END";
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
(ABCDEあいうえおN)(R\rT\tF\fかきくけこ)
END

print WANT <<"END";
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
(ABCDEあいうえおN\nR)(T\tF\fかきくけこ)
END

print WANT <<"END";
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
(ABCDEあいうえおN\nR\rT)(F\fかきくけこ)
END

print WANT <<"END";
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
(ABCDEあいうえおN\nR\rT\tF)(かきくけこ)
END

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
