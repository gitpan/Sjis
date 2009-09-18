# \173
if ("{" =~ m/\173/) {
    print qq<ok - 1 "{" =~ m/\\173/\n>;
}
else{
    print qq<not ok - 1 "{" =~ m/\\173/\n>;
}

__END__

