use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�\";
if ($a !~ s/(�C.{2})//) {
    print qq{ok - 20 "�A�\�\" !~ s/(�C.{2})// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 20 "�A�\�\" !~ s/(�C.{2})// \$1=($1) $^X $__FILE__\n};
}

__END__
