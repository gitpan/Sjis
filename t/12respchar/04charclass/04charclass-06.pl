# \x7B
if ("{" =~ m/\x7B/) {
    print qq<ok - 1 "{" =~ m/\\x7B/\n>;
}
else{
    print qq<not ok - 1 "{" =~ m/\\x7B/\n>;
}

__END__

