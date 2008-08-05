use strict;

mkdir('split', 0777);

my $script = "split\\split.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

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

print map {"($_)"} split(m/\n+/); print "\n";
print map {"($_)"} split(m/\r+/); print "\n";
print map {"($_)"} split(m/\t+/); print "\n";
print map {"($_)"} split(m/\f+/); print "\n";
print map {"($_)"} split(m/\n/); print "\n";
print map {"($_)"} split(m/\r/); print "\n";
print map {"($_)"} split(m/\t/); print "\n";
print map {"($_)"} split(m/\f/); print "\n";
print map {"($_)"} split(m /\n+/); print "\n";
print map {"($_)"} split(m /\r+/); print "\n";
print map {"($_)"} split(m /\t+/); print "\n";
print map {"($_)"} split(m /\f+/); print "\n";
print map {"($_)"} split(m /\n/); print "\n";
print map {"($_)"} split(m /\r/); print "\n";
print map {"($_)"} split(m /\t/); print "\n";
print map {"($_)"} split(m /\f/); print "\n";
print map {"($_)"} split( m/\n+/); print "\n";
print map {"($_)"} split( m/\r+/); print "\n";
print map {"($_)"} split( m/\t+/); print "\n";
print map {"($_)"} split( m/\f+/); print "\n";
print map {"($_)"} split( m/\n/); print "\n";
print map {"($_)"} split( m/\r/); print "\n";
print map {"($_)"} split( m/\t/); print "\n";
print map {"($_)"} split( m/\f/); print "\n";
print map {"($_)"} split( m /\n+/); print "\n";
print map {"($_)"} split( m /\r+/); print "\n";
print map {"($_)"} split( m /\t+/); print "\n";
print map {"($_)"} split( m /\f+/); print "\n";
print map {"($_)"} split( m /\n/); print "\n";
print map {"($_)"} split( m /\r/); print "\n";
print map {"($_)"} split( m /\t/); print "\n";
print map {"($_)"} split( m /\f/); print "\n";
print map {"($_)"} split (m/\n+/); print "\n";
print map {"($_)"} split (m/\r+/); print "\n";
print map {"($_)"} split (m/\t+/); print "\n";
print map {"($_)"} split (m/\f+/); print "\n";
print map {"($_)"} split (m/\n/); print "\n";
print map {"($_)"} split (m/\r/); print "\n";
print map {"($_)"} split (m/\t/); print "\n";
print map {"($_)"} split (m/\f/); print "\n";
print map {"($_)"} split (m /\n+/); print "\n";
print map {"($_)"} split (m /\r+/); print "\n";
print map {"($_)"} split (m /\t+/); print "\n";
print map {"($_)"} split (m /\f+/); print "\n";
print map {"($_)"} split (m /\n/); print "\n";
print map {"($_)"} split (m /\r/); print "\n";
print map {"($_)"} split (m /\t/); print "\n";
print map {"($_)"} split (m /\f/); print "\n";
print map {"($_)"} split ( m/\n+/); print "\n";
print map {"($_)"} split ( m/\r+/); print "\n";
print map {"($_)"} split ( m/\t+/); print "\n";
print map {"($_)"} split ( m/\f+/); print "\n";
print map {"($_)"} split ( m/\n/); print "\n";
print map {"($_)"} split ( m/\r/); print "\n";
print map {"($_)"} split ( m/\t/); print "\n";
print map {"($_)"} split ( m/\f/); print "\n";
print map {"($_)"} split ( m /\n+/); print "\n";
print map {"($_)"} split ( m /\r+/); print "\n";
print map {"($_)"} split ( m /\t+/); print "\n";
print map {"($_)"} split ( m /\f+/); print "\n";
print map {"($_)"} split ( m /\n/); print "\n";
print map {"($_)"} split ( m /\r/); print "\n";
print map {"($_)"} split ( m /\t/); print "\n";
print map {"($_)"} split ( m /\f/); print "\n";

print map {"($_)"} split(/\n+/); print "\n";
print map {"($_)"} split(/\r+/); print "\n";
print map {"($_)"} split(/\t+/); print "\n";
print map {"($_)"} split(/\f+/); print "\n";
print map {"($_)"} split(/\n/); print "\n";
print map {"($_)"} split(/\r/); print "\n";
print map {"($_)"} split(/\t/); print "\n";
print map {"($_)"} split(/\f/); print "\n";
print map {"($_)"} split( /\n+/); print "\n";
print map {"($_)"} split( /\r+/); print "\n";
print map {"($_)"} split( /\t+/); print "\n";
print map {"($_)"} split( /\f+/); print "\n";
print map {"($_)"} split( /\n/); print "\n";
print map {"($_)"} split( /\r/); print "\n";
print map {"($_)"} split( /\t/); print "\n";
print map {"($_)"} split( /\f/); print "\n";
print map {"($_)"} split (/\n+/); print "\n";
print map {"($_)"} split (/\r+/); print "\n";
print map {"($_)"} split (/\t+/); print "\n";
print map {"($_)"} split (/\f+/); print "\n";
print map {"($_)"} split (/\n/); print "\n";
print map {"($_)"} split (/\r/); print "\n";
print map {"($_)"} split (/\t/); print "\n";
print map {"($_)"} split (/\f/); print "\n";
print map {"($_)"} split ( /\n+/); print "\n";
print map {"($_)"} split ( /\r+/); print "\n";
print map {"($_)"} split ( /\t+/); print "\n";
print map {"($_)"} split ( /\f+/); print "\n";
print map {"($_)"} split ( /\n/); print "\n";
print map {"($_)"} split ( /\r/); print "\n";
print map {"($_)"} split ( /\t/); print "\n";
print map {"($_)"} split ( /\f/); print "\n";

print map {"($_)"} split m/\n+/; print "\n";
print map {"($_)"} split m/\r+/; print "\n";
print map {"($_)"} split m/\t+/; print "\n";
print map {"($_)"} split m/\f+/; print "\n";
print map {"($_)"} split m/\n/; print "\n";
print map {"($_)"} split m/\r/; print "\n";
print map {"($_)"} split m/\t/; print "\n";
print map {"($_)"} split m/\f/; print "\n";
print map {"($_)"} split m /\n+/; print "\n";
print map {"($_)"} split m /\r+/; print "\n";
print map {"($_)"} split m /\t+/; print "\n";
print map {"($_)"} split m /\f+/; print "\n";
print map {"($_)"} split m /\n/; print "\n";
print map {"($_)"} split m /\r/; print "\n";
print map {"($_)"} split m /\t/; print "\n";
print map {"($_)"} split m /\f/; print "\n";

print map {"($_)"} split/\n+/; print "\n";
print map {"($_)"} split/\r+/; print "\n";
print map {"($_)"} split/\t+/; print "\n";
print map {"($_)"} split/\f+/; print "\n";
print map {"($_)"} split/\n/; print "\n";
print map {"($_)"} split/\r/; print "\n";
print map {"($_)"} split/\t/; print "\n";
print map {"($_)"} split/\f/; print "\n";
print map {"($_)"} split /\n+/; print "\n";
print map {"($_)"} split /\r+/; print "\n";
print map {"($_)"} split /\t+/; print "\n";
print map {"($_)"} split /\f+/; print "\n";
print map {"($_)"} split /\n/; print "\n";
print map {"($_)"} split /\r/; print "\n";
print map {"($_)"} split /\t/; print "\n";
print map {"($_)"} split /\f/; print "\n";

print map {"($_)"} split; print "\n";
END

close(SCRIPT);

#----------------------------------------------------------------------------
