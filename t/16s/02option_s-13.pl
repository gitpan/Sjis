use Sjis;

# s///o

for $i (1 .. 3) {
    $a = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";

    if ($i == 1) {
        $re = 'J';
    }
    elsif ($i == 2) {
        $re = 'K';
    }
    elsif ($i == 3) {
        $re = 'L';
    }

    if ($a =~ s/$re/あ/o) {
        if ($a eq "ABCDEFGHIあKLMNOPQRSTUVWXYZ") {
            print qq{ok - 13 \$a =~ s/\$re/あ/o (\$re=$re)(\$a=$a)\n};
        }
        else {
            print qq{not ok - 13a \$a =~ s/\$re/あ/o (\$re=$re)(\$a=$a)\n};
        }
    }
    else {
        print qq{not ok - 13b \$a =~ s/\$re/あ/o (\$re=$re)(\$a=$a)\n};
    }
}

__END__
