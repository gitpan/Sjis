use Sjis;

my $__FILE__ = __FILE__;

$a = "�A�\�\";
if ($a =~ s/(�A�\*)//) {
    if ($1 eq "�A�\�\") {
        print qq{ok - 15 "�A�\�\" =~ s/(�A�\*)// \$1=($1) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 15 "�A�\�\" =~ s/(�A�\*)// \$1=($1) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 15 "�A�\�\" =~ s/(�A�\*)// \$1=($1) $^X $__FILE__\n};
}

__END__
