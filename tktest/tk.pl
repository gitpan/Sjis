use Sjis;
use Tk;

@font = ('-font' => ['�l�r�@����', 16 ,'normal']);

$mw = MainWindow->new;
$mw->title("���{��\�@�������");

$mw->Button(@font, '-text' => '���{��\�@�������', '-command' => sub {
    my $openfile = $mw->getOpenFile();
    print "openfile=($openfile)\n";
    my $savefile = $mw->getSaveFile();
    print "savefile=($savefile)\n";
})->pack;
$mw->Label(@font, '-text' => '���{��\�@�������')->pack;
$mw->Checkbutton(@font, '-text' => '���{��\�@�������')->pack;
$mw->Radiobutton(@font, '-text' => '���{��\�@�������')->pack;
# $mw->Menubutton(@font, '-text' => '���{��\�@�������')->pack;
$mw->Scale(@font, '-label' => '���{��\�@�������')->pack;
$mw->Entry(@font, '-show' => '��')->pack;
$mw->Entry(@font)->pack;
$mw->Message(@font, '-text' => '���{��\�@�������')->pack;
$mw->Frame('-label' => "perl5.6 can't ���{��\�@�������")->pack;

$text = $mw->Text(@font, '-width' => 10, '-height' => 2)->pack;
$text->insert('1.0', '���{��\�@�������');

$canvas = $mw->Canvas('-width' => 200, '-height' => 50, '-background' => 'white')->pack;
$canvas->createText(10,10, @font, '-text' => '���{��\�@�������', '-anchor' => 'w');

$list = $mw->Listbox(@font, '-height' => 5, '-width' => 10, '-background' => 'white')->pack;
@item = ('���{��1','���{��2','���{��3','���{��4','���{��5',);
$list->insert('end', @item);

my $top2 = $mw->Toplevel();
$top2->title("2:���{��\�@�������");

my $top3 = $mw->Toplevel(-title => "3:���{��\�@�������");

MainLoop;
