#!/data/data/com.termux/files/usr/bin/perl -w
#
use strict;
use vars qw($VERSION %IRSSI);

use Irssi;
$VERSION = '1.00';
%IRSSI = (
  authors     => 'Mikhail Yudin',
  contact     => 'fagci.nsk@gmail.com',
  name        => 'Termux notifier',
  description => 'Notify about msgs by termux-api',
  license     => 'Public Domain',
);

sub notify {
  my ($text) = @_;
  system('termux-notification -i 46 -c ' . $text);
}

sub priv_msg {
  my ($server,$msg,$nick,$address,$target) = @_;
  if (not (Irssi::active_win()->get_active_name() eq "$nick")) {
    notify($server->{chatnet}.":$nick");
  }
}

#--------------------------------------------------------------------
# Public message parsing
#--------------------------------------------------------------------

sub pub_msg {
  my ($server,$msg,$nick,$address, $channel) = @_;
  my $onick= quotemeta "$server->{nick}";
  my $pat ='(\:|\,|\s)'; # option...
  if($msg =~ /^$onick\s*$pat/i){
    notify("$channel".":$nick");
  }
}


Irssi::signal_add_last('message private' => \&priv_msg);
Irssi::signal_add_last('message public' => \&pub_msg);

