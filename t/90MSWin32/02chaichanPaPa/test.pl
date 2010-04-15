use strict;
$| = 1;

chomp(my @script = <DATA>);

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /This is perl/;

    mkdir('hoge', 0777);
    system('echo 1 >hoge\\テストソース.txt');
    for my $script (@script) {
        if (`$perlbin $script 2>NUL` =~ /Match/) {
            print "ok - $perlbin $script\n";
        }
        else {
            print "not ok - $perlbin $script\n";
        }
    }
}

__END__
01kanji00.pl
02kanji01.pl
03kanji02x.pl
04kanji02.pl
