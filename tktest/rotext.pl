#!/usr/bin/perl -w
# $RCSfile: rotext.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
use Sjis;
use Tk;
use Tk::ROText;
$mw = MainWindow->new;
$mw->title("ROText");

# ���{��̕\�����ł��邩�ǂ����H

# Create ROText Widget
$rot = $mw->Scrolled('ROText',
			-font => ['�l�r�@�S�V�b�N', 12, 'normal'],
		     -background => 'white',
		     -width      => 45,
		     -height     => 15,
		     -wrap       => 'none',
		     -scrollbars => 'e')
    ->pack(-side   => 'left',
	   -fill   => 'both',
	   -expand => 'yes');
# Read Message from File
$filename = "./rotext.pl";
open MSG, $filename;
while (<MSG>) {
    $mw->update;
    $rot->insert('end', $_);
    $mw->after(100);
    $rot->see('end');
}
close MSG;
#
MainLoop;
# ---
# rotext.pl
