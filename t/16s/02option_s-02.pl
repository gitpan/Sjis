use Sjis;

# s///x ��
$a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
if ($a =~ s/ J K L /������/x) {
    if ($a eq "ABCDEFGHI������MNOPQRSTUVWXYZ") {
        print qq{ok - 2 \$a =~ s/ J K L /������/x ($a)\n};
    }
    else {
        print qq{not ok - 2a \$a =~ s/ J K L /������/x ($a)\n};
    }
}
else {
    print qq{not ok - 2b \$a =~ s/ J K L /������/x ($a)\n};
}

__END__
