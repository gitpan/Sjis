use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�\";
if ($a !~ s/(�C�\?)//) {
    print qq{ok - 10 "�A�\�\" !~ s/(�C�\?)// \$1=($1) $^X $__FILE__\n};
}
else {
    print qq{not ok - 10 "�A�\�\" !~ s/(�C�\?)// \$1=($1) $^X $__FILE__\n};
}

__END__
