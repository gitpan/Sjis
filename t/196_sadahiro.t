# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;
print "1..4\n";

# ���^���� C<\U>, C<\L>, C<\Q>, C<\E> ����ѕϐ��W�J�͍l������Ă���܂���B
# �K�v�Ȃ�AC<""> (or C<qq//>) ���Z�q���g���Ă��������B

if ('ABC' =~ /\Uabc\E/) {
    print "ok - 1 $^X 01sadahiro.pl ('ABC' =~ /\\Uabc\\E/)\n";
}
else {
    print "not ok - 1 $^X 01sadahiro.pl ('ABC' =~ /\\Uabc\\E/)\n";
}

if ('def' =~ /\LDEF\E/) {
    print "ok - 2 $^X 01sadahiro.pl ('def' =~ /\\LDEF\\E/)\n";
}
else {
    print "not ok - 2 $^X 01sadahiro.pl ('def' =~ /\\LDEF\\E/)\n";
}

if ('({[' =~ /\Q({\[\E/) {
    print "ok - 3 $^X 01sadahiro.pl ('def' =~ /\\Q({\[\\E/)\n";
}
else {
    print "not ok - 3 $^X 01sadahiro.pl ('def' =~ /\\Q({\[\\E/)\n";
}

my $var = 'GHI';
if ('GHI' =~ /GHI/) {
    print "ok - 4 $^X 01sadahiro.pl ('GHI' =~ /GHI/)\n";
}
else {
    print "not ok - 4 $^X 01sadahiro.pl ('GHI' =~ /GHI/)\n";
}

__END__

http://search.cpan.org/dist/ShiftJIS-Regexp/
