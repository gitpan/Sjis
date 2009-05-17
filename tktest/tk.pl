use Sjis;
use Tk;

@font = ('-font' => ['ＭＳ　明朝', 16 ,'normal']);

$mw = MainWindow->new;
$mw->title("日本語ソ①髙ｱｲｳｴｵ");

$mw->Button(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ', '-command' => sub {
    my $openfile = $mw->getOpenFile();
    print "openfile=($openfile)\n";
    my $savefile = $mw->getSaveFile();
    print "savefile=($savefile)\n";
})->pack;
$mw->Label(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
$mw->Checkbutton(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
$mw->Radiobutton(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
# $mw->Menubutton(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
$mw->Scale(@font, '-label' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
$mw->Entry(@font, '-show' => '●')->pack;
$mw->Entry(@font)->pack;
$mw->Message(@font, '-text' => '日本語ソ①髙ｱｲｳｴｵ')->pack;
$mw->Frame('-label' => "perl5.6 can't 日本語ソ①髙ｱｲｳｴｵ")->pack;

$text = $mw->Text(@font, '-width' => 10, '-height' => 2)->pack;
$text->insert('1.0', '日本語ソ①髙ｱｲｳｴｵ');

$canvas = $mw->Canvas('-width' => 200, '-height' => 50, '-background' => 'white')->pack;
$canvas->createText(10,10, @font, '-text' => '日本語ソ①髙ｱｲｳｴｵ', '-anchor' => 'w');

$list = $mw->Listbox(@font, '-height' => 5, '-width' => 10, '-background' => 'white')->pack;
@item = ('日本語1','日本語2','日本語3','日本語4','日本語5',);
$list->insert('end', @item);

my $top2 = $mw->Toplevel();
$top2->title("2:日本語ソ①髙ｱｲｳｴｵ");

my $top3 = $mw->Toplevel(-title => "3:日本語ソ①髙ｱｲｳｴｵ");

MainLoop;
