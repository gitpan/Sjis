use Sjis;
$| = 1;

my $__FILE__ = __FILE__;

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

    if ($a =~ s/$re/‚ /o) {
        if ($a eq "ABCDEFGHI‚ KLMNOPQRSTUVWXYZ") {
            print qq{ok - 13 \$a =~ s/\$re/‚ /o (\$re=$re)(\$a=$a) $^X $__FILE__\n};
        }
        else {
            print qq{not ok - 13a \$a =~ s/\$re/‚ /o (\$re=$re)(\$a=$a) $^X $__FILE__\n};
        }
    }
    else {
        print qq{not ok - 13b \$a =~ s/\$re/‚ /o (\$re=$re)(\$a=$a) $^X $__FILE__\n};
    }
}

__END__
