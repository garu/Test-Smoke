#! /usr/bin/perl
use warnings FATAL => 'all';
use strict;

# $Id$

use File::Spec;

my @test_files;
BEGIN {
    @test_files = qw(
        synctree.pl patchtree.pl mailrpt.pl
        smokeperl.pl configsmoke.pl README ReleaseNotes FAQ runsmoke.pl
        archiverpt.pl smokestatus.pl W32Configure.pl
    );
    push @test_files, map File::Spec->catfile( 'lib', 'Test', 'Smoke', $_ )
        => qw( Syncer.pm SourceTree.pm Policy.pm Util.pm 
               SysInfo.pm Reporter.pm FTPClient.pm
               Patcher.pm Mailer.pm BuildCFG.pm Smoker.pm );
    push @test_files, map File::Spec->catfile( 'lib', 'Test', $_ )
        => qw( Smoke.pm );
}
use Test::Pod tests => scalar @test_files;

pod_file_ok( $_ ) for @test_files;
