#!/usr/bin/perl

# gimap.pl by gxmsgx
# description: get the count of unread messages on imap

use strict;
use Mail::IMAPClient;
use IO::Socket::SSL;

my $username = 'rbjornsvik@fastmail.com';
my $password = 'BQ!*ex0dVtEQ';

my $socket = IO::Socket::SSL->new(
  PeerAddr => 'mail.messagingengine.com',
  PeerPort => 993
 )
 or die "socket(): $@";

my $client = Mail::IMAPClient->new(
  Socket   => $socket,
  User     => $username,
  Password => $password,
 )
 or die "new(): $@";

if ($client->IsAuthenticated()) {
   my $msgct;

   $client->select("INBOX");
   $msgct = $client->unseen_count||'0';
   print "$msgct\n";
}

$client->logout();

