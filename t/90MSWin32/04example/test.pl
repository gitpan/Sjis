use Esjis;
use re 'eval';
# This file is encoded in ShiftJIS.
die "This file is not encoded in ShiftJIS.\n" if q{あ} ne "\x82\xa0";

$| = 1;

mkdir('dt',0777);
mkdir('dt\\alphabet',0777);
mkdir('dt\\日本語',0777);

open(FILE,">dt\\alphabet\\alpha.txt") || die "Can't open file: dt\\alphabet\\alpha.txt\n";
print FILE <<'END';
aaa
bbb
ccc
ddd
eee
END
close(FILE);

open(FILE,">dt\\日本語\\alpha.txt") || die "Can't open file: dt\\日本語\\alpha.txt\n";
print FILE <<'END';
aaa
bbb
ccc
ddd
eee
END
close(FILE);

open(FILE,">dt\\alphabet\\sjis.txt") || die "Can't open file: dt\\alphabet\\sjis.txt\n";
print FILE <<'END';
aaa
あああ
bbb
いいい
ccc
ううう
ddd
表
eee
END
close(FILE);

open(FILE,">dt\\日本語\\sjis.txt") || die "Can't open file: dt\\日本語\\sjis.txt\n";
print FILE <<'END';
aaa
あああ
bbb
いいい
ccc
ううう
ddd
表
eee
END
close(FILE);

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

for my $perlbin (qw(perl55 perl56 perl58 perl510 perl512)) {
    next unless `$perlbin -v 2>NUL` =~ /\G(?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x81-\x9F\xE0-\xFC])*?(?:This is perl)(?{Esjis::m_matched})/;

    $_ = `$perlbin grepdir.pl aaa dt 2>NUL`;
    sleep 1;
    if ($_ eq $aaa) {
        print "ok - $perlbin grepdir.pl aaa dt \n";
    }
    else {
        print "not ok - $perlbin grepdir.pl aaa dt \n";
        print "($_)\n";
        print "($aaa)\n";
    }

    $_ = `$perlbin grepdir.pl 表\ dt 2>NUL`;
    sleep 1;
    if ($_ eq $hyou) {
        print "ok - $perlbin grepdir.pl 表\ dt\n";
    }
    else {
        print "not ok - $perlbin grepdir.pl 表\ dt\n";
        print "($_)\n";
        print "($hyou)\n";
    }
    sleep 1;
}

__END__
