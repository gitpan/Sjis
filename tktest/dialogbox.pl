#!/usr/bin/perl -w
# $RCSfile: dialogbox.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
$\ = "\n";
use Sjis;
use Tk;
use Tk::DialogBox;
$mw = MainWindow->new();
$mw->title("Main");
$menu = $mw->Menu();
$mw->configure(-menu => $menu);
$menu->add('command',
	   -label => "Exit",
	   -command => \&ExitSequence);
#
MainLoop;
#
sub ExitSequence {
    $mw->bell;
    print "### �_�C�A���O�{�b�N�X���J���܂��B";
    # �_�C�A���O�{�b�N�X
    my $diab = $mw->DialogBox(-title          => "�x��",
			      -buttons        => ['�͂�', '������'],
			      -default_button => '������');
    my $fra = $diab->add('Frame',
			 -borderwidth => 2,
			 -relief      => 'ridge')
	->pack(-padx => 5,
	       -pady => 5);    
    $fra->Label(-bitmap     => '@icon/exit.xbm',
		-foreground => 'red')
	->pack(-ipady => 10,
	       -side  => 'top',
	       -fill  => 'x');
    $fra->Label(-text        => "�ۑ������I�����܂����H",
		-font        => ['�l�r�@�S�V�b�N', 24, 'normal'])
	->pack(-ipadx => 10,
	       -ipady => 10);
    #
    my $answer = $diab->Show;
    print "> $answer ���I������܂����B";
    if ($answer eq 'Yes') {
	print "> �I�����܂��B";
	print "> ��������悤�B";
	exit;
    } else {
	print "> �A�v���P�[�V�����ɖ߂�܂��B";
    }
}
# ---
# dialogbox.pl
