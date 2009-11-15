use Sjis;

open(FILE,'>file');
close(FILE);

mkdir('directory',0777);

if (-r 'file') {
    print "ok - -r 'file'\n";
}
else {
    print "not ok - -r 'file'\n";
}

if (-w 'file') {
    print "ok - -w 'file'\n";
}
else {
    print "not ok - -w 'file'\n";
}

if (not -d 'file') {
    print "ok - not -d 'file'\n";
}
else {
    print "not ok - not -d 'file'\n";
}

if (-r -w 'file') {
    print "ok - -r -w 'file'\n";
}
else {
    print "not ok - -r -w 'file'\n";
}

if (not -r -w -d 'file') {
    print "ok - -r -w -d 'file'\n";
}
else {
    print "not ok - -r -w -d 'file'\n";
}

if (-r 'directory') {
    print "ok - -r 'directory'\n";
}
else {
    print "not ok - -r 'directory'\n";
}

if (-w 'directory') {
    print "ok - -w 'directory'\n";
}
else {
    print "not ok - -w 'directory'\n";
}

if (-d 'directory') {
    print "ok - -d 'directory'\n";
}
else {
    print "not ok - -d 'directory'\n";
}

if (-r -w 'directory') {
    print "ok - -r -w 'directory'\n";
}
else {
    print "not ok - -r -w 'directory'\n";
}

if (-r -w -d 'directory') {
    print "ok - -r -w -d 'directory'\n";
}
else {
    print "not ok - -r -w -d 'directory'\n";
}

__END__
