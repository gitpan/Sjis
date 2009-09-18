use Sjis;

# [{]
if ("{" =~ m/[{]/) {
    print qq<ok - 1 "{" =~ m/[{]/\n>;
}
else{
    print qq<not ok - 1 "{" =~ m/[{]/\n>;
}

__END__

