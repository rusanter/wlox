<?php 
class object {}
$CFG = new object();

$CFG->api_url = $_ENV["api_url"] ?: 'http://api/api.php';
$CFG->auth_login_url = $_ENV["auth_login_url"] ?: 'http://auth/login.php';
$CFG->auth_verify_token_url = $_ENV["auth_verify_token_url"] ?: 'http://auth/verify_token.php';

?>
