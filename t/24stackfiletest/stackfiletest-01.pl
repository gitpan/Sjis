use Sjis;

my $__FILE__ = __FILE__;

open(FILE,'>file');
close(FILE);

mkdir('directory',0777);

if (-r 'file') {
    print "ok - -r 'file' $^X $__FILE__\n";
}
else {
    print "not ok - -r 'file' $^X $__FILE__\n";
}

if (-w 'file') {
    print "ok - -w 'file' $^X $__FILE__\n";
}
else {
    print "not ok - -w 'file' $^X $__FILE__\n";
}

if (not -d 'file') {
    print "ok - not -d 'file' $^X $__FILE__\n";
}
else {
    print "not ok - not -d 'file' $^X $__FILE__\n";
}

if (-r -w 'file') {
    print "ok - -r -w 'file' $^X $__FILE__\n";
}
else {
    print "not ok - -r -w 'file' $^X $__FILE__\n";
}

if (not -r -w -d 'file') {
    print "ok - -r -w -d 'file' $^X $__FILE__\n";
}
else {
    print "not ok - -r -w -d 'file' $^X $__FILE__\n";
}

if (-r 'directory') {
    print "ok - -r 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - -r 'directory' $^X $__FILE__\n";
}

if (-w 'directory') {
    print "ok - -w 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - -w 'directory' $^X $__FILE__\n";
}

if (-d 'directory') {
    print "ok - -d 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - -d 'directory' $^X $__FILE__\n";
}

if (-r -w 'directory') {
    print "ok - -r -w 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - -r -w 'directory' $^X $__FILE__\n";
}

if (-r -w -d 'directory') {
    print "ok - -r -w -d 'directory' $^X $__FILE__\n";
}
else {
    print "not ok - -r -w -d 'directory' $^X $__FILE__\n";
}

__END__
