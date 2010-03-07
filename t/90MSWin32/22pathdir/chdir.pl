# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{‚ } ne "\x82\xa0";

my $__FILE__ = __FILE__;

use Sjis;

my $cwd1 = `chdir`;
eval {
    chdir('directory');
};
if ($@) {
    print "not ok - chdir (1/2) $^X $__FILE__\n";
}
else {
    my $cwd2 = `chdir`;
    if ($cmd1 ne $cwd2) {
        print "ok - chdir (1/2) $^X $__FILE__\n";
        chdir('..');
    }
    else {
        print "not ok - chdir (1/2) $^X $__FILE__\n";
    }
}

# chdir must die
eval {
    chdir('D‹@”\');
};
if ($@) {
    if ($] =~ /^5\.005/) {
        print "not ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.006/) {
        print "ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.008/) {
        print "ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.010/) {
        print "ok - chdir (2/2) $^X $__FILE__\n";
    }
    else {
        print "ok - chdir (2/2) $^X $__FILE__\n";
    }
}
else {
    if ($] =~ /^5\.005/) {
        print "ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.006/) {
        print "not ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.008/) {
        print "not ok - chdir (2/2) $^X $__FILE__\n";
    }
    elsif ($] =~ /^5\.010/) {
        print "not ok - chdir (2/2) $^X $__FILE__\n";
    }
    else {
        print "not ok - chdir (2/2) $^X $__FILE__\n";
    }
}

__END__

