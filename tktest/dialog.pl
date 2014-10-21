#!/usr/bin/perl -w
# $RCSfile: dialog.pl $ $Revision: 1.1 $ $Date: 1999/11/20 07:46:01 $
$\ = "\n";
use Sjis;
use Tk;
use Tk::Dialog;
$mw = MainWindow->new();
$mw->title("Main");
$menu = $mw->Menu();
# Toplevel $mw �̃I�v�V���� -menu ���`�B
$mw->configure(-menu => $menu);
# ���j���[�o�[�̃G���g��
$menu->add('command',
	   -label => "Exit",
	   -command => \&ExitSequence);
#
MainLoop;
# �I���m�F�̃_�C�A���O���J���B
sub ExitSequence {
    $mw->bell;
    print "### �_�C�A���O���J���܂��B";
    # �_�C�A���O
    my $dialog = $mw->Dialog(-title          => "�x��",
			     -bitmap         => "warning",
			     -text           => "�ۑ������ɏI�����܂����H",
			     -buttons        => ['�͂�', '������'],
			     -default_button => '������');
    my $answer = $dialog->Show;
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
# dialog.pl
