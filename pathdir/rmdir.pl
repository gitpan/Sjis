# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{��} ne "\x82\xa0";

use Sjis;

system("del D�@�\\\file1.txt 2>NUL");
system("del D�@�\\\file2.txt 2>NUL");
system("del D�@�\\\file3.txt 2>NUL");

# rmdir
if (rmdir('D�@�\')) {
    print "ok - rmdir\n";
    system("mkdir D�@�\");
}
else {
    print "not ok - rmdir: $!\n";
}

__END__
