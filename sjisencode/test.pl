use strict;

for my $perlbin (qw(perl58 perl510)) {
    next unless `$perlbin -v` =~ /This is perl,/;

    @_ = split(/\n/,`$perlbin sjisencode.pl`);
    my @ok = grep(/^ok/,@_);
    if(scalar(@ok) == scalar(@_)){
        print "ok - $perlbin sjisencode.pl\n";
    }
    else{
        print "not ok - $perlbin sjisencode.pl\n";
    }
}

__END__
