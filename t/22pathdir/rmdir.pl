# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

system("del D機能\\file1.txt 2>NUL");
system("del D機能\\file2.txt 2>NUL");
system("del D機能\\file3.txt 2>NUL");

# rmdir
if (rmdir('D機能')) {
    print "ok - rmdir\n";
    system("mkdir D機能");
}
else {
    print "not ok - rmdir: $!\n";
}

__END__
