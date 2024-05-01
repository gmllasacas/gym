<?php
defined('BASEPATH') or exit('No direct script access allowed');

$active_group = 'default';
$query_builder = true;

#COMMON
//$db['default']['hostname'] = getenv('PROD_DB_HOSTNAME');
//$db['default']['username'] = getenv('PROD_USERNAME');
//$db['default']['password'] = getenv('PROD_PASSWORD');
//$db['default']['database'] = getenv('PROD_DATABASE');

$url = getenv('JAWSDB_URL');
$dbparts = parse_url($url);
$db['default']['hostname'] = $dbparts['host'];
$db['default']['username'] = $dbparts['user'];
$db['default']['password'] = $dbparts['pass'];
$db['default']['database'] = ltrim($dbparts['path'], '/');

#GENERAL
$db['default']['dsn'] = '';
$db['default']['dbdriver'] = 'mysqli';
$db['default']['dbprefix'] = '';
$db['default']['pconnect'] = false;
$db['default']['db_debug'] = true;
$db['default']['cache_on'] = false;
$db['default']['cachedir'] = '';
$db['default']['char_set'] = 'utf8';
$db['default']['dbcollat'] = 'utf8_general_ci';
$db['default']['swap_pre'] = '';
$db['default']['encrypt'] = false;
$db['default']['compress'] = false;
$db['default']['stricton'] = false;
$db['default']['failover'] = array();
$db['default']['save_queries'] = true;
