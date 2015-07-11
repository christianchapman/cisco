#!/usr/bin/perl
require 5.008;
use Getopt::Long;
use Fcntl qw(:flock);
use POSIX;

use Fcntl qw(:DEFAULT :flock);
use Getopt::Long;

my @vrf;
 my $username = 'nms';
 my $password ='nmsmpls1s4t3';
 my $enablepwd = 'nmsmpls1s4t3';
#my $enablepwd = 'Satelindo';
 my $routeripaddress;
 my $pop = $_[0];
 my $command = $_[1];
 my $LOGFILE;
 my $filename_router;
 my $size =0;
 my $x =0;
 my $y =0;
 my @parse;
 my $INPUT;
 my $OUTPUT;

my $OUTPUT_PING;
GetOptions("r=s" => \$routeripaddress,
           "n=s" => \$filename_router);

open(INPUT, "<".$ARGV[0] ) or die $!;
open(OUTPUT_FORMAT, ">".$ARGV[1]) or die $!;




while (defined ($line = <INPUT>))
     {
       if (   ($line !~ /#/)  && ($line =~ /./) )
          {
                @parse = split(/\s+/,$line);
                $ip = $parse[0];
                $host = $parse[1];
                print OUTPUT_FORMAT "/export/home/nms/bulk_config/cisco/cisco_gather.pl -n $host -r $ip /export/home/nms/bulk_config/cisco/commands \n";
          }
     }


 close INPUT;
 close OUTPUT_FORMAT;
