use Sjis;

my $__FILE__ = __FILE__;

# \x7B
if ("{" =~ m/\x7B/) {
    print qq<ok - 1 "{" =~ m/\\x7B/ $^X $__FILE__\n>;
}
else{
    print qq<not ok - 1 "{" =~ m/\\x7B/ $^X $__FILE__\n>;
}

__END__

