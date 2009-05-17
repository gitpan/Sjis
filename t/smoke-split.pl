use strict;

mkdir('split', 0777);

my $script = "split\\split.pl";
open(SCRIPT,">$script")      || die "Can't open file: $script\n";
open(WANT,  ">$script.want") || die "Can't open file: $script.want\n";

#----------------------------------------------------------------------------
# split
#----------------------------------------------------------------------------

print SCRIPT <<'END';

$_ = "ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF\f‚©‚«‚­‚¯‚±";
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

$_ = "ABC D E ‚ ‚¢‚¤‚¦ ‚¨ NRT F‚©‚« ‚­‚¯‚±";
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

$_ = "ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF\f‚©‚«‚­‚¯‚±";
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

$_ = "ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF\f‚©‚«‚­‚¯‚±";
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

$_ = "ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF\f‚©‚«‚­‚¯‚±";
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

$_ = "ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF\f‚©‚«‚­‚¯‚±";
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
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
(A)(B)(C)(D)(E)(‚ )(‚¢)(‚¤)(‚¦)(‚¨)(N)(\n)(R)(\r)(T)(\t)(F)(\f)(‚©)(‚«)(‚­)(‚¯)(‚±)
END

print WANT <<"END";
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
(ABC)(D)(E)(‚ ‚¢‚¤‚¦)(‚¨)(NRT)(F‚©‚«)(‚­‚¯‚±)
END

print WANT <<"END";
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N)(R\rT\tF\f‚©‚«‚­‚¯‚±)
END

print WANT <<"END";
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR)(T\tF\f‚©‚«‚­‚¯‚±)
END

print WANT <<"END";
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT)(F\f‚©‚«‚­‚¯‚±)
END

print WANT <<"END";
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
(ABCDE‚ ‚¢‚¤‚¦‚¨N\nR\rT\tF)(‚©‚«‚­‚¯‚±)
END

close(SCRIPT);
close(WANT);

#----------------------------------------------------------------------------
