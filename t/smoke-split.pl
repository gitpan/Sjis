use strict;

mkdir('split', 0777);

my $script = "split\\split.pl";
open(SCRIPT,">$script") || die "Can't open file: $script\n";

#----------------------------------------------------------------------------
# split
#----------------------------------------------------------------------------

print SCRIPT <<'END';
split(m//);
split(m //);
split( m//);
split( m //);
split (m//);
split (m //);
split ( m//);
split ( m //);

split(//);
split( //);
split (//);
split ( //);

split m//;
split m //;

split//;
split //;

split(m/ +/);
split(m/ /);
split(m / +/);
split(m / /);
split( m/ +/);
split( m/ /);
split( m / +/);
split( m / /);
split (m/ +/);
split (m/ /);
split (m / +/);
split (m / /);
split ( m/ +/);
split ( m/ /);
split ( m / +/);
split ( m / /);

split(/ +/);
split(/ /);
split( / +/);
split( / /);
split (/ +/);
split (/ /);
split ( / +/);
split ( / /);

split m/ +/;
split m/ /;
split m / +/;
split m / /;

split/ +/;
split/ /;
split / +/;
split / /;

split(m/\n+/);
split(m/\r+/);
split(m/\t+/);
split(m/\f+/);
split(m/\n/);
split(m/\r/);
split(m/\t/);
split(m/\f/);
split(m /\n+/);
split(m /\r+/);
split(m /\t+/);
split(m /\f+/);
split(m /\n/);
split(m /\r/);
split(m /\t/);
split(m /\f/);
split( m/\n+/);
split( m/\r+/);
split( m/\t+/);
split( m/\f+/);
split( m/\n/);
split( m/\r/);
split( m/\t/);
split( m/\f/);
split( m /\n+/);
split( m /\r+/);
split( m /\t+/);
split( m /\f+/);
split( m /\n/);
split( m /\r/);
split( m /\t/);
split( m /\f/);
split (m/\n+/);
split (m/\r+/);
split (m/\t+/);
split (m/\f+/);
split (m/\n/);
split (m/\r/);
split (m/\t/);
split (m/\f/);
split (m /\n+/);
split (m /\r+/);
split (m /\t+/);
split (m /\f+/);
split (m /\n/);
split (m /\r/);
split (m /\t/);
split (m /\f/);
split ( m/\n+/);
split ( m/\r+/);
split ( m/\t+/);
split ( m/\f+/);
split ( m/\n/);
split ( m/\r/);
split ( m/\t/);
split ( m/\f/);
split ( m /\n+/);
split ( m /\r+/);
split ( m /\t+/);
split ( m /\f+/);
split ( m /\n/);
split ( m /\r/);
split ( m /\t/);
split ( m /\f/);

split(/\n+/);
split(/\r+/);
split(/\t+/);
split(/\f+/);
split(/\n/);
split(/\r/);
split(/\t/);
split(/\f/);
split( /\n+/);
split( /\r+/);
split( /\t+/);
split( /\f+/);
split( /\n/);
split( /\r/);
split( /\t/);
split( /\f/);
split (/\n+/);
split (/\r+/);
split (/\t+/);
split (/\f+/);
split (/\n/);
split (/\r/);
split (/\t/);
split (/\f/);
split ( /\n+/);
split ( /\r+/);
split ( /\t+/);
split ( /\f+/);
split ( /\n/);
split ( /\r/);
split ( /\t/);
split ( /\f/);

split m/\n+/;
split m/\r+/;
split m/\t+/;
split m/\f+/;
split m/\n/;
split m/\r/;
split m/\t/;
split m/\f/;
split m /\n+/;
split m /\r+/;
split m /\t+/;
split m /\f+/;
split m /\n/;
split m /\r/;
split m /\t/;
split m /\f/;

split/\n+/;
split/\r+/;
split/\t+/;
split/\f+/;
split/\n/;
split/\r/;
split/\t/;
split/\f/;
split /\n+/;
split /\r+/;
split /\t+/;
split /\f+/;
split /\n/;
split /\r/;
split /\t/;
split /\f/;

split;
END

close(SCRIPT);

#----------------------------------------------------------------------------
