<?php 
class object {}
$CFG = new object();
$CFG->dirroot = '/app/';
$CFG->dbhost = $_ENV["dbhost"] ?: 'db';
$CFG->dbname = $_ENV["dbname"] ?: 'wlox';
$CFG->dbuser = $_ENV["dbuser"] ?: 'wlox';
$CFG->dbpass = $_ENV["dbpass"] ?: 'wlox';
?>
