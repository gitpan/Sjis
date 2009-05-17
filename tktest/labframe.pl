use Sjis;
use Tk;
use Tk::LabFrame;

$mw = MainWindow->new;
$lf = $mw->LabFrame(-label=>'qa‚ ‚ zwsx',-labelside=>'top')->pack;
$lf->Button(-text => 'Exit', -command => sub{exit})->pack;
MainLoop;
