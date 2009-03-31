#!/usr/bin/perl -w
# $Id: table.pl 1.1 1999/11/20 07:46:01 ktaka Exp ktaka $	
use Sjis;
use Tk;
use Tk::Table;
#
$mw = MainWindow->new;
$mw->title("Table");
#
$table = $mw->Table(
    -rows         => 10,
    -columns      => 5,
    -scrollbars   => 'se',
    -fixedrows    => 1,
    -fixedcolumns => 1,
    -takefocus    => 1)
->pack(-side => 'top', -fill => 'both', -expand => 'yes');
#
for ($y = 0; $y < 20; $y++) {
    for ($x = 0; $x < 20; $x++) {
        $text = "($x, $y)";

        $text =~ tr/0-9/‚ ‚¢‚¤‚¦‚¨‚©‚«‚­‚¯‚±/;

        $table->put($y, $x, $text);
    }
}

MainLoop;

# ---
# table.pl
