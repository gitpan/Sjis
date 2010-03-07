1;
__END__

=pod

=encoding Shift_JIS

=head1 ƒ\ƒtƒgƒEƒFƒA–¼Ì

Sjis-JA - "Yet Another JPerl" Source code filter to escape ShiftJIS (Japanese document)

=head1 ŠT—v

  œ Žg‚¢•û: A

    ƒXƒNƒŠƒvƒg ShiftJIS_script.pl ‚Ì’†‚ÉˆÈ‰º‚ð‹Lq‚µ‚Ä...
      use Sjis;
      use Sjis version;          --- Sjis.pm ‚Ìƒo[ƒWƒ‡ƒ“ƒ`ƒFƒbƒN‚ðs‚¤ê‡
      use Sjis qw(ord reverse);  --- ord, reverse ‚ÌŠg’£‹@”\‚ðŽg‚¤ê‡
      use Sjis version qw(ord reverse);

      ¦ no Sjis; ‚Í—˜—p‚Å‚«‚Ü‚¹‚ñB

      Žg‚¦‚éŠÖ”
        Sjis::ord(...);
        Sjis::reverse(...);
        Sjis::length(...);
        Sjis::substr(...);
        Sjis::index(...);
        Sjis::rindex(...);

    ƒRƒ}ƒ“ƒhƒvƒƒ“ƒvƒg‚ÅˆÈ‰º‚Ì‚æ‚¤‚ÉŽÀs‚·‚é
      perl     ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl58   ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl510  ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...
      perl512  ShiftJIS_script.pl  wild*  *card  and  '*quote*'  are  ok  ...

      ? * ‚ðŽg‚Á‚ÄƒƒCƒ‹ƒhƒJ[ƒh‚ÌŽw’è‚ª‚Å‚«‚Ü‚·
      ' ` ' ‚ðŽg‚Á‚ÄƒNƒH[ƒg‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·

  œ Žg‚¢•û: B

    ƒRƒ}ƒ“ƒhƒvƒƒ“ƒvƒg‚ÅˆÈ‰º‚Ì‚æ‚¤‚ÉŽÀs‚·‚é

      C:\>perl  Sjis.pm  ShiftJIS_script.pl  >  Escaped_script.pl.e
      C:\>perl  Escaped_script.pl.e

      ShiftJIS_script.pl  --- ShiftJIS ‚Å‘‚©‚ê‚½ƒXƒNƒŠƒvƒg
      Escaped_script.pl.e --- ƒGƒXƒP[ƒv‚³‚ê‚½ƒXƒNƒŠƒvƒg

=head1 —v–ñ

‚±‚ê‚Ü‚Å‚Ì—ðŽj‚©‚ç‚Í‚¶‚ß‚Ü‚µ‚å‚¤BShiftJIS ‚ÌƒTƒ|[ƒg‚Í jperl 4.019+1.3 ‚©‚çŽn
‚Ü‚è‚Ü‚µ‚½B‚±‚ê‚É‚æ‚Á‚Ä chop() ‚È‚Ç‚ÌŠÖ”‚â³‹K•\Œ»‚ð•¡ŽG‚È“ú–{‚Ì•¶Žš‚É‘Î‚µ‚Ä
“K—p‚Å‚«‚é‚æ‚¤‚É‚È‚è‚Ü‚µ‚½B

Perl5.8 ˆÈ~‚Í Encode ƒ‚ƒWƒ…[ƒ‹‚É‚æ‚Á‚Äƒ}ƒ‹ƒ`ƒŠƒ“ƒKƒ‹ˆ—‚ªƒTƒ|[ƒg‚³‚ê‚½‚½‚ßA
jperl ‚Í•s—v‚É‚È‚Á‚½‚ÆŒ¾‚í‚ê‚Ä‚¢‚Ü‚·B‚Å‚·‚ªA‚»‚ê‚Í–{“–‚È‚Ì‚Å‚µ‚å‚¤‚©H

“ú–{‘“à‚É‚¨‚¢‚ÄA”Ä—p‘åŒ^ƒRƒ“ƒsƒ…[ƒ^‚Ì“üo—ÍAƒp[ƒ\ƒiƒ‹ƒRƒ“ƒsƒ…[ƒ^‚Ì“à•”ƒR[
ƒh‚¨‚æ‚Ñ“üo—ÍA‚³‚ç‚É‚ÍŒg‘Ñ“d˜b‚ÉŽŠ‚é‚Ü‚ÅAShiftJIS ‚ðŠî–{‚Æ‚µ‚½•¶ŽšƒR[ƒh
‚ªL‚­Žg‚í‚ê‚Ä‚¢‚Ü‚·B‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í‚»‚Ì ShiftJIS ‚ð’¼Úˆµ‚¢‚Ü‚·B‚»‚Ì‚½‚ß
UTF8 ƒtƒ‰ƒO‚Í‚ ‚è‚Ü‚¹‚ñB

‚ ‚È‚½‚àƒGƒ“ƒR[ƒh‚Ì–â‘è‚©‚çƒGƒXƒP[ƒv‚µ‚Ü‚¹‚ñ‚©H

=head1 ‚à‚¤‚Ð‚Æ‚Â‚Ì–¢—ˆ

JPerl ‚Í‚Æ‚Ä‚à—D‚ê‚½ƒ\ƒtƒgƒEƒFƒA‚Å‚·B‚¨‚Á‚ÆA‚±‚±‚Å‚¢‚¤ JPerl ‚Í“ú–{Œê‘Î‰ž”Å‚Ì
Perl ‚Ì‚±‚Æ‚ÅAJava ‚â JVM ‚Æ‚ÍŠÖŒW‚ª‚ ‚è‚Ü‚¹‚ñB‚»‚ñ‚È‚í‚¯‚ÅA‚±‚Ìƒ\ƒtƒgƒEƒFƒA
‚ÍÕ“Ë‰ñ”ð‚Ì‚½‚ß‚É Sjis ‚Æ‚¢‚¤–¼‘O‚É‚µ‚Ü‚µ‚½B

‚Æ‚±‚ë‚ÅA‚»‚Ì JPerl ‚Íƒo[ƒWƒ‡ƒ“ 5.005_4 ˆÈ~Aƒƒ“ƒeƒiƒ“ƒX‚³‚ê‚Ä‚¢‚Ü‚¹‚ñB

‘å•ÏŽc”O‚È‚±‚Æ‚ÉAJPerl‚ÌŠJ”­‚ðs‚Á‚½“n•Ó ”Ž•¶‚³‚ñ‚Í The Perl Confernce Japan
1998 ‚É‚Ä

  "‚í‚½‚È‚×‚Í”æ‚ê‚½‚©‚çŽŸ‚Ìl‚æ‚ë‚µ‚­‚Ë"

‚Æ‚¢‚¤ƒƒbƒZ[ƒW‚ðŽc‚µAPerl ‚©‚ç—£‚ê‚Ä‚¢‚Á‚Ä‚µ‚Ü‚¢‚Ü‚µ‚½B

ƒXƒ‰ƒCƒh15 "jperl ‚Ì¡Œã"
ftp://ftp.oreilly.co.jp/pcjp98/watanabe/jperlconf.ppt

‚«‚Á‚Æ’N‚©‚ªˆø‚«Œp‚¢‚Å‘‚¢‚Ä‚­‚ê‚é‚¾‚ë‚¤B
‚È‚Ç‚ÆŠú‘Ò‚ð‚µ‚È‚ª‚ç10”NŠÔA‘Ò‚¿‘±‚¯‚éŠÔ‚É¢ŠE‚Íˆá‚¤•ûŒü‚Ö‚Æi‚ñ‚Å‚¢‚­‚Ì‚Å‚µ‚½B

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í ShiftJIS ‚Å‘‚©‚ê‚½ Perl ƒXƒNƒŠƒvƒg‚ðƒGƒXƒP[ƒvˆ—‚·‚é‚½‚ß‚Ì
ƒ\[ƒXƒR[ƒhƒtƒBƒ‹ƒ^‚Å‚·BƒGƒXƒP[ƒvˆ—‚É‚æ‚Á‚Ä•¶ŽšƒR[ƒh‚ª•Ï‰»‚·‚é‚±‚Æ‚Í‚ ‚è
‚Ü‚¹‚ñB

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚ÍˆÈ‰º‚Ì“Á’¥‚ª‚ ‚è‚Ü‚·B

=over 2

=item * ShiftJIS ‚»‚Ì‚Ü‚Ü‚Ì’l‚ðˆµ‚¤

=item * ‰ß‹Ž‚ÆŒ»Ý‚ÌƒXƒNƒŠƒvƒgŠÔ‚ÅƒR[ƒhAƒmƒEƒnƒE‚ð‹¤—L‚Å‚«‚é

=item * UTF8 ƒtƒ‰ƒO‚ðˆµ‚í‚È‚¢‚Å‚·‚Þ(perlunitut ‚Æ perluniadvice ‚Ì‘Î‰ž‚Í•s—v)

=item * ‚Å‚à Perl5 ‚Æ‚ÍŒÝŠ·«‚ª‚ ‚é (‚Í‚¸‚¾)

=item * (JPerl‚ð•ÛŽç‚·‚é‚½‚ß‚É) C ƒvƒƒOƒ‰ƒ~ƒ“ƒO‚ðs‚í‚È‚¢‚Å‚·‚Þ

=back

‚³‚ AJPerl ‚Ì–¢—ˆ‚É‚æ‚Á‚Ä‚à‚¤‚Ð‚Æ‚Â‚Ì–¢—ˆ‚ðì‚è‚Ü‚µ‚å‚¤B

=head1 Šî–{“I‚ÈŽd‘g‚Ý

Å‹ßAˆÈ‰º‚Ìƒ[ƒ‹‚ðÄ”­Œ©‚µ‚Ü‚µ‚½B

[Tokyo.pm] jus Benkyoukai
http://mail.pm.org/pipermail/tokyo-pm/1999-September/001854.html
("SJIS.pm" ‚Æ‚¢‚¤ƒtƒ@ƒCƒ‹–¼‚Å•Û‘¶‚³‚ê‚Ä‚¢‚é‚à‚Ì‚Æ‚µ‚Ü‚·)

  package SJIS;
  use Filter::Util::Call;
  sub multibyte_filter {
      my $status;
      if (($status = filter_read()) > 0 ) {
          s/([\x81-\x9f\xe0-\xef])([\x40-\x7e\x80-\xfc])/
              sprintf("\\x%02x\\x%02x",ord($1),ord($2))
          /eg;
      }
      $status;
  }
  sub import {
      filter_add(\&multibyte_filter);
  }
  1;

Šî–{“I‚É‚ÍA‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Íã‹L‚Ì‚æ‚¤‚È‚±‚Æ‚ðs‚¢‚Ü‚·B
‚½‚¾‚µAFilter::Util::Call ‚ð—˜—p‚µ‚Ä‚¢‚È‚¢“_APerl ‚Ì\•¶‚ð‰ðÍ‚µ‚Ä•K—v‚É‰ž‚¶‚Ä
ƒGƒXƒP[ƒv‚·‚é“_‚ªˆÙ‚È‚è‚Ü‚·B

=head1 ƒCƒ“ƒXƒg[ƒ‹•û–@

   perl Makefile.pl         --- Makefile.pl ‚ª make.bat ‚ð¶¬‚µ‚Ü‚·
   make.bat install
   make.bat test

   make.bat install         --- Œ»ÝŽg—p’†‚Ì perl ŠÂ‹«‚ÉƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·
   perl58 make.bat install  --- perl5.008 ŠÂ‹«‚ÉƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·
   perl510 make.bat install --- perl5.010 ŠÂ‹«‚ÉƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·
   perl512 make.bat install --- perl5.012 ŠÂ‹«‚ÉƒCƒ“ƒXƒg[ƒ‹‚µ‚Ü‚·

   make.bat dist            --- CPAN ”z•z—pƒpƒbƒP[ƒW‚ðì‚è‚Ü‚·
   make.bat tar.bat         --- tar.bat ‚ðì¬‚µ‚Ü‚·

=head1 ƒ\ƒtƒgƒEƒFƒA‚Ìˆê——

   Sjis.pm          --- ShiftJIS ƒ\[ƒXƒR[ƒhƒtƒBƒ‹ƒ^ƒ‚ƒWƒ…[ƒ‹
   Esjis.pm         --- Sjis.pm ‚Ìƒ‰ƒ“ƒ^ƒCƒ€ƒ‹[ƒ`ƒ“
   perl58.bat       --- ŠÂ‹«•Ï” PATH ‚ÌÝ’è‚È‚µ‚É perl5.8 ‚ð’T‚µ‚ÄŽÀs‚·‚é
   perl510.bat      --- ŠÂ‹«•Ï” PATH ‚ÌÝ’è‚È‚µ‚É perl5.10 ‚ð’T‚µ‚ÄŽÀs‚·‚é
   perl512.bat      --- ŠÂ‹«•Ï” PATH ‚ÌÝ’è‚È‚µ‚É perl5.12 ‚ð’T‚µ‚ÄŽÀs‚·‚é

=head1 •¶ŽšƒNƒ‰ƒX‚Ì’è‹`

‰ß‹Ž‚Ìperl‚Æ‚ÌŒÝŠ·«‚ð•Û‚Â‚½‚ß‚É•¶ŽšƒNƒ‰ƒX‚ÍˆÈ‰º‚Ì‚æ‚¤‚ÉÄ’è‹`‚³‚ê‚Ä‚¢‚Ü‚·B

  ---------------------------------------------------------------------------
  escape        class
  ---------------------------------------------------------------------------
  \d            [0-9]
  \s            [\x09\x0A\x0C\x0D\x20]
  \w            [0-9A-Z_a-z]
  \D            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9])
  \S            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x09\x0A\x0C\x0D\x20])
  \W            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^0-9A-Z_a-z])
  \h            [\x09\x20]
  \v            [\x0C\x0A\x0D]
  \H            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x09\x20])
  \V            (?:[\x81-\x9F\xE0-\xFC][\x00-\xFF]|[^\x0C\x0A\x0D])
  ---------------------------------------------------------------------------

=head1 JPerl ŒÝŠ·‚Ì‹@”\

ˆÈ‰º‚ÌŠÖ”‚Í JPerl ‚Æ“¯—l‚É‹@”\‚µ‚Ü‚·B
‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚É‚æ‚Á‚Ä‘‚«Š·‚í‚éŠÖ”‚ª‚ ‚è‚Ü‚·B

=over 2

=item * ƒVƒ“ƒOƒ‹ƒNƒH[ƒg’†‚Ì2ƒIƒNƒeƒbƒgƒR[ƒh•¶Žš—ñ‚Ìˆµ‚¢

=item * ƒ_ƒuƒ‹ƒNƒH[ƒg’†‚Ì2ƒIƒNƒeƒbƒgƒR[ƒh•¶Žš—ñ‚Ìˆµ‚¢

=item * ƒVƒ“ƒOƒ‹ƒNƒH[ƒg’†‚Ì2ƒIƒNƒeƒbƒgƒR[ƒh³‹K•\Œ»‚Ìˆµ‚¢

=item * ƒ_ƒuƒ‹ƒNƒH[ƒg’†‚Ì2ƒIƒNƒeƒbƒgƒR[ƒh³‹K•\Œ»‚Ìˆµ‚¢

=item * chop ‚Í Esjis::chop ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * split ‚Í Esjis::split ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * length ‚Í‚»‚Ì‚Ü‚Ü‚Å‚·

=item * substr ‚Í‚»‚Ì‚Ü‚Ü‚Å‚·

=item * index ‚Í Esjis::index ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * rindex ‚Í Esjis::rindex ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * pos ‚Í‚»‚Ì‚Ü‚Ü‚Å‚·

=item * lc ‚Í Esjis::lc ‚Ü‚½‚Í Esjis::lc_ ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * uc ‚Í Esjis::uc ‚Ü‚½‚Í Esjis::uc_ ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * ord ‚Í‚»‚Ì‚Ü‚Ü‚Å‚·(ƒCƒ“ƒ|[ƒg‚µ‚È‚¢ê‡)

=item * reverse ‚Í‚»‚Ì‚Ü‚Ü‚Å‚·(ƒCƒ“ƒ|[ƒg‚µ‚È‚¢ê‡)

=item * tr/// ‚Ü‚½‚Í y/// ‚Í Esjis::tr ‚É‘‚«Š·‚í‚è‚Ü‚·

    /b ‚Æ /B CüŽq‚ª—˜—p‚Å‚«‚Ü‚·B

=item * chdir ‚Í Esjis::chdir ‚É‘‚«Š·‚í‚è‚Ü‚·

    MSWin32 ŠÂ‹«‚Ìê‡‚Í perl5.005 ‚ÉŒÀ‚è•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ
    ‚ª‚Å‚«‚Ü‚·B

=item * do file ‚Í Esjis::do file ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * require ‚Í Esjis::require ‚É‘‚«Š·‚í‚è‚Ü‚·

=item * use Perl::Module @list; ‚Í

    BEGIN { Esjis::require 'Perl/Module.pm'; Perl::Module->import(@list); } ‚É
    ‘‚«Š·‚í‚è‚Ü‚·B

=item * use Perl::Module (); ‚Í

    BEGIN { Esjis::require 'Perl/Module.pm'; } ‚É‘‚«Š·‚í‚è‚Ü‚·B

=back

=head1 JPerl ‚ÆãˆÊŒÝŠ·‚Ì‹@”\

ˆÈ‰º‚Ì‹@”\‚Í JPerl ‚ÆãˆÊŒÝŠ·‚Å‚·B

=over 2

=item * chr ‚Í Esjis::chr ‚Ü‚½‚Í Esjis::chr_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    2ƒIƒNƒeƒbƒgƒR[ƒh‚É‘Î‰ž‚µ‚Ä‚¢‚Ü‚·B

=item * -X (ƒtƒ@ƒCƒ‹ƒeƒXƒg‰‰ŽZŽq) ‚Í Esjis::X ‚Ü‚½‚Í Esjis::X_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    —á‚¦‚Î“ÇŽæ‚è‰Â”\‚©‚Ç‚¤‚©‚ðƒeƒXƒg‚·‚é -r ‚Í Esjis::r ‚É‚È‚è‚Ü‚·B

    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=item * glob ‚Í Esjis::glob ‚Ü‚½‚Í Esjis::glob_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    @glob = Esjis::glob($string);
    @glob = Esjis::glob_;

    Esjis::glob ‚ÍAOSŠÔ‚Å‰Â”À«‚Ì‚ ‚éŠg’£‚³‚ê‚½DOS•—ƒOƒƒu(ƒƒCƒ‹ƒhƒJ[ƒh)
    ‹@”\‚ð’ñ‹Ÿ‚µ‚Ü‚·BƒfƒBƒŒƒNƒgƒŠƒpƒX‚É‚àƒƒCƒ‹ƒhƒJ[ƒh‚ªŽg—p‚Å‚«A‘å•¶Žš‚©
    ¬•¶Žš‚Ì‹æ•Ê‚ª‚È‚­A‹tƒXƒ‰ƒbƒVƒ…‚ÆƒXƒ‰ƒbƒVƒ…‚ª—¼•ûŽg—p‚Å‚«‚Ü‚·(‚½‚¾‚µ
    ‹tƒXƒ‰ƒbƒVƒ…‚Í2d‚É‚µ‚È‚¯‚ê‚Î‚È‚è‚Ü‚¹‚ñ)B

    ŽÀs•û–@‚ÍA

    use Sjis;
    @perlfiles = glob  "..\pe?l/*.p?";
    print <..\pe?l/*.p?>;

    "~" ‚ÍŒ»Ý‚Ìƒ†[ƒU‚Ìƒz[ƒ€ƒfƒBƒŒƒNƒgƒŠ‚É“WŠJ‚³‚ê‚Ü‚·B
    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=item * lstat ‚Í Esjis::lstat ‚Ü‚½‚Í Esjis::lstat_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=item * opendir ‚Í Esjis::opendir ‚É‘‚«Š·‚í‚è‚Ü‚·

    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=item * stat ‚Í Esjis::stat ‚Ü‚½‚Í Esjis::stat_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=item * unlink ‚Í Esjis::unlink ‚É‘‚«Š·‚í‚è‚Ü‚·

    MSWin32 ŠÂ‹«‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚·B

=back

=head1 •¶ŽšŽwŒü‚ÌŠÖ”

=item * ord ‚Í Sjis::ord ‚Ü‚½‚Í Sjis::ord_ ‚É‘‚«Š·‚í‚è‚Ü‚·

    "use Sjis qw(ord);" ‚É‚æ‚Á‚Ä ord ‚Í Sjis::ord ‚É‘‚«Š·‚í‚é‚æ‚¤‚É‚È‚è‚Ü‚·B

    $ord = Sjis::ord($string);

    Sjis::ord($string) ‚Í $string ‚Ìæ“ª‚Ì•¶Žš‚Ì ShiftJIS ƒR[ƒh’l‚ð•Ô‚µ‚Ü‚·B
    $string ‚ªÈ—ª‚³‚ê‚½ê‡‚Í $_ ‚ª‘ÎÛ‚Æ‚È‚è‚Ü‚·B‚±‚ÌŠÖ”‚Íí‚É•„†‚È‚µ‚Ì
    ’l‚ð•Ô‚µ‚Ü‚·B

    ‚±‚Ì“®ì‚Í JPerl ‚Æ”ñŒÝŠ·‚È‚Ì‚Å–¾Ž¦“I‚ÉƒCƒ“ƒ|[ƒg‚µ‚½ê‡‚Ì‚Ý‹@”\‚·‚é‚æ‚¤‚É
    ‚È‚Á‚Ä‚¢‚Ü‚·B

=item * reverse ‚Í Sjis::reverse ‚É‘‚«Š·‚í‚è‚Ü‚·

    "use Sjis qw(reverse);" ‚É‚æ‚Á‚Ä reverse ‚Í Sjis::reverse ‚É‘‚«Š·‚í‚é‚æ‚¤
    ‚É‚È‚è‚Ü‚·B

    @reverse = Sjis::reverse(@list);
    $reverse = Sjis::reverse(@list);

    Sjis::reverse(@list) ‚ÍƒŠƒXƒgƒRƒ“ƒeƒLƒXƒg‚Å‚Í @list ‚Ì—v‘f‚ð‹t‡‚É•À‚×‚½
    ƒŠƒXƒg’l‚ð•Ô‚µ‚Ü‚·B
    ‚±‚ê‚ð—˜—p‚µ‚ÄA~‡‚Ì”—ñ‚ð”­¶‚³‚¹‚é‚±‚Æ‚à‚Å‚«‚Ü‚·B

    for (Sjis::reverse(1 .. 10)) { ... }

    @list ‚Æ‚µ‚ÄƒnƒbƒVƒ…‚ð“n‚µ‚½ê‡A‚»‚ÌƒnƒbƒVƒ…‚Íƒtƒ‰ƒbƒg‚ÈƒŠƒXƒg‚É•ÏŠ·‚³‚ê‚Ü
    ‚·B‚±‚Ì‚±‚Æ‚ð—˜—p‚·‚ê‚ÎAreverse ‚ðŽg‚Á‚ÄƒnƒbƒVƒ…‚ð‹tŒü‚«‚É‚·‚é(’l‚©‚çƒL[‚ð
    ‚Ð‚¯‚é‚æ‚¤‚É‚·‚é)‚±‚Æ‚ª‚Å‚«‚Ü‚·(‚½‚¾‚µA‚·‚×‚Ä‚Ì’l‚ªƒ†ƒj[ƒN‚Å‚ ‚é‚±‚Æ‚ª‘O’ñ
    ‚Å‚·)B

    %barfoo = Sjis::reverse(%foobar);

    ƒXƒJƒ‰[ƒRƒ“ƒeƒLƒXƒg‚Å‚Í @list ‚Ì‚·‚×‚Ä‚Ì—v‘f‚ð˜AŒ‹‚µ‚½ã‚ÅAShiftJIS ‚Ì
    •¶Žš’PˆÊ‚Å‹t‡‚É‚µ‚½‚à‚Ì‚ð•Ô‚µ‚Ü‚·B

    ‚±‚Ì“®ì‚Í JPerl ‚Æ”ñŒÝŠ·‚È‚Ì‚Å–¾Ž¦“I‚ÉƒCƒ“ƒ|[ƒg‚µ‚½ê‡‚Ì‚Ý‹@”\‚·‚é‚æ‚¤‚É
    ‚È‚Á‚Ä‚¢‚Ü‚·B

=item * Sjis::length

    $length = Sjis::length($string);
    $length = Sjis::length();

    Sjis::length($string) ‚ÍƒXƒJƒ‰[’l $string ‚Ì’·‚³‚ð ShiftJIS ‚Ì•¶Žš”‚Å•Ô
    ‚µ‚Ü‚·B$string ‚ðÈ—ª‚µ‚½ê‡‚Í $_ ‚Ì•¶Žš”‚ð•Ô‚µ‚Ü‚·B

    •¶Žš—ñ‚Ì’·‚³‚ðA•¶Žš’PˆÊ‚Å‚Í‚È‚­AƒoƒCƒg’PˆÊ‚Å”‚¦‚é‚É‚Í

    $blen = length $string;

    ‚ ‚é‚¢‚Í

    $blen = CORE::length $string;

    ‚Æ‚µ‚Ü‚·B

=item * Sjis::substr

    $substr = Sjis::substr($string,$offset,$length,$replacement);
    $substr = Sjis::substr($string,$offset,$length);
    $substr = Sjis::substr($string,$offset);

    Sjis::substr ‚ÍAShiftJIS •¶Žš—ñ $string ‚ÅŽw’è‚³‚ê‚½•¶Žš—ñ‚©‚ç•”•ª•¶Žš—ñ‚ðŽæ‚è
    o‚µ‚Ä•Ô‚µ‚Ü‚·B•”•ª•¶Žš—ñ‚ÍA•¶Žš—ñ‚Ìæ“ª‚©‚ç”‚¦‚Ä $offset •¶Žš–Ú‚©‚çŽn‚Ü‚éA
    $length •¶Žš•ª‚Å‚·B$offset ‚ª•‰‚È‚ç‚ÎA•¶Žš—ñ‚Ì––”ö‚©‚ç -$offset •¶Žš•ª–ß‚Á‚½
    ‚Æ‚±‚ë‚©‚ç•”•ª•¶Žš—ñ‚ªŠJŽn‚µ‚Ü‚·B$length ‚ðÈ—ª‚·‚é‚ÆA•¶Žš—ñ‚Ì––”ö‚Ü‚Å‚·‚×‚Ä‚ª
    •Ô‚³‚ê‚Ü‚·B$length ‚ª•‰‚È‚ç‚ÎA•¶Žš—ñ‚Ì––”ö‚©‚ç -$length •¶Žš‚ªŽc‚é‚æ‚¤‚ÉA’·‚³
    ‚ªŒˆ‚ß‚ç‚ê‚Ü‚·B‚»‚¤‚Å‚È‚¯‚ê‚ÎA$length ‚ÍA‚ ‚È‚½‚ªŠú‘Ò‚·‚é‚æ‚¤‚ÉAŽæ‚èo‚·•”•ª
    •¶Žš—ñ‚Ì’·‚³‚ð•\‚µ‚Ä‚¢‚Ü‚·B

    Sjis::substr ‚ð¶•Ó’l(‘ã“ü‚Ì‘ÎÛ‚Æ‚È‚é‚à‚Ì)‚Æ‚µ‚ÄŽg‚¤‚±‚Æ‚Í‚Å‚«‚Ü‚¹‚ñB‚»‚Ì‘ã‚í
    ‚è‚ÉA‘æ4ˆø” $replacement ‚É’u‚«Š·‚¦—p‚Ì•¶Žš—ñ‚ðŽw’è‚µ‚Ü‚·B‚±‚Ìê‡A
    Sjis::substr ‚Í $string ‚Ìˆê•”‚ð•¶Žš—ñ $replacement ‚Å’u‚«Š·‚¦‚é‚Æ‚Æ‚à‚ÉA
    (splice ‚Ì‚æ‚¤‚É)’u‚«Š·‚¦‚ç‚ê‚½•”•ª‚ð’l‚Æ‚µ‚Ä•Ô‚µ‚Ü‚·BŽŸ‚Ì—á‚ÍA$var ‚ÌÅŒã‚Ì
    •¶Žš‚ð "Curly" ‚Å’u‚«Š·‚¦‚é‚Æ‚Æ‚à‚ÉA’u‚«Š·‚¦‚ç‚ê‚½•¶Žš‚ð $oldstr ‚ÉƒZƒbƒg‚µ‚Ü
    ‚·:

    $oldstr = Sjis::substr($var, -1, 1, "Curly");

    $var ‚Ìæ“ª‚É•¶Žš—ñ "Larry" ‚ð•t‚¯‚é‚É‚ÍAŽŸ‚Ì‚æ‚¤‚É‚µ‚Ü‚·:

    Sjis::substr($var, 0, 0, "Larry");

    $var ‚ÌÅ‰‚Ì1•¶Žš‚ð "Moe" ‚Å’u‚«Š·‚¦‚é‚É‚ÍAŽŸ‚Ì‚æ‚¤‚É‚µ‚Ü‚·:

    Sjis::substr($var, 0, 1, "Moe");

    $var ‚ÌÅŒã‚Ì1•¶Žš‚ð "Curly" ‚Å’u‚«Š·‚¦‚é‚É‚ÍŽŸ‚Ì‚æ‚¤‚É‚µ‚Ü‚·:

    Sjis::substr($var, -1, 1, "Curly");

=item * Sjis::index

    $index = Sjis::index($string,$substring,$start);
    $index = Sjis::index($string,$substring);

    Sjis::index ‚ÍAShiftJIS •¶Žš—ñ $string ‚Ì’†‚ÉŠÜ‚Ü‚ê‚éA‚à‚¤1‚Â‚Ì ShiftJIS •¶
    Žš—ñ $substr ‚ð’T‚µ‚Ü‚·B$string ‚Ì’†‚ÅA$substr ‚ªÅ‰‚ÉoŒ»‚·‚éˆÊ’u‚ð•¶Žš’PˆÊ
    ‚Å”‚¦‚Ä•Ô‚µ‚Ü‚·B$start ‚ªŽw’è‚³‚ê‚Ä‚¢‚éê‡A$string ‚Ìæ“ª‚©‚ç $start ŒÂ‚Ì
    •¶Žš‚ðƒXƒLƒbƒv‚µ‚½ˆÊ’u‚©‚çA$substr ‚ð’T‚µŽn‚ß‚Ü‚·BˆÊ’u‚Í 0 ‚ðƒx[ƒX‚É‚Æ‚µ‚Ä
    ”‚¦‚Ü‚·B$substr ‚ªŒ©‚Â‚©‚ç‚È‚¯‚ê‚ÎASjis::index ŠÖ”‚Íƒx[ƒX‚æ‚è 1 ‚¾‚¯¬‚³‚¢
    ’l -1 ‚ð•Ô‚µ‚Ü‚·BSjis::index ‚ðŽg‚Á‚ÄA•¶Žš—ñ‘S‘Ì‚ð’²‚×‚é‚É‚ÍAŽŸ‚Ì‚æ‚¤‚É‚µ
    ‚Ü‚·B

    $pos = -1;
    while (($pos = Sjis::index($string, $lookfor, $pos)) > -1) {
        print "Found at $pos\n";
        $pos++;
    }

=item * Sjis::rindex

    $rindex = Sjis::rindex($string,$substring,$position);
    $rindex = Sjis::rindex($string,$substring);

    Sjis::rindex ‚Í Sjis::index ‚ÆŽ—‚Ä‚¢‚Ü‚·‚ªAShiftJIS •¶Žš—ñ $string ‚Ì’†‚ÅA
    •”•ª•¶Žš—ñ $substr ‚ªÅŒã‚ÉoŒ»‚·‚éˆÊ’u‚ð•¶Žš’PˆÊ‚Å”‚¦‚Ä•Ô‚µ‚Ü‚·(‚Â‚Ü‚è
    reverse Sjis::index ‚Å‚·)B$substr ‚ªŒ©‚Â‚©‚ç‚È‚¯‚ê‚ÎA-1 ‚ð•Ô‚µ‚Ü‚·B$position
    ‚É‚æ‚Á‚ÄA’l‚Æ‚µ‚Ä•Ô‚·‚±‚Æ‚ª‹–‚³‚ê‚éAÅ‚à‰E‚æ‚è‚ÌˆÊ’u‚ðŽw’è‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚·B
    Sjis::rindex ‚ðŽg‚Á‚ÄA•¶Žš—ñ‘S‘Ì‚ð––”ö‚©‚çæ“ª‚ÉŒü‚©‚Á‚Ä’²‚×‚é‚É‚ÍAŽŸ‚Ì‚æ‚¤
    ‚É‚µ‚Ü‚·B

    $pos = Sjis::length($string);
    while (($pos = Sjis::rindex($string, $lookfor, $pos)) >= 0) {
        print "Found at $pos\n";
        $pos--;
    }

=back

=head1 ŠÂ‹«•Ï”

 ‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í”r‘¼§Œä‚É flock ŠÖ”‚ðŽg—p‚µ‚Ü‚·Bƒtƒ@ƒCƒ‹‚ª“ÇŽæ‚è‰Â”\‚É‚È‚é‚Ü‚Å
 ‚ ‚é‚¢‚Í‘ž‚Ý‰Â”\‚É‚È‚é‚Ü‚ÅƒvƒƒOƒ‰ƒ€‚ÌŽÀs‚ÍƒuƒƒbƒN‚³‚ê‚Ü‚·B
 ‚±‚ê‚ðŠÂ‹«•Ï” SJIS_NONBLOCK ‚ð’è‹`‚·‚é‚±‚Æ‚ÅƒuƒƒbƒN‚³‚¹‚È‚¢‚æ‚¤‚É‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü
 ‚·B

 —á:

   SET SJIS_NONBLOCK=1

 (’l '1' ‚ÍˆÓ–¡‚ðŽ‚½‚È‚¢‚Ì‚Å‰½‚Å‚à\‚¢‚Ü‚¹‚ñ)

=head1 ƒoƒO‚Æ§ŒÀŽ–€

ƒoƒO•ñAƒpƒbƒ`‚ðŠ½Œ}‚µ‚Ü‚·B

=over 2

=item * format

    ƒIƒŠƒWƒiƒ‹‚Ì Perl ‚Æ‹@”\‚ª“¯‚¶‚Å‚·(ShiftJIS ‚É‘Î‰ž‚µ‚Ä‚¢‚Ü‚¹‚ñ)B

=item * chdir

    MSWin32 ŠÂ‹«‚Ì perl5.006, perl5.008, perl5.010 ‚É‚Ä•¶ŽšƒR[ƒh(0x5C)‚ÅI‚í
    ‚éƒpƒX‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚Ü‚¹‚ñB

    ŽQlƒŠƒ“ƒN
    Bug #81839
    chdir does not work with chr(0x5C) at end of path
    http://bugs.activestate.com/show_bug.cgi?id=81839

=item * m/$re/o, s/$re/foo/o, qr/$re/o ‚Ì /o CüŽq

    perl5.006 ‚É‚Ä /o CüŽq‚ªŠú‘Ò’Ê‚è‚Ì“®ì‚ð‚µ‚Ü‚¹‚ñ‚Å‚µ‚½B•Ï” $re ‚Ì’l‚ª
    •ÏX‚³‚ê‚é‚ÆŽŸ‰ñ‚ÌŽÀsŽž‚É‚»‚Ì•ÏX‚ª”½‰f‚³‚ê‚Ü‚·B

=item * ³‹K•\Œ»“à‚ÌƒGƒXƒP[ƒv•¶Žš \b ‚Æ \B

    ³‹K•\Œ»“à‚ÌƒGƒXƒP[ƒv•¶Žš \b ‚Æ \B ‚ÍŠú‘Ò’Ê‚è‚Ì‹@”\‚ð‚µ‚Ü‚¹‚ñB

=back

=head1 ìŽÒ

‚±‚ÌƒvƒƒWƒFƒNƒg‚Í ˆî—t € ina@cpan.org ‚É‚æ‚Á‚ÄŽn‚Ü‚è‚Ü‚µ‚½B
‚±‚Ìƒtƒ@ƒCƒ‹‚ð•ª‚©‚¿‡‚¢‚Ü‚µ‚å‚¤B

=head1 ’˜ìŒ 

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚ÍƒtƒŠ[ƒ\ƒtƒgƒEƒFƒA‚Å‚·B‚ ‚È‚½‚Í Perl ‚Æ“¯‚¶ƒ‰ƒCƒZƒ“ƒX
‚ÌŒ³‚ÅÄ”z•z‹y‚Ñ•ÏX‚ðs‚¤‚±‚Æ‚ªo—ˆ‚Ü‚·BÚ‚µ‚­‚Í perlartistic ‚ðŽQÆ‚µ‚Ä
‚­‚¾‚³‚¢B

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í—L—p‚Å‚ ‚é‚±‚Æ‚ðŠè‚Á‚Ä”Ð•z‚³‚ê‚Ü‚·‚ªA*‘S‚­‚Ì–³•ÛØ* 
‚Å‚·B¤‹Æ‰Â”\«‚Ì•ÛØ‚â“Á’è‚Ì–Ú“I‚Ö‚Ì“K‡«‚ÍAŒ¾ŠO‚ÉŽ¦‚³‚ê‚½‚à‚Ì‚àŠÜ
‚ß‘S‚­‘¶Ý‚µ‚Ü‚¹‚ñB

=head1 ƒVƒtƒgJISƒR[ƒh‚Æ‚Í(“ú–{Œêî•ñˆ—‚æ‚è)

ƒVƒtƒgJIS•„†‰»‚ÍAƒ}ƒCƒNƒƒ\ƒtƒgŽÐ‚É‚æ‚èŠJ”­‚³‚ê‚½A“ú–{‚ÌƒRƒ“ƒsƒ…[ƒ^‚ÅÅ‚à‚æ‚­
—p‚¢‚ç‚ê‚é•„†‰»•ûŽ®‚Å‚·BƒVƒtƒgJIS‚ÍuMSŠ¿Žš(MicrosoftŠ¿Žš)vA‚Ü‚½‚ÍuSJIS
(ShiftJIS‚Ì—ªÌ)v‚Æ‚àŒÄ‚Î‚ê‚Ä‚¢‚Ü‚·B

‚©‚Â‚Ä“ú–{‚ÌƒRƒ“ƒsƒ…[ƒ^ƒ†[ƒU‚Í”¼Šp•Ð‰¼–¼‚µ‚©Žg‚¦‚È‚©‚Á‚½‚½‚ßA]—ˆ•ûŽ®‚Æ‚ÌŒÝŠ·«
‚ðˆÛŽ‚·‚é–Ú“I‚ÅƒVƒtƒgJIS‚ªŠJ”­‚³‚ê‚Ü‚µ‚½B

ƒVƒtƒgJIS‚É‚¨‚¢‚Ä‚ÍA16i”‚Å 0x81`0x9F ‚Ü‚½‚Í 0xE0`0xEF ‚Ì”ÍˆÍ‚ðŽ‚ÂƒIƒNƒeƒbƒg
‚É‚æ‚Á‚Ä1•¶Žš2ƒIƒNƒeƒbƒgƒ‚[ƒh‚ªŠJŽn‚µ‚Ü‚·B‚»‚µ‚Ä‚±‚ÌƒIƒNƒeƒbƒg‚ÍA‚»‚±‚©‚çŽn‚Ü‚é
2ƒIƒNƒeƒbƒg•¶Žš‚Ì‘æ1ƒIƒNƒeƒbƒg‚Æ‚µ‚Äˆ—‚³‚ê‚Ü‚·B‘±‚­(‘æ2)ƒIƒNƒeƒbƒg‚ÍA16i”‚Å
0x40`0x7E ‚Ü‚½‚Í 0x80`0xFC ‚Ì”ÍˆÍ‚ðŽ‚Â’l‚Å‚È‚¯‚ê‚Î‚È‚è‚Ü‚¹‚ñB‘æ1ƒIƒNƒeƒbƒg‚Ì
”ÍˆÍ‚ÍŠg’£ASCII•¶ŽšƒZƒbƒgA‚Â‚Ü‚èÅãˆÊƒrƒbƒg‚ªƒIƒ“‚É‚È‚Á‚½8ƒrƒbƒg•¶ŽšƒZƒbƒg‚Ì”ÍˆÍ
‚ÉŠ®‘S‚ÉŽû‚Ü‚Á‚Ä‚¢‚é‚±‚Æ‚É’–Ú‚µ‚Ä‚­‚¾‚³‚¢B‚Ü‚½ƒVƒtƒgJIS‚ÍA”¼Šp•Ð‰¼–¼‚ÆASCII/JIS
ƒ[ƒ}Žš‚àƒTƒ|[ƒg‚µ‚Ä‚¢‚Ü‚·B

ˆê•”‚ÌƒVƒtƒgJISŽd—l(“Á‚Éƒ[ƒJŽd—l)‚Å‚ÍAƒ†[ƒU’è‹`•¶Žš‚ÌƒR[ƒh—Ìˆæ‚âAê‡‚É‚æ‚Á‚Ä
‚Í”¼Šp•Ð‰¼–¼‹ó”’•¶Žš‚ÌƒR[ƒhˆÊ’u‚à’è‹`‚³‚ê‚Ä‚¢‚Ü‚·B‚à‚µ–{Ši“I‚Èî•ñŒðŠ·‚ð–]‚Þ‚Ì‚Å
‚ ‚ê‚ÎA‚±‚Ì‚æ‚¤‚ÈƒR[ƒh—Ìˆæ‚âƒR[ƒhˆÊ’u‚Í•s“s‡‚Å‚·B‚Æ‚¢‚¤‚Ì‚àA‚±‚Ì‚æ‚¤‚È•¶Žš‚ÍA
•Ê‚Ì“ú–{Œê•„†‰»•ûŽ®(‚Â‚Ü‚èJIS‚ÆEUC)‚ÌƒR[ƒhˆÊ’u‚É•ÏŠ·‚Å‚«‚È‚¢‚æ‚¤‚É•„†‰»‚³‚ê‚Ä‚µ
‚Ü‚¤‚©‚ç‚Å‚·B

=head1 ƒEƒBƒLƒyƒfƒBƒA‚É‚æ‚éuShift_JISv‚Ì’è‹`

Shift_JIS (2009.09.17 14:00:00 JST). In Wikipedia: The Free Encyclopedia.
Retrieved from
http://ja.wikipedia.org/wiki/Shift_JIS

o“T: ƒtƒŠ[•S‰ÈŽ–“TwƒEƒBƒLƒyƒfƒBƒA(Wikipedia)x

Shift_JIS(IANA‚Ö‚Ì“o˜^–¼B“Ç‚Ý•û‚ÍwƒVƒtƒgƒWƒXx)‚ÍAŒ»Ý‘½‚­‚Ìƒpƒ\ƒRƒ“ã‚Å
“ú–{Œê‚ð•\‚·‚½‚ß‚ÉŽg‚í‚ê‚Ä‚¢‚é•¶ŽšƒR[ƒh‚Å‚ ‚éB“ÆŽ©‚ÌƒR[ƒh‚ðŽg‚Á‚Ä‚¢‚½‰ïŽÐ
‚ª‚ ‚Á‚½‚ªAŒ»Ý‚Í•W€‰»‚µ‚Ä‚¢‚éJIS X 0208‚Ì•‘®‘1‚Å‹K’è‚µ‚Ä‚¢‚éB

Microsoft“™‚ÌŠeƒxƒ“ƒ_‚ªŽÀ‘•‚·‚éShift_JIS‚ÌˆŸŽí‚É‚Â‚¢‚Ä‚ÍwMicrosoftƒR[ƒhƒy[
ƒW932x‚ðŽQÆBMac OS‚ªŽÀ‘•‚·‚éˆŸŽí‚É‚Â‚¢‚Ä‚ÍwMacJapanesex‚ðŽQÆB

Shift_JIS‚Ì’a¶
1980”N‘ãAƒpƒ\ƒRƒ“—p16ƒrƒbƒgCPU‚Ì•‹y‚à‚ ‚¢‚Ü‚Á‚ÄAŠ¿Žš‚ð•\Ž¦‰Â”\‚Èƒn[ƒhƒEƒF
ƒA‚ð”õ‚¦‚½ƒpƒ\ƒRƒ“‚ª‘±X‚Æ”­”„‚³‚ê‚½B‚»‚Ì‚½‚ßA‚±‚ê‚çƒpƒ\ƒRƒ“—p‚Ì•¶Žš•„†‰»
•ûŽ®‚ð–Íõ‚µ‚Ä‚¢‚½B

Shift_JIS‚ðuƒVƒtƒgJISƒR[ƒhv‚ÆŒÄ‚ñ‚Å•„†‰»•¶ŽšW‡(•¶ŽšƒR[ƒh)‚Ì–Ê‚Ì‚Ý‚ð
l‚¦‚é‹c˜_‚ª‚ ‚é‚ªA‚±‚±‚Å‚Í•¶Žš•„†‰»•ûŽ®‚Ì–Ê‚ÉÅ“_‚ð“–‚Ä‚éB

‚±‚Ì•¶Žš•„†‰»•ûŽ®‚É‚ÍAæs‚µ‚Ä‚æ‚­—˜—p‚µ‚Ä‚¢‚½JIS C 6220(Œ»Ý‚ÌJIS X 0201)
‚Ì8ƒrƒbƒg•„†(ˆÈ‰ºu‰p”ŽšE”¼ŠpƒJƒiv)‚ÆAJIS C 6226(Œ»Ý‚ÌJIS X 0208A
ˆÈ‰ºuŠ¿Žšv)‚Ì—¼•¶ŽšW‡‚ðA•\Œ»‚µ‚æ‚¤‚Æ‚µ‚½Bƒtƒ@ƒCƒ‹‚Ì‘å‚«‚³Aˆ—ŽžŠÔ‚Ì
’Zk‚ð}‚é‚½‚ßƒGƒXƒP[ƒvƒV[ƒPƒ“ƒX‚È‚µ‚Å¬Ý‰Â”\‚É‚·‚é‚±‚Æ‚ðlˆÄ‚µ‚½B

JIS C 6220‚ÆJIS C 6226‚Ì2‚Â‚Í‚Æ‚à‚ÉAISO 2022‚Å•¶ŽšW‡‚ðØ‚è‘Ö‚¦‚Ä—˜—p‚·‚é
ÝŒv‚ª‚ ‚Á‚½BISO 2022‚É‚à‚Æ‚Ã‚­•¶Žš•„†‰»•ûŽ®‚Å‚ÍA‰p”ŽšA”¼ŠpƒJƒiAŠ¿Žš‚Í
‚»‚ê‚¼‚êA8ƒrƒbƒg•„†‹óŠÔ‚Ì’†‚ÌGL/GR‚Æ‚¢‚¤—Ìˆæ‚Ì1‚Â‚ð(‚½‚¾‚µŠ¿Žš‚Í2‰ñ)Žg‚¤
‚±‚Æ‚Å•\Œ»‚Å‚«‚éB‚à‚µ‰p”Žš‚ÆŠ¿Žš‚Ì2‚Â‚ðƒGƒXƒP[ƒvƒV[ƒPƒ“ƒX‚È‚µ‚Å¬Ý‚µ‚½‚¢
‚È‚çA‰p”Žš‚ðGLAŠ¿Žš‚ðGR‚ÉŠ„‚è“–‚Ä‚é•û–@‚ª‚ ‚éBEUC-JP‚ÍA‚¨‚¨‚æ‚»‚»‚Ì‚æ‚¤
‚ÉŽÀ‘•‚µ‚Ä‚¢‚éB

‚µ‚©‚µAƒpƒ\ƒRƒ“‚Å‚Í‚·‚Å‚ÉAJIS X 0201‚Ì8ƒrƒbƒg•„†A‚Â‚Ü‚èAGL‚É‰p”ŽšAGR‚É
‚PƒoƒCƒgƒJƒ^ƒJƒi(”¼ŠpƒJƒ^ƒJƒi)‚ðŠ„‚è“–‚Ä‚é‚±‚Æ‚ª•‹y‚µ‚Ä‚¢‚½B‰p”Žš‚Æ‚PƒoƒC
ƒgƒJƒ^ƒJƒi‚Ì2‚Â‚ð“®‚©‚·‚±‚Æ‚ÍA•¶Žš‰»‚¯‚ÌŒ´ˆö‚É‚È‚é‚½‚ß”ð‚¯‚é•K—v‚ª‚ ‚Á‚½B
‚»‚Ì‚½‚ßAISO 2022‚Ì˜g“à‚Ì—Ìˆæ‚ÉŠ¿Žš‚ð¬Ý‚³‚¹‚é‚±‚Æ‚Í¢“ï‚¾‚Á‚½‚Ì‚Å‚ ‚éB

1982”NAŠ¿Žš‚Ì•„†ˆÊ’u‚ð•¡ŽG‚ÉˆÚ“®(ƒVƒtƒg)‚µA•„†‹óŠÔ‚ÌŒ„ŠÔ‚É‰Ÿ‚µž‚Þ
ShiftJIS‚ª’a¶‚µ‚½B‚±‚ê‚ðŽÀŒ»‚·‚é‚½‚ß‚É‚ÍAŠ¿Žš‚Ì1ƒoƒCƒg–Ú‚Æ‚µ‚ÄAISO 2022
‚É‚¨‚¯‚éGR(A1(16)-FE(16))—Ìˆæ‚É3•ª‚Ì1Žc‚µ‚Ä‚¢‚½–¢Žg—p—Ìˆæ‚É‚­‚í‚¦AISO 2022
‚É‚¨‚¢‚Ä”ñŽg—p‚ÌCR(80(16)-9F(16))—Ìˆæ‚ðŽg—p‚·‚é‚±‚Æ‚Æ‚µ‚½B‚½‚¾‚µAGL
(21(16)-7E(16))—Ìˆæ‚É‚¨‚¢‚Ä‚ÍAJIS X 0201‚Ì‹L†‚É“–‚½‚é•”•ª‚Í‹É—Í”ð‚¯‚½B
‚³‚ç‚É2ƒoƒCƒg–Ú‚É‚ÍISO 2022‚Æ‚ÍˆÙ‚È‚èA‰p”ŽšE”¼ŠpƒJƒi‚ÉŽg—pÏ‚Ý‚Ì—Ìˆæ‚ð‚à
ŠÜ‚ÞAGLACRAGR‚É‚ ‚½‚éŠe—Ìˆæ‚Ì‚Ù‚Ú‘S‚Ä‚ðŽg‚¤•K—v‚ª‚ ‚Á‚½B

ƒ}ƒCƒNƒƒ\ƒtƒg(“ú–{–@l)Œ³‰ï’·‚ÌŒÃì‹‚É‚æ‚é‚ÆAShift_JIS‚Ì§’è‚É‚ÍAƒAƒX
ƒL[Aƒ}ƒCƒNƒƒ\ƒtƒg(•Ä)AŽO•H“d‹@Aƒ}ƒCƒNƒƒ\ƒtƒgƒEƒFƒAEƒAƒ\ƒVƒGƒCƒcA
ƒfƒWƒ^ƒ‹ƒŠƒT[ƒ`(•Ä)‚ªŠÖ‚í‚èA“Á‚ÉƒAƒXƒL[‚ÌŽR‰º—Ç‘ ‚ª’†S‚Æ‚È‚Á‚Äì¬‚µ‚½
‚à‚Ì‚¾‚Æ‚¢‚¤B‚±‚ê‚É‘Î‚·‚éˆÙà‚Æ‚µ‚ÄA‹ž“s‘åŠw•‹³Žö‚ÌˆÀ‰ªFˆê‚ÍAƒ}ƒCƒNƒƒ\ƒt
ƒgƒEƒFƒAEƒAƒ\ƒVƒGƒCƒc‚ÆŽO•H“d‹@‚Ì‚Ý‚Ì‹¤“¯ŠJ”­‚¾‚ÆŽå’£‚µ‚Ä‚¢‚éBŽR‰º–{l‚Ì”­Œ¾
‚É‚æ‚èˆÀ‰ª‚ÍŽ©à‚Ì“P‰ñ‚Æ‚àŽæ‚ê‚é”­Œ¾‚ð‚µ‚Ä‚¢‚éB

Shift_JIS‚Ì•W€‰»
Shift_JIS‚ÍA•„†‰»•¶ŽšW‡‚Æ‚»‚Ì•¶Žš•„†‰»•ûŽ®‚Ì—¼•û‚ðŠÜ‚ÞŒ»ŽÀ‚Ì–â‘è‚ð‰ðŒˆ
‚·‚é‚½‚ß‚Ì‹Zp‚Å‚ ‚éB‚»‚ê‚ä‚¦AJIS X 0208‚Ì•¶ŽšW‡‚ð—˜—p‚µ‚Ä‚Í‚¢‚é‚à‚Ì‚ÌA
ISO 2022‚Ì•„†‰»‚Ì•ûj‚Ì”ÍˆÍ‚ÌŠO‚É‚ ‚éB

‚µ‚©‚µ‚È‚ª‚çAŒ»Ý‚Å‚ÍAJIS X 0208:1997‚Ì•‘®‘1‚É‚ÄuƒVƒtƒg•„†‰»•\Œ»v‚Æ‚¢‚¤
–¼‘O‚ÅAŽd—l‚ª’è‹`‚³‚ê‚Ä‚¢‚éB‚±‚ê‚ÍAƒfƒtƒ@ƒNƒgƒXƒ^ƒ“ƒ_[ƒh‚Æ‚È‚Á‚Ä‚¢‚é‹Zp
‚É‚Â‚¢‚Ä‚ÍoŽ©‚ð–â‘è‚Æ‚¹‚¸A‚Æ‚à‚©‚­•W€‰»‚µ‚Ä‚µ‚Ü‚¨‚¤‚Æ‚¢‚¤ˆÓ}‚ª“ú–{H‹Æ•W€
’²¸‰ï (JISC) ‚É‚ ‚Á‚Ä‚Ì‚±‚Æ‚Å‚ ‚éB

JIS X 0208‚ÌŠg’£‹KŠi‚Å‚ ‚éJIS X 0213‚Å‚ÍA2000”N§’è‚Ì‰”Å‚Å•‘®‘1‚Æ‚µ‚Ä
Shift_JISX0213‚ª’è‚ß‚ç‚ê‚½B2004”N‰ü³Žž‚Ì10•¶Žš’Ç‰Á‚É”º‚Á‚ÄAShift_JIS-2004
‚Æ–¼Ì‚ª•ÏX‚³‚ê‚½B

IANA‚àuShift_JISv‚Æ‚¢‚¤–¼‘O‚Å“o˜^‚µ‚Ä‚¢‚éB

—˜“_‚ÆŒ‡“_

—˜“_
1. ‘SŠp•¶Žš‚ÆAJIS X 0201‚Å’è‹`‚µ‚½‚¢‚í‚ä‚é”¼ŠpƒJƒi•¶Žš‚ð“¯ˆê‚ÌƒR[ƒh‘ÌŒn‚Å
   •\Œ»‚Å‚«‚éB
2. “ú–{ŒêŠÂ‹«‚É‚¨‚¢‚Ä‚ÍAMS-DOS‚Å“ú–{Œê—p•¶ŽšƒR[ƒh‚Æ‚µ‚ÄÌ—p‚³‚ê‚ÄˆÈ—ˆAƒpƒ\
   ƒRƒ“‚É‚¨‚¢‚Äˆ³“|“I‚È•‹y“x‚ª‚ ‚èA‚»‚Ì‘¼‚Ì•¶Žš•„†‰»•ûŽ®‚É”ä‚×‚Äƒf[ƒ^ŒðŠ·
   ‰Â”\«‚ª‚‚¢ (‚½‚¾‚µA•¶ŽšW‡‚É‚Â‚¢‚Ä‚ÍŽÀ‘•ƒxƒ“ƒ_‚ªJIS X 0208‚Å‹K’è‚³‚ê‚Ä
   ‚¢‚È‚¢‹@ŽíˆË‘¶‚ÌŠg’£‚ðŽ{‚µ‚Ä‚¢‚é‚±‚Æ‚ª‘½‚­A‚±‚¤‚¢‚Á‚½Šg’£•”•ª‚ÉŠÖ‚µ‚Ä‚Í
   ƒf[ƒ^ŒðŠ·‰Â”\«‚ª’á‚¢)B

Œ‡“_
1. ”¼ŠpƒJƒi‚Ì‚½‚ß‚Ì—Ìˆæ‚ðŠm•Û‚µ‚½ŠÖŒWãAƒR[ƒhƒV[ƒNƒGƒ“ƒX‚ª‹æ“_”Ô†‚Ìu‹æv
   ‚Ì‹æØ‚è‚Å‚Í‚È‚¢‰ÓŠ‚Å•ª’f‚µ‚Ä‚¢‚éB‚±‚Ì‚½‚ßAƒR[ƒh”Ô†‚ð‰‰ŽZ‚Å‹‚ß‚éÛ‚Í
   ”ÏŽG‚Èˆ—‚ª•K—v‚Å‚ ‚éB
2. 2ƒoƒCƒg–Ú‚É80(16)–¢–ž(ASCII‚ÌƒR[ƒh—Ìˆæ)‚ªŒ»‚ê‚éB‚±‚Ì‚½‚ßA•¶Žš‚Ì‹æØ‚è‚Ì
   ”»’è‚ÉŽèŠÔ‚ª‚©‚©‚éBƒtƒ@ƒCƒ‹A“d•¶‚Ìæ“ª‚©‚ç•¶ŽšƒR[ƒh”»’è‚·‚éê‡‚Í‚æ‚¢‚ªA
   Œã‚ë‚©‚ç•¶ŽšƒR[ƒh‚Ì”»’è‚ð‚µ‚æ‚¤‚ÆŽv‚¤‚ÆAÅˆ«‚Ìê‡Aæ“ª‚Ü‚Å‚½‚Ç‚ç‚È‚¢‚Æ
   ‚¢‚¯‚È‚¢‚±‚Æ‚ª‚ ‚é‚½‚ßAƒvƒƒOƒ‰ƒ€‚Ìì‚è•û‚ÉH•v‚ª•K—v‚É‚È‚éB‚Ü‚½A‚±‚Ì—Ì
   ˆæ‚ÉŠÜ‚Ü‚ê‚éˆê•”‚Ì•¶Žš‚Ìˆµ‚¢‚Ì‚½‚ßAƒ}ƒ‹ƒ`ƒoƒCƒg‚ÌEUC-JPAUTF-8‚È‚Ç‚æ‚èAƒv
   ƒƒOƒ‰ƒ~ƒ“ƒOã‚Ìˆµ‚¢‚ª“ï‚µ‚¢B¨ŽŸ€
3. JIS•â•Š¿Žš‚ª•\Œ»‚Å‚«‚È‚¢B•â•Š¿Žš‚Ì•¶Žš”‚ÍShift_JIS‚ÌƒR[ƒh–¢“o˜^•”•ª‚É
   Žû‚Ü‚ç‚È‚¢B

2ƒoƒCƒg–Ú‚ª5C“™‚É‚È‚è‚¤‚é‚±‚Æ‚É‚æ‚é–â‘è

Shift_JIS‚Å‚ÍAuƒ\vu‰\v‚È‚Çˆê•”‚ÌŽš‚Ì2ƒoƒCƒg–Ú‚ÉA5C(16)(Shift_JIS‚Å‚Í
‹L†AASCII‚È‚Ç‚Å‚ÍƒoƒbƒNƒXƒ‰ƒbƒVƒ…)‚ðŽg—p‚µ‚Ä‚¢‚éB‘½‚­‚ÌƒvƒƒOƒ‰ƒ~ƒ“ƒO
Œ¾Œê (CAPerlABourne Shell‚È‚Ç‘½”) ‚Å‚ÍA‚±‚Ì5C(16)‚ðƒGƒXƒP[ƒv•¶Žš‚Æ‚µ‚Ä
‚¢‚éB‚µ‚½‚ª‚Á‚ÄAƒ\[ƒXƒR[ƒh‚â•¶Žšƒf[ƒ^‚Ìˆ—‚É‚¨‚¢‚ÄShift_JIS‚ð‘z’è‚µ‚Ä
‚¢‚È‚¢ƒvƒƒOƒ‰ƒ~ƒ“ƒOŠÂ‹«‚Å‚Í–â‘è‚ª‹N‚±‚éB‚±‚Ì–â‘è‚ÍA“¯‚¶‚æ‚¤‚É2ƒoƒCƒg–Ú‚Ì
”ÍˆÍ‚É5C(16)‚ðŠÜ‚ÞBig5‚âA‚Ü‚ê‚Å‚Í‚ ‚é‚ªGBK‚È‚Ç‚Ì•¶ŽšƒR[ƒh‚Å‚à”­¶‚µ‚¤‚éB

‚Ü‚½A5C(16)ˆÈŠO‚É‚Â‚¢‚Ä‚à—ÞŽ—‚Ì–â‘è‚ª”­¶‚·‚é‚±‚Æ‚ª‚ ‚éB‚½‚Æ‚¦‚ÎAUnix‚â
MS-DOS‚È‚Ç‚ÌƒVƒFƒ‹ã‚Å7C(16) (Shift_JIS‚âASCII‚Å‚Íƒo[ƒeƒBƒJƒ‹ƒo[) ‚ðŠÜ‚Þ
•¶Žš(|Aƒ|A„|A‰|AŠ|A‹|AŒ|Acc)‚ðƒtƒ@ƒCƒ‹–¼‚ÉŽg—p‚µ‚æ‚¤‚Æ‚·‚é‚ÆA
ƒpƒCƒv‹L†‚Æ”FŽ¯‚³‚êA³í‚Éƒtƒ@ƒCƒ‹‚ªì¬‚³‚ê‚È‚©‚Á‚½‚èA“Ç‚Ýž‚Ý‚ª•s—Ç‚É
‚È‚Á‚½‚è‚·‚é‚±‚Æ‚ª‚ ‚éB

Œ»Ý‚Å‚àAƒVƒ“ƒOƒ‹ƒoƒCƒg•¶ŽšƒR[ƒh‘Î‰ž‚Ìƒ\ƒtƒgƒEƒFƒA‚ðShift_JISŠÂ‹«‚ÅŽg—p‚·‚é
‚ÆA‰üs‚È‚Ç‚Ì“®ì‚âƒtƒ@ƒCƒ‹–¼‚Ìˆ—‚È‚Ç‚É‚µ‚Î‚µ‚Î‚±‚Ì–â‘è‚ª‚Â‚«‚Ü‚Æ‚¤B‚±‚Ì
•s‹ï‡‚ðµ‚­A2ƒoƒCƒg–Ú‚É5C(16)‚ðŽ‚Â•¶Žš‚Ì‚±‚Æ‚ðA‚¾‚ß•¶Žš‚ÆŒÄ‚ÑA‚±‚Ì’†‚É‚Í
uƒ\vu\vu”\vu•\v‚È‚Çˆê”Ê‚ÉŽg—p•p“x‚Ì‚‚¢•¶Žš‚à‚ ‚é[1]B

‚±‚Ì–â‘è‚ð‰ñ”ð‚·‚é“`““I‚È•û–@‚Æ‚µ‚ÄAƒ\[ƒXƒR[ƒh‘S‘Ì‚ðEUCƒR[ƒh‚âUTF-8‚È‚Ç
‚É•ÏŠ·‚µ‚Ä‚©‚çƒRƒ“ƒpƒCƒ‹‚µ‚½‚èŽÀs‚µ‚½‚è‚·‚é•û–@‚ª‚ ‚éB‚ ‚é‚¢‚Íuƒ\\v‚Ì
‚æ‚¤‚É2ƒoƒCƒg–Ú‚Ì’¼‘O‚ÉƒGƒXƒP[ƒv•¶Žš‚Ì5C(16)‚ð‹Lq‚µA‚¾‚ß•¶Žš‚ð•¶Žš‚Æ‚µ‚Ä
³‚µ‚­”FŽ¯‚³‚¹‚é‚È‚Ç‚Ì•û–@‚à‚ ‚é(Perl ‚ÌSjisƒ\ƒtƒgƒEƒFƒA‚È‚Ç)BÅ‹ß‚Å‚ÍA‘½‚­
‚ÌƒvƒƒOƒ‰ƒ~ƒ“ƒOŒ¾Œê‚ªShift_JIS‚É‘Î‰ž‚·‚é‚æ‚¤‚É‚È‚Á‚½‚½‚ßAShift_JIS‚ðŠÜ‚Þ
ƒ\[ƒXƒR[ƒh‚âƒf[ƒ^‚ðˆµ‚Á‚Ä‚à‚±‚Ì–â‘è‚Í‹N‚«‚È‚­‚È‚Á‚½‚ªA‹Œ—ˆ‚Ìƒ\ƒtƒgƒEƒFƒA
Ž‘ŽY‚ð—˜—p‚·‚éã‚Å‚ÍˆË‘RA–â‘è‚ª‚Â‚«‚Ü‚Æ‚¤B

—á

•p”É‚ÉŒ©‚é—á‚Æ‚µ‚ÄAu\‚í‚È‚¢v‚Æ‚¢‚¤•¶Žš—ñ‚ª‚¢‚­‚Â‚©‚ÌŒfŽ¦”Âƒ\ƒtƒg‚Å
u‚ï¢¯È‚¢v‚Æ‰»‚¯‚éB

   \   ‚í   ‚È   ‚¢
  8d5c 82ed 82c8 82a2
  ƒoƒbƒNƒXƒ‰ƒbƒVƒ…‚É‚ ‚½‚é5c‚ª”²‚¯‚é‚ÆA
  8d   82ed 82c8 82a2
    ‚    ï¢¯  È   ‚¢

u‚¢v‚Æ‚¢‚¤•¶Žš‚Ì‚Æ‚±‚ë‚ÅƒfƒR[ƒh‚ªÄ“¯Šú‚³‚êŒã‚Ì•¶Žš—ñ‚Í³í‚É–ß‚éB‚Ü‚½“¯—l
‚ÉuŒ|”\ŠEv‚ªuŒ|”ŠEv‚É‰»‚¯‚é—á‚à‚ ‚éB 

   Œ|    ”\   ŠE
  8c7c 945c 8a45
  ƒoƒbƒNƒXƒ‰ƒbƒVƒ…‚É‚ ‚½‚é5c‚ª”²‚¯‚é‚ÆA
  8c7c 94   8a45
   Œ|    ”Š   E

  •\ 2ƒoƒCƒg–Ú‚É5C(16)‚ðŽ‚Â•¶Žšˆê—— •¶Žš •„†(16i) “Ç‚ÝEˆÓ–¡ 

  \   815C ƒ_ƒbƒVƒ…
  ƒ\   835C •Ð‰¼–¼‚Ìu‚»v
  „\   845C ƒLƒŠƒ‹•¶Žš‚ÌƒEƒB
  ‡\/? 875C WindowsŠÂ‹«‚Å‚Íƒ[ƒ}”Žš‚Ì9
            MacŠÂ‹«‚Å‚ÍGB(ƒMƒKƒoƒCƒg)
  ‰\   895C ‚¤‚í‚³B
  Š\   8A5C ŠC—¢
  ‹\   8B5C ‚ ‚´‚Þ‚­B¼‹\
  Œ\   8C5C ‚¯‚¢Bl–¼B
  \   8D5C ‚©‚Ü‚¦‚éB\‘¢
  Ž\   8E5C ƒJƒCƒRB—{Ž\
  \   8F5C Š¿”Žš‚Ì10B
  \   905C ‚à‚¤‚·A‚µ‚ñB\¿
  ‘\   915C ‚»A‚ÐBu‘]v‚Ìˆóü•W€Žš‘ÌB‘\‘·
  ’\   925C ‚½‚ñB’\y
  “\   935C ‚Í‚éB“\•t
  ”\   945C ‚Ì‚¤B”\—Í
  •\   955C ‚ ‚ç‚í‚·A‚Ð‚å‚¤B•\Œ»
  –\   965C ‚ ‚Î‚ê‚éA‚Ú‚¤B–\—Í
  —\   975C ‚ ‚ç‚©‚¶‚ßA‚æB—\”õ
  ˜\   985C ‚ë‚­B•î˜\
  ™\   995C ‚ÆA‚¤‚³‚¬Bu“ev‚ÌˆÙ‘ÌŽš
  š\   9A5C ‚©‚­Bš\ŒŒ
  ›\   9B5C ‚±‚¤B›\˜a(u˜a‚Ì”ñ‘Š·‚¦)
  œ\   9C5C ‚âB–í¶‚Ìu–ív‚Ì‹ŒŽš‘Ì
  \   9D5C ‚¾B\•ß
  ž\   9E5C “È‚Ì•Ê‘Ì
  Ÿ\   9F5C ‚·‚·‚éA‚»‚¤A‚µ‚å‚¤B
  à\   E05C ‚³‚ç‚¤A‚µ‚ã‚ñB
  á\   E15C ‚Ó‚²A‚Ù‚ñB
  â\   E25C ‚Æ‚éA‚Ö‚¢B
  ã\   E35C ‚ ‚âA‚³‚¢B
  ä\   E45C ‚Å‚ñA‚µ‚èBä\•”
  å\   E55C ‚ ‚¢B˜a‹Cå\X
  æ\   E65C G‚Ì‹ŒŽš‘Ì
  ç\   E75C ‘Ì‚ÌŒÃŽš
  è\   E85C ‚Â‚ÎB“‚Ìè\(’Õ)B
  é\   E95C ‚Ü‚ñBé\“ª
  ê\   EA5C ƒoƒ“B’¹‚Ì–¼B
  úx   ED5C ‚µ‚ã‚ñB
  ûx   EE5C ‚¬‚å‚­B
  ú\   FA5C ‚í‚½A‚±‚¤B
  û\   FB5C ‚¬‚ñB

ƒR[ƒh‹óŠÔ‚É‚¨‚¯‚é•¶Žš”§ŒÀ
Shift_JIS‚Ì2ƒoƒCƒgƒR[ƒh‚Ì‹óŠÔ‚ÍA‘æ1ƒoƒCƒg‚ª81(16)-9F(16)‚È‚ç‚Ñ‚ÉE0(16)-FC(16)A
‘æ2ƒoƒCƒg‚ª40(16)-7E(16)‚È‚ç‚Ñ‚É80(16)-FC(16)‚Å‚ ‚éB‚µ‚½‚ª‚Á‚ÄA60~188=11280
•¶ŽšA‚³‚ç‚É1ƒoƒCƒgƒR[ƒh‚ª158•¶Žš (ƒXƒy[ƒX‚ðŠÜ‚ÝADEL‚Í”‚¦‚¸)‚Å‚ ‚é‚½‚ßA
Œv11438•¶Žš‚Æ‚È‚éB

‚È‚¨AShift_JIS-2004‚Å‚ÍA2ƒoƒCƒg•¶Žš‚ª11233•¶ŽšA1ƒoƒCƒg•¶Žš‚ª158•¶Žš‚Ì‚½‚ßA
‡Œv11391•¶Žš‚ðŽg—p‚µ‚Ä‚¢‚éB

Shift_JIS‚É‚¨‚¯‚éuƒVƒtƒgv‚Æ‚Í
ISO-2022-JP‚ÍŽwŽ¦ƒV[ƒPƒ“ƒX‚ÅŠ¿Žš‚ÆƒAƒ‹ƒtƒ@ƒxƒbƒg‚ðØ‚è‘Ö‚¦‚é•„†‰»•ûŽ®‚Å‚ ‚éB
‚Ü‚½AEUC-JP‚Í•â•Š¿Žš‚Æ”¼ŠpƒJƒ^ƒJƒi‚ðƒVƒ“ƒOƒ‹ƒVƒtƒg‚ÅˆêŽž“I‚ÉØ‚è‘Ö‚¦‚ÄŽg‚¤
•„†‰»•ûŽ®‚Å‚ ‚éB‚±‚ê‚ç‚Ì•„†‰»•ûŽ®‚Å‚ÍAŠe•¶ŽšW‡‚Ì–Ê‚ðƒVƒtƒgƒR[ƒh‚É‚æ‚Á‚Ä
Ø‚è‘Ö‚¦(ƒVƒtƒg‚µ)‚Ä‚¢‚éB

‚µ‚©‚µ‚È‚ª‚çAShift_JIS‚ÌwƒVƒtƒgx‚Æ‚Í‚±‚ÌˆÓ–¡‚Å‚ÌƒVƒtƒg‚Å‚Í‚È‚¢B‚Ü‚½Aƒrƒbƒg
ƒVƒtƒg‚ÌwƒVƒtƒgx‚Å‚à‚È‚¢B‚±‚ÌwƒVƒtƒgx‚Æ‚ÍA256~256‚Ì•½–Ê‚Ì’†‚Å•¶Žš‚ð
•¡ŽG‚É"‚¸‚ç‚·"‚Æ‚¢‚¤ˆÓ–¡‚ÌwƒVƒtƒgx‚Å‚ ‚éB

Shift_JIS‚Æ‹æ“_”Ô†
Shift_JIS‚ª•„†‰»‚Ì‘ÎÛ‚É‚·‚é•¶ŽšƒZƒbƒg‚ÍAJIS X 0208‚Å‚ ‚éB‚±‚Ì•„†‰»•¶Žš
W‡‚É‚ÍA‹æ“_”Ô†‚Æ‚¢‚¤ŠT”O‚ª‘¶Ý‚·‚éB‚±‚ê‚ÍA94~94‚Ì•¶Žš•\‚Ìs‚Æ—ñ‚Ì”Ô†
‚Ì‘g‚Å‚ ‚éB

Shift_JIS‚Å‚ÍA8140(16)-FCFC(16)‚Æ‚¢‚¤‚æ‚¤‚ÉAJIS X 0208‚Æ‚Í‚Ü‚Á‚½‚­ˆá‚Á‚½
ƒR[ƒh‘ÌŒn‚Å‚ ‚é‚ªAJIS X 0208‚ðŒvŽZ‚É‚æ‚è•ÏŒ`‚µ‚½‚à‚Ì‚Å‚ ‚é‚½‚ßA‹æ“_”Ô†‚ð
—p‚¢‚Ä•¶Žš‚ÌƒR[ƒhƒ|ƒCƒ“ƒg‚ðŽw‚µŽ¦‚·‚±‚Æ‚ª‘½‚¢B“à—e‚É‚Â‚¢‚Ä‚ÍAJIS X 0208‚Ì
1`94‹æ‚Æ“¯‚¶‚Å‚ ‚éB‚½‚¾‚µA‹@ŽíˆË‘¶•¶Žš‚Å‚ÍAƒVƒtƒgJIS‚Ì•„†‹óŠÔ‚©‚ç‹t¬‚µA
94‹æ‚Ì‰º•û‚É‚ ‚½‚©‚à120‹æ‚Ü‚Å‚ªŠg’£‚µ‚Ä‚¢‚é‚©‚Ì‚æ‚¤‚Éˆµ‚¤‚±‚Æ‚ª‚ ‚éB95‹æˆÈã
‚ÍAISO/IEC 2022‚É‘¥‚Á‚½JIS X 0208‚Ì\‘¢‚Å‚Í‘¶Ý‚µ“¾‚È‚¢‚Ì‚ÅA–{—ˆ‚Í‚¨‚©‚µ‚¢B
ƒxƒ“ƒ_“ÆŽ©‚Ì”ñŒöŽ®‚ÈŠT”O‚Å‚ ‚éB‚È‚¨AJIS X 0213‚Ì‹KŠi‚Ìˆê•”‚Å‚ ‚é
Shift_JISX0213•„†‰»•\Œ»‚É‚¨‚¢‚Ä‚ÍA‘æ1ƒoƒCƒgF0(16)ˆÈ~‚ð2–Ê‚Ì•¶Žš‚ÉŠ„‚è“–‚Ä
‚Ä‚¨‚èA•S‰½‹æ‚Æ‚¢‚¤‚æ‚¤‚È‘¶Ý‚µ‚È‚¢‹æ”Ô†‚Í“oê‚µ‚È‚¢B

ux-sjisv‚ÆuMS_Kanjiv
ux-sjisv‚ÆuMS_Kanjiv‚Í‚Æ‚à‚ÉAHTMLƒhƒLƒ…ƒƒ“ƒg‚Ìucharsetv‚ÌŽw’è‚É
uShift_JISv‚Ì•Ê–¼‚Æ‚µ‚ÄŽg‚¤‚±‚Æ‚ªo—ˆ‚éB

ux-sjisv‚ÍIANA‚ÉuShift_JISv‚Æ‚¢‚¤–¼‘O‚ð“o˜^‚·‚é‘O‚ÉANetscape Navigator 2.0
‚É‚¨‚¢‚ÄŽg‚Á‚Ä‚¢‚½ƒGƒ“ƒR[ƒfƒBƒ“ƒO‚ÌŽw’èŽq–¼‚Å‚ ‚éBˆê•”‚ÌHTML¶¬ƒ\ƒtƒg‚ªŽ©“®
‚Å‚±‚ÌŽw’èŽq‚ð‘g‚Ýž‚ñ‚ÅŽg‚Á‚Ä‚¢‚éB‚»‚Ì‚½‚ß”FŽ¯‰Â”\‚Èƒuƒ‰ƒEƒU‚ª‚ ‚é‚ªA
uShift_JISv‚É‘‚«Š·‚¦‚é‚±‚Æ‚ð„§‚µ‚Ä‚¢‚éB


=head1 ‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Å‚Ì "ShiftJIS"

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Å‚¢‚¤ "ShiftJIS" ‚Íã‹L‚ÌuƒR[ƒh‹óŠÔ‚É‚¨‚¯‚é•¶Žš”§ŒÀv‚Ì
11438•¶Žš‚·‚×‚Ä‚ðˆµ‚¦‚é‚±‚Æ‚ð–ÚŽw‚µ‚Ä‚¢‚Ü‚·B‚»‚Ì‚½‚ß‚ÉƒAƒ‹ƒSƒŠƒYƒ€‚Í2‚ÂŽg‚í
‚ê‚Ä‚¢‚Ü‚·B

  * ƒAƒ‹ƒSƒŠƒYƒ€ 1

    ƒIƒNƒeƒbƒg‚Ì•À‚Ñ‚©‚ç•¶Žš‚ðŽæ‚èo‚·‚Æ‚«A1ƒIƒNƒeƒbƒgƒR[ƒh‚Æ2ƒIƒNƒeƒbƒgƒR[ƒh
    ‚Ì‹æ•Ê‚Í‘æ1ƒIƒNƒeƒbƒgƒR[ƒh‚Ì‚Ý‚Ås‚í‚ê‚Ü‚·B‘æ2ƒIƒNƒeƒbƒg‚Íl—¶‚³‚ê‚Ü‚¹‚ñB

    1ƒIƒNƒeƒbƒgƒR[ƒh:
      0x00-0x80, 0xA0-0xDF, 0xFD-0xFF

    2ƒIƒNƒeƒbƒgƒR[ƒh:
      ‘æ1ƒIƒNƒeƒbƒg  0x81-0x9F, 0xE0-0xEF, 0xF0-0xFC
      ‘æ2ƒIƒNƒeƒbƒg  0x00-0xFF (‚·‚×‚Ä)

    •s³‚È1ƒIƒNƒeƒbƒgƒR[ƒh:
      0x81-0x9F, 0xE0-0xFC
      * •¶Žš—ñ‚ÌÅIƒIƒNƒeƒbƒg‚ª2ƒIƒNƒeƒbƒgƒR[ƒh‚Ì‘æ1ƒIƒNƒeƒbƒg‚Æ“¯‚¶ê‡

ˆÈ‰º‚ÉƒR[ƒh•\‚ðŒfÚ‚µ‚Ü‚·B

        1ƒIƒNƒeƒbƒgƒR[ƒh•\

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+

                                 2ƒIƒNƒeƒbƒgƒR[ƒh•\
            ‘æ1ƒIƒNƒeƒbƒg                                    ‘æ2ƒIƒNƒeƒbƒg


   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


    *•s³‚È* 1ƒIƒNƒeƒbƒgƒR[ƒh

•¶Žš—ñ‚ÌÅIƒIƒNƒeƒbƒg‚ª2ƒIƒNƒeƒbƒgƒR[ƒh‚Ì‘æ1ƒIƒNƒeƒbƒg‚Æ“¯‚¶ê‡

•s³‚Å‚ ‚Á‚Ä‚à–³Ž‹‚³‚ê‚½‚èAŽ©“®“I‚Éíœ‚³‚ê‚é‚±‚Æ‚Í‚ ‚è‚Ü‚¹‚ñB
—á‚¦‚ÎAEsjis::chop ‚Í‚±‚ÌƒIƒNƒeƒbƒg‚ð•Ô‚µ‚Ü‚·B

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |M|M|M|M|M|M|M|M|M|M|M|M|M|M|M| 0x81-0x9F
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|M|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|M|M|M|M|M|M|M|M|M|M|M|M|M| | | |  0xE0-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=head1 ƒxƒ“ƒ_•Ê SJIS ƒR[ƒhˆê——

http://home.m05.itscom.net/numa/cde/sjis-euc/sjis.html

 DEC PC                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 DEC WS                         0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu TrueType font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Fujitsu FontCity font (PC)     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi PC                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Hitachi WS                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 IBM                            0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC Windows (PC)               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 NEC DOS (PC)                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 SONY NEWS-OS                   0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Sun Wabi                       0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Unisys PC                      0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 HP Japan Japanese HP-15        0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 AT&T Japan                     0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Mitsubishi Electric FONTRUNNER 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Concurrent Japan               0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)
 Informix ASCII INFORMIX V6 ALS 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC), (0xFD)(0xA1-0xFE)(0xA1-0xFE)
 Oracle Oracle7 (Release 7.1.3) 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x00-0xFF)
 Sybase SQL Server, Open Server 0x00-0x7F, 0xA1-0xDF, (0x81-0x9F, 0xE0-0xFC)(0x40-0x7E, 0x80-0xFC)

“ú–{Œêî•ñˆ—(ISBN 4-89052-708-7)‚æ‚è

 Hewlett-Packard HP-15          0x00-0x7F, 0xA1-0xDF, (0x80-0xA0, 0xE0-0xFE)(0x21-0x7E, 0x80-0xFF)

  * ƒAƒ‹ƒSƒŠƒYƒ€ 2

    ƒAƒ‹ƒSƒŠƒYƒ€ 1 ‚É‚àŠÖ‚í‚ç‚¸Atr/// ‚É‚æ‚è•¶Žš‚Ì”ÍˆÍ‚ðŽw’è‚³‚ê‚½ê‡‚ÍˆÈ‰º‚Ì•¶Žš
    ‚Ì‚Ý‚ª—LŒø‚Æ‚È‚è‚Ü‚·B

    1ƒIƒNƒeƒbƒgƒR[ƒh:
      0x00-0x80, 0xA0-0xDF, 0xFD-0xFF

    2ƒIƒNƒeƒbƒgƒR[ƒh:
      ‘æ1ƒIƒNƒeƒbƒg  0x81-0x9F, 0xE0-0xEF, 0xF0-0xFC
      ‘æ2ƒIƒNƒeƒbƒg  0x40-0x7E, 0x80-0xFC

—á‚¦‚ÎA[\x81\x00-\x82\xFF] ‚Æ‘‚©‚ê‚½ê‡‚Í [\x81\x82][\x40-\x7E\x80-\xFC] ‚ð
ˆÓ–¡‚µ‚Ü‚·B

ˆÈ‰º‚ÉƒR[ƒh•\‚ðŒfÚ‚µ‚Ü‚·B

        1ƒIƒNƒeƒbƒgƒR[ƒh•\

   0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x00-0x80
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8|*| | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xA0-0xDF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F| | | | | | | | | | | | | |*|*|*| 0xFD-0xFF
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


                                 2ƒIƒNƒeƒbƒgƒR[ƒh•\
            ‘æ1ƒIƒNƒeƒbƒg                                    ‘æ2ƒIƒNƒeƒbƒg

   0 1 2 3 4 5 6 7 8 9 A B C D E F                 0 1 2 3 4 5 6 7 8 9 A B C D E F 
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 0| | | | | | | | | | | | | | | | |              0| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 1| | | | | | | | | | | | | | | | |              1| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 2| | | | | | | | | | | | | | | | |              2| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 3| | | | | | | | | | | | | | | | |              3| | | | | | | | | | | | | | | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 4| | | | | | | | | | | | | | | | |              4|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x40-0x7E
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 5| | | | | | | | | | | | | | | | |              5|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 6| | | | | | | | | | | | | | | | |              6|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 7| | | | | | | | | | | | | | | | |              7|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 8| |*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x81-0x9F    8|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0x80-0xFC
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|              9|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 A| | | | | | | | | | | | | | | | |              A|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 B| | | | | | | | | | | | | | | | |              B|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 C| | | | | | | | | | | | | | | | |              C|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 D| | | | | | | | | | | | | | | | |              D|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*| 0xE0-0xFC    E|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|*|
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
 F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |              F|*|*|*|*|*|*|*|*|*|*|*|*|*| | | |
  +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+               +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+


=head1 –Ú•W‚Æ‚µ‚Ä‚¢‚é‚à‚Ì

ƒvƒƒOƒ‰ƒ~ƒ“ƒO Perl ‘æ3”Å VOLUME 1 (ISBN 4-87311-096-3)
15Í Unicode ŽQÆ

Unicode ƒTƒ|[ƒg‚ª perl ‚É“±“ü‚³‚ê‚éˆÈ‘O‚ÍAeq ‰‰ŽZŽq‚ÍA2‚Â‚ÌƒXƒJƒ‰[•Ï”‚É‚æ‚Á
‚Ä•\‚³‚ê‚½ƒoƒCƒg—ñ‚ð‚½‚¾”ä‚×‚Ä‚¢‚Ü‚µ‚½Bperl5.8 ˆÈ~Aeq ‚ÍA2‚Â‚ÌƒoƒCƒg—ñ‚ð”ä‚×‚é
‚Æ“¯Žž‚É UTF8 ƒtƒ‰ƒO‚ðl—¶‚µ‚Ü‚·B

Œ‹‰Ê“I‚É‚±‚Ì•ÏX‚ÍA‰ß‹Ž‚ÌƒXƒNƒŠƒvƒg‚ÆV‚µ‚¢ƒXƒNƒŠƒvƒg‚ÌŠÔ‚É‘å‚«‚Èa‚ðì‚è‚Ü‚µ‚½B
‚à‚Í‚â—¼ŽÒ‚ÌƒXƒNƒŠƒvƒg‚ÍƒR[ƒh‚ðŒÝ‚¢‚ÉÄ—˜—p‚·‚é‚±‚Æ‚ª‚Å‚«‚Ü‚¹‚ñB‚Ü‚½V‚µ‚¢•û–@‚Í
ƒvƒƒOƒ‰ƒ}‚É•‰’S‚ð‚©‚¯‚é‚½‚ßAŒ»‘¶‚·‚éƒXƒNƒŠƒvƒg‚ª‚·‚×‚Ä’u‚«Š·‚í‚é‚Ì‚Í‚Ü‚¾‚Ü‚¾ŽžŠÔ
‚ª‚©‚©‚é‚ÆŽv‚í‚ê‚Ü‚·B

V‚µ‚¢•û–@‚Å–â‘è‚Æ‚È‚Á‚Ä‚¢‚é‚±‚Æ‚Í UTF8 ƒtƒ‰ƒO‚ÍŽÀÛ‚Ì•¶Žš—ñ‚Ì•„†‰»‚Æˆê’v‚µ‚È‚¢‚±‚Æ
‚Å‚·BŽ©•ª‚Åì‚Á‚½ƒXƒNƒŠƒvƒg‚Í‚»‚ÌƒfƒoƒbƒO‚Ì‘O‚É UTF8 ƒtƒ‰ƒO‚É‚Â‚¢‚ÄƒfƒoƒbƒO‚µ‚È‚¯
‚ê‚Î‚È‚è‚Ü‚¹‚ñB

‚»‚±‚ÅÌ‚Ì•û–@‚É–ß‚·‚±‚Æ‚É‚æ‚Á‚ÄA‚Ç‚Ì‚æ‚¤‚É‰ðŒˆ‚³‚ê‚é‚Ì‚© Programming Perl, 3rd ed.
(–M–ó ƒvƒƒOƒ‰ƒ~ƒ“ƒOPerl ‘æ3”Å) ‚Ì402ƒy[ƒW‚ð‚à‚¤ˆê“xˆø—p‚µ‚Ü‚µ‚å‚¤B

—‘z“I‚É‚ÍAˆÈ‰º‚Ì5‚Â‚ÌƒS[ƒ‹‚ðŽÀŒ»‚µ‚æ‚¤‚Æl‚¦‚Ä‚¢‚Ü‚·B

=over 2

=item * ƒS[ƒ‹1

    Šù‘¶‚ÌƒoƒCƒgŽwŒü‚ÌƒXƒNƒŠƒvƒg‚ÍAˆÈ‘Oˆµ‚Á‚Ä‚¢‚½Šù‘¶‚ÌƒoƒCƒgŽwŒü‚Ìƒf[ƒ^‚É‘Î‚µ
    ‚ÄAˆÈ‘O‚Æ“¯—l‚É“®ì‚·‚×‚«‚Å‚ ‚éB

    ‚±‚ê‚Í ShiftJIS ‚ªƒoƒCƒgŽwŒü‚Å‚ ‚é ASCII ‚¨‚æ‚Ñ JIS X 0201 ‚Æ‘g‡‚í‚¹‚Ä—˜—p
    ‚Å‚«‚é‚æ‚¤ÝŒv‚³‚ê‚½‚±‚Æ‚É‚æ‚Á‚ÄA‚·‚Å‚É’B¬‚³‚ê‚Ä‚¢‚Ü‚·B

=item * ƒS[ƒ‹2

    Šù‘¶‚ÌƒoƒCƒgŽwŒü‚ÌƒXƒNƒŠƒvƒg‚ÍA‰½‚àŽè‚ð‰Á‚¦‚¸‚ÉA(‚»‚¤‚·‚é‚±‚Æ‚ª“KØ‚Å‚ ‚ê‚Î)
    V‚µ‚¢•¶ŽšŽwŒü‚Ìƒf[ƒ^‚É‘Î‚µ‚Ä‚à“®ì‚·‚é‚æ‚¤‚É‚È‚é‚×‚«‚Å‚ ‚éB

    ‘gž‚ÝŠÖ” length, substr, index, rindex, pos ‚È‚Ç‚Ì•¶Žš—ñ‚Ì’·‚³‚âˆÊ’u‚ðˆµ‚¤
    ‚à‚Ì‚Í¡‚Ü‚Å‚Ç‚¨‚è‚É1ƒIƒNƒeƒbƒg‚ð 1 ‚Æ”‚¦‚Ü‚·B‚±‚Ì•”•ª‚É‚Â‚¢‚Ä‰½‚àŽè‚Í‰Á
    ‚í‚è‚Ü‚¹‚ñB2ƒIƒNƒeƒbƒgƒR[ƒh1•¶Žš‚Ì length ‚Í 2 ‚É‚È‚è‚Ü‚·B

    ˆê•ûAƒXƒNƒŠƒvƒg’†‚Ì³‹K•\Œ»‚ÍAƒ}ƒ‹ƒ`ƒoƒCƒg•¶Žš‚Ì‚½‚ß‚ÌƒAƒ“ƒJ[ƒŠƒ“ƒOˆ—‚ð
    ‹Lq‚·‚é•K—v‚ª‚ ‚è‚Ü‚·‚ªA‚»‚ê‚ð‚ ‚È‚½‚É‘ã‚í‚Á‚Ä‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚ªs‚¢‚Ü‚·B

    ƒS[ƒ‹1‚ÆƒS[ƒ‹2‚Ì“à—e‚ð}Ž¦‚µ‚Ü‚·B

                                   GOAL#1  GOAL#2
                            (a)     (b)     (c)     (d)     (e)
         „¡„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¢
         „  ƒf[ƒ^       „  Old  „  Old  „  New  „  Old  „  New  „ 
         „¥„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„§
         „  ƒXƒNƒŠƒvƒg   „  Old  „      Old      „      New      „ 
         „¥„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„§
         „  ƒCƒ“ƒ^ƒvƒŠƒ^ „  Old  „              New              „ 
         „¤„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„£
          Old --- Šù‘¶‚ÌƒoƒCƒgŽwŒü
          New --- V‚µ‚¢•¶ŽšŽwŒü

    ƒf[ƒ^AƒXƒNƒŠƒvƒgAƒCƒ“ƒ^ƒvƒŠƒ^‚ÌVE‹Œ‚ÉŠÖ‚µ‚ÄAã‚Ì (a) ‚©‚ç (e) ‚Ü‚Å‚Ì
    ‘g‡‚¹‚ª‚ ‚è‚Ü‚·B‚±‚Ì•¶‘‚ª‘‚©‚ê‚½“–Žž‚É‘¶Ý‚µ‚È‚©‚Á‚½ Encode ƒ‚ƒWƒ…[ƒ‹‚Æ
    ‚±‚Ìƒ\ƒtƒgƒEƒFƒAA‚¨‚æ‚Ñ‘¶Ý‚µ‚Ä‚¢‚½ JPerl ‚ð‘‚«‘«‚µ‚Ä‚Ý‚Ü‚µ‚å‚¤B

                            (a)     (b)     (c)     (d)     (e)
                                           JPerl          Encode,Sjis
         „¡„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¦„Ÿ„Ÿ„Ÿ„¢
         „  ƒf[ƒ^       „  Old  „  Old  „  New  „  Old  „  New  „ 
         „¥„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„§
         „  ƒXƒNƒŠƒvƒg   „  Old  „      Old      „      New      „ 
         „¥„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„©„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„§
         „  ƒCƒ“ƒ^ƒvƒŠƒ^ „  Old  „              New              „ 
         „¤„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„¨„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„Ÿ„£
          Old --- Šù‘¶‚ÌƒoƒCƒgŽwŒü
          New --- V‚µ‚¢•¶ŽšŽwŒü

    JPerl ‚ª‚Æ‚Ä‚à—D‚ê‚Ä‚¢‚é——R‚Í (c) ‚ÌˆÊ’u‚É‚ ‚é‚©‚ç‚Å‚·B‚·‚È‚í‚¿“ú–{Œêˆ—
    ‚ðs‚¤‚½‚ß‚ÉƒXƒNƒŠƒvƒg‚É“Á•Ê‚È‹Lq‚ðs‚¤•K—v‚ª‚ ‚è‚Ü‚¹‚ñB

    ‘ÎÆ“I‚È‚Ì‚Í Encode ƒ‚ƒWƒ…[ƒ‹‚â‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚É‚Ä "use Sjis;" ‚ð‹Lq‚·‚é
    ê‡‚Å‚·B‚±‚Ìê‡‚ÍV‚½‚ÈƒXƒNƒŠƒvƒg‚Ì‘‚«•û‚ð‚·‚é•K—v‚ª‚ ‚è‚Ü‚·B

=item * ƒS[ƒ‹3

    ƒXƒNƒŠƒvƒg‚ÍAV‚µ‚¢•¶ŽšŽwŒüƒ‚[ƒh‚Å‚àAˆÈ‘O‚ÌƒoƒCƒgŽwŒüƒ‚[ƒh‚Æ“¯‚¶ƒXƒs[
    ƒh‚Å“®ì‚·‚×‚«‚Å‚ ‚éB

    ‚»‚ê‚Í–³—B‚¾‚Á‚ÄAˆÈ‰º‚ÌŽžŠÔ‚ª•K—v‚¾‚à‚ÌB

    (1) ƒXƒNƒŠƒvƒg‚ðƒGƒXƒP[ƒv‚µ‚ÄAƒoƒCƒgŽwŒü Perl ‚Åˆµ‚¦‚é‚æ‚¤‚Éˆ—‚·‚é‚½‚ß‚Ì
     ŽžŠÔB‚½‚¾‚µAˆ—‚³‚ê‚½ƒXƒNƒŠƒvƒg‚Í•Û‘¶‚Å‚«‚é‚½‚ßAŽŸ‰ñ‚©‚ç‚Í‚±‚ÌŽžŠÔ‚ð‚È‚­
     ‚·‚±‚Æ‚à‰Â”\‚Å‚·B

    (2) ƒGƒXƒP[ƒv‚³‚ê‚½ƒXƒNƒŠƒvƒg‚ªƒ}ƒ‹ƒ`ƒoƒCƒgƒAƒ“ƒJ[ƒŠƒ“ƒOˆ—‚ðs‚¢‚È‚ª‚çA
     ³‹K•\Œ»‚ðŽÀs‚·‚éŽžŠÔB

    ‚·‚Å‚É‘¶Ý‚·‚é ASCII ƒf[ƒ^‚Í1•¶Žš‚ª1ƒIƒNƒeƒbƒg‚ÉƒpƒbƒN‚³‚ê‚Ä‚¢‚Ü‚·B‚»‚Ì
    ƒf[ƒ^‚ÆŒÝŠ·«‚ð•Û‚¿‚È‚ª‚ç•¶ŽšŽí‚ð‘‚â‚»‚¤‚Æ‚·‚é‚ÆAISO-2022 ‚Ì‚æ‚¤‚ÉƒGƒXƒP[
    ƒvƒV[ƒPƒ“ƒX‚ª•K—v‚Å‚ ‚Á‚½‚èAShiftJIS ‚â UTF-8 ‚Ì‚æ‚¤‚É "ƒGƒXƒP[ƒvƒrƒbƒg"
    ‚ª•K—v‚É‚È‚Á‚½‚è‚µ‚Ü‚·B‚±‚ê‚ç‚ÌƒGƒXƒP[ƒvˆ—‚ª‰Á‚í‚é‚½‚ßAˆÈ‘O‚Æ“¯‚¶ƒXƒs[
    ƒh‚Å“®ì‚·‚×‚«‚Å‚ ‚é‚Æ‚¢‚¤‚Ì‚Í–³—‚È–Ú•W‚¾‚ÆŽv‚¢‚Ü‚·B

=item * ƒS[ƒ‹4

    Perl ‚ÍAƒoƒCƒgŽwŒü‚Ì Perl ‚Æ•¶ŽšŽwŒü‚Ì Perl ‚ÉŽ}•ª‚©‚ê‚¹‚¸‚ÉA1‚Â‚ÌŒ¾Œê‚Å
    ‚ ‚è‘±‚¯‚é‚×‚«‚Å‚ ‚éB

    ƒoƒCƒgŽwŒü‚Ì Perl ‚Í‚·‚Å‚ÉƒoƒCƒiƒŠƒf[ƒ^‚ðˆµ‚¤‚±‚Æ‚ª‚Å‚«‚é‚½‚ßA•¶ŽšŽwŒü‚Ì
    Perl ‚ð•Ê—§‚Ä‚Åì¬‚·‚é•K—v‚Í‚ ‚è‚Ü‚¹‚ñB‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í’P‚È‚é Perl ‚ÌƒAƒv
    ƒŠƒP[ƒVƒ‡ƒ“ƒvƒƒOƒ‰ƒ€‚Å‚ ‚èAƒtƒBƒ‹ƒ^ƒvƒƒOƒ‰ƒ€‚Æ‚µ‚Äì¬‚³‚ê‚Ä‚¢‚Ü‚·B
    Šî–{“I‚É‚Í perl ‚ªŽÀs‚Å‚«‚éŠÂ‹«‚È‚ç‚Î“®ì‚·‚é‚Å‚µ‚å‚¤B

=item * ƒS[ƒ‹5

    JPerl ƒ†[ƒU‚ª Perl ‚Å JPerl ‚ð•ÛŽç‚Å‚«‚é‚æ‚¤‚É‚È‚éB

    ‚½‚Ô‚ñB

=back

Programming Perl, 3rd ed. ‚ª‘‚©‚ê‚½ ‚É‚ÍAUTF8 ƒtƒ‰ƒO‚Í¶‚Ü‚ê‚Ä‚¨‚ç‚¸APerl ‚Í
ŠÈ’P‚ÈŽdŽ–‚ðŠÈ’P‚É‚Å‚«‚é‚æ‚¤‚ÉÝŒv‚³‚ê‚Ä‚¢‚Ü‚µ‚½B‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚Í“–Žž‚Ì‚æ‚¤‚È
ƒvƒƒOƒ‰ƒ~ƒ“ƒOŠÂ‹«‚ð’ñ‹Ÿ‚µ‚Ü‚·B

=head1 ŽQl•¶Œ£

 ƒvƒƒOƒ‰ƒ~ƒ“ƒOPerl ‰ü’ù”Å
 By Larry Wall, Tom Christiansen, Randal L. Schwartz, ‹ß“¡ ‰Ãá –ó
 1997”N12ŒŽ ”­s
 759ƒy[ƒW
 ISBN 4-900900-48-6
 http://www.oreilly.co.jp/out/pperl/index.htm

 ƒvƒƒOƒ‰ƒ~ƒ“ƒOPerl ‘æ3”Å VOLUME 1
 By Larry Wall, Tom Christiansen, Jon Orwant, ‹ß“¡ ‰Ãá –ó
 2002”N09ŒŽ ”­s
 756ƒy[ƒW
 ISBN 4-87311-096-3
 http://www.oreilly.co.jp/books/4873110963/

 ƒvƒƒOƒ‰ƒ~ƒ“ƒOPerl ‘æ3”Å VOLUME 2
 By Larry Wall, Tom Christiansen, Jon Orwant, ‹ß“¡ ‰Ãá –ó
 2002”N09ŒŽ ”­s
 680ƒy[ƒW
 ISBN 4-87311-097-1
 http://www.oreilly.co.jp/books/4873110971/

 PerlƒNƒbƒNƒuƒbƒN ‘æ2”Å VOLUME 1
 By Tom Christiansen, Nathan Torkington, Shibuya Perl Mongers ŠÄ–ó, Š”Ž®‰ïŽÐƒhƒLƒ…ƒƒ“ƒgƒVƒXƒeƒ€ –ó
 2004”N09ŒŽ ”­s
 752ƒy[ƒW
 ISBN 4-87311-202-8
 http://www.oreilly.co.jp/books/4873112028/

 PerlƒNƒbƒNƒuƒbƒN ‘æ2”Å VOLUME 2
 By Tom Christiansen, Nathan Torkington, Shibuya Perl Mongers ŠÄ–ó, Š”Ž®‰ïŽÐƒhƒLƒ…ƒƒ“ƒgƒVƒXƒeƒ€ –ó
 2004”N09ŒŽ ”­s
 464ƒy[ƒW
 ISBN 4-87311-203-6
 http://www.oreilly.co.jp/books/4873112036/

 PerlƒNƒCƒbƒNƒŠƒtƒ@ƒŒƒ“ƒX
 By Stephen Spainhour, Ellen Siever, Nathan Patwardhan, ‹ß“¡ ‰Ãá, ‘äê Œ\ˆê ŠÄ–ó
 2000”N03ŒŽ ”­s
 784ƒy[ƒW
 ISBN 4-900900-72-9
 http://www.oreilly.co.jp/books/4900900729/

 ‰‚ß‚Ä‚ÌPerl Win32ƒVƒXƒeƒ€
 Randal L. Schwartz, Erik Olson, Tom Christiansen ’˜, —L”n ŽO˜Y ŠÄ–ó, ÎŒ´ ’q_ –ó
 1998”N11ŒŽ ”­s
 348ƒy[ƒW
 ISBN 4-900900-79-6
 http://www.oreilly.co.jp/books/4900900796/

 ‰‚ß‚Ä‚ÌPerl ‘æ5”Å
 Randal L. Schwartz, Tom Phoenix, brian d foy ’˜
 2009”N10ŒŽ24“ú ”­”„
 424ƒy[ƒW
 ISBN978-4-87311-427-9
 http://www.oreilly.co.jp/books/9784873114279/

 PerlƒŠƒ\[ƒXƒLƒbƒg - UNIX”Å
 Futato, Irving, Jepson, Patwardhan, Siever ‹¤’˜, ƒCƒGƒ[ƒŒ[ƒxƒ‹ ŽR–{ _ –ó
 ISBN4-900900-65-6

 “ú–{Œêî•ñˆ—
 Understanding Japanese Information Processing
 By Ken Lunde, t•Õ˜Ò, —é–Ø•¶ –ó
 1995”N8ŒŽ ”­s
 496ƒy[ƒW
 ISBN 4-89052-708-7

 CJKV“ú’†ŠØ‰zî•ñˆ—
 Chinese, Japanese, Korean & Vietnamese Computing
 By Ken Lunde, ¬¼ Í, ‹tˆä ŽŒÈ –ó
 2002”N12ŒŽ ”­s
 1172ƒy[ƒW
 ISBN 4-87311-108-0
 http://www.oreilly.co.jp/books/4873111080/

 Úà ³‹K•\Œ» ‘æ2”Å
 By Jeffrey E. F. Friedl, “c˜a Ÿ –ó
 2003”N05ŒŽ ”­s
 464ƒy[ƒW
 ISBN 4-87311-130-7
 http://www.oreilly.co.jp/books/4873111307/

 Úà ³‹K•\Œ» ‘æ3”Å
 By Jeffrey E. F. Friedl, Š”Ž®‰ïŽÐƒƒ“ƒOƒe[ƒ‹^’·”ö ‚O –ó
 2008”N04ŒŽ ”­s
 528ƒy[ƒW
 ISBN 978-4-87311-359-3
 http://www.oreilly.co.jp/books/9784873113593/

 PerlƒvƒƒOƒ‰ƒ~ƒ“ƒO
 Larry Wall, Randal L.Schwartz, ‹ß“¡ ‰Ãá –ó
 1993”N2ŒŽ”­s
 ISBN 4-89052-384-7
 http://www.context.co.jp/~cond/books/old-books.html

 JISŠ¿ŽšŽš“T
 ŽÅ–ìkŽi •Ò’˜
 1456 •Å
 ISBN 4-542-20129-5
 http://www.webstore.jsa.or.jp/lib/lib.asp?fn=/manual/mnl01_12.htm

 UNIX MAGAZINE
 1993”N8ŒŽ†
 172ƒy[ƒW
 T1008901080816 ŽGŽ08901-8
 http://ascii.asciimw.jp/books/magazines/unix.shtml

=head1 ŽÓŽ«

‚±‚Ìƒ\ƒtƒgƒEƒFƒA‚ÍAˆÈ‰º‚Ì•ûX‚Ìì¬‚µ‚½ƒ\ƒtƒgƒEƒFƒA‚¨‚æ‚Ñ•¶‘‚Ì‚¨‚©‚°‚É‚æ‚èì¬
‚³‚ê‚Ü‚µ‚½B‘S‚Ä‚Ì•û‚ÉŠ´ŽÓ‚¢‚½‚µ‚Ü‚·B

 ŽR‰º —Ç‘ ‚³‚ñ, ƒVƒtƒgJIS‚ÌƒfƒUƒCƒ“‚Ì˜b
 ttp://furukawablog.spaces.live.com/Blog/cns!1pmWgsL289nm7Shn7cS0jHzA!2225.entry
 (æ“ª‚É 'h' ‚ð•t‰Á‚µ‚ÄƒAƒNƒZƒX‚µ‚Ä‚­‚¾‚³‚¢)

 Larry Wall, Perl
 http://www.perl.org/

 ‰Ì‘ã ˜a³‚³‚ñ, jcode.pl
 ftp://ftp.iij.ad.jp/pub/IIJ/dist/utashiro/perl/

 Jeffrey E. F. Friedl, Mastering Regular Expressions
 http://www.oreilly.com/catalog/regex/index.html

 ’åœA ’ms‚³‚ñ, Shift-JISƒeƒLƒXƒg‚ð³‚µ‚­ˆµ‚¤
 http://homepage1.nifty.com/nomenclator/perl/shiftjis.htm

 ‚Ü‚Â‚à‚Æ ‚ä‚«‚Ð‚ë‚³‚ñ, Ruby on Perl(s)
 http://www.rubyist.net/~matz/slides/yapc2006/

 “¡‰ª ˜a•v‚³‚ñ, jperlƒ†[ƒU[‚Ì‚½‚ß‚É
 http://homepage1.nifty.com/kazuf/jperl.html

 ˜aò G–¾‚³‚ñ, Windows‚ÅPerl 5.8/5.10‚ðŽg‚¤ƒ‚ƒ“‚¶‚á‚È‚¢
 http://www.aritia.org/hizumi/perl/perlwin.html

 ’Ë–{ –q¶‚³‚ñ, Perlƒƒ‚/Windows‚Å‚Ìƒtƒ@ƒCƒ‹ƒpƒX
 http://digit.que.ne.jp/work/wiki.cgi?Perl%E3%83%A1%E3%83%A2%2FWindows%E3%81%A7%E3%81%AE%E3%83%95%E3%82%A1%E3%82%A4%E3%83%AB%E3%83%91%E3%82%B9

 chaichanPaPa‚³‚ñ, ƒVƒtƒgJISŠ¿Žš‚Ìƒtƒ@ƒCƒ‹–¼‚Éƒ}ƒbƒ`‚µ‚Ä‚Ý‚é
 http://d.hatena.ne.jp/chaichanPaPa/20080802/1217660826

 —é–Ø ‹I•v‚³‚ñ, Jperl
 http://homepage2.nifty.com/kipp/perl/jperl/

 “n•Ó ”Ž•¶‚³‚ñ, Jperl
 http://search.cpan.org/~watanabe/
 http://mail.pm.org/pipermail/tokyo-pm/1999-September/001854.html

 ¬Ž” ’e‚³‚ñ, Encode ƒ‚ƒWƒ…[ƒ‹
 http://search.cpan.org/dist/Encode/

 Juerd, Perl Unicode Advice
 http://juerd.nl/site.plp/perluniadvice

 daily dayflower, 2008-06-25 perluniadvice
 http://d.hatena.ne.jp/dayflower/20080625/1214374293

 Tokyo-pm •Û‘¶‘ŒÉ
 http://mail.pm.org/pipermail/tokyo-pm/

=cut

