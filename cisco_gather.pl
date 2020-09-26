/export/home/nms/bulk_config/cisco/cisco_gather.pl -n RSRC-P011-ACC01.ROO.IQ -r 10.241.251.14 /export/home/nms/bulk_config/cisco/commands
/export/home/nms/bulk_config/cisco/cisco_gather.pl -n RSRC-P027-ACC01.ROO.IQ -r 10.241.250.147 /export/home/nms/bulk_config/cisco/commands
/export/home/nms/bulk_config/cisco/cisco_gather.pl -n RSRC-P030-ACC01.ROO.IQ -r 10.241.251.18 /export/home/nms/bulk_config/cisco/commands
/export/home/nms/bulk_config/cisco/cisco_gather.pl -n RSRC-0940-ACC02.roo.iq -r 10.241.250.234 /export/home/nms/bulk_config/cisco/commands
/export/home/nms/bulk_config/cisco/cisco_gather.pl -n RSRC-DC02-IPTV01.roo.iq -r 10.241.250.188 /export/home/nms/bulk_config/cisco/commands

#!/usr/bin/perl


use Fcntl qw(:DEFAULT :flock);
use Getopt::Long;

#### User Configurable Values #######################################

my $output_file_site = 'indosat'; # for filename do not use extension
my $username = '######';
my $password ='#####';
my $enablepwd = '####';
my $routeripaddress;
my $filename_router;
my @commands;
$timestorun = 1;

#####################################################################


GetOptions("r=s" => \$routeripaddress,
           "n=s" => \$filename_router);

my $list_command = $ARGV[0];



print "$routeraddress";


my $FILE;
my $time = gmtime();
my ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = gmtime time;

$output_file = "/export/home/nms/bulk_config/cisco/$filename_router.load";

open ( FILE, ">", $output_file ) || die $!;
flock ( FILE, LOCK_EX ) || die $!;

open ( CMD, "<", $list_command ) || die $!;

print "\n### Accessing $routeripaddress [$filename_router] ###\n";

   my @buffer = `/export/home/nms/tools/ssh_connect.exp -h $routeripaddress -u cchapman -p cnw84Fucker -m ssh -f $list_command`;
   print FILE @buffer;


   print FILE "\n--------------------------------------------------\n\n\n";


close FILE || die $!;
close CMD;
print "Done \($routeripaddress [$filename_router]\)\n";

