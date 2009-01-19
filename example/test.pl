# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

use Sjis;

my $aaa = <<'END';
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
dt\alphabet\alpha.txt:aaa
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:aaa
!!dt\日本語!!
!!dt\日本語\alpha.txt!!
dt\日本語\alpha.txt:aaa
!!dt\日本語\sjis.txt!!
dt\日本語\sjis.txt:aaa
END

my $hyou = <<'END';
!!dt\alphabet!!
!!dt\alphabet\alpha.txt!!
!!dt\alphabet\sjis.txt!!
dt\alphabet\sjis.txt:表
!!dt\日本語!!
!!dt\日本語\alpha.txt!!
!!dt\日本語\sjis.txt!!
dt\日本語\sjis.txt:表
END

$_ = `perl grepdir.pl aaa dt`;
if ($_ eq $aaa) {
    print "ok - perl grepdir.pl aaa dt\n";
}
else {
    print "not ok - perl grepdir.pl aaa dt\n";
    print "($_)\n";
    print "($aaa)\n";
}

$_ = `perl grepdir.pl 表 dt`;
if ($_ eq $hyou) {
    print "ok - perl grepdir.pl 表 dt\n";
}
else {
    print "not ok - perl grepdir.pl 表 dt\n";
    print "($_)\n";
    print "($hyou)\n";
}

__END__
