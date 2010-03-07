use Sjis;

my $__FILE__ = __FILE__;

# s///x Åú
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/ J K L /Ç©Ç´Ç≠/x) {
    if ($a eq "ABCDEFGHIÇ©Ç´Ç≠MNOPQRSTUVWXYZ") {
        print qq{ok - 2 \$a =~ s/ J K L /Ç©Ç´Ç≠/x ($a) $^X $__FILE__\n};
    }
    else {
        print qq{not ok - 2a \$a =~ s/ J K L /Ç©Ç´Ç≠/x ($a) $^X $__FILE__\n};
    }
}
else {
    print qq{not ok - 2b \$a =~ s/ J K L /Ç©Ç´Ç≠/x ($a) $^X $__FILE__\n};
}

__END__
