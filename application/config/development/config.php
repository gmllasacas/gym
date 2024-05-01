<?php
defined('BASEPATH') or exit('No direct script access allowed');

#COMMON
date_default_timezone_set('America/Lima');
$config['base_url'] = 'https://localhost/gym/';
$config['log_threshold'] = 1;
$config['sess_cookie_name'] = 'ci_session_gym';
$config['csrf_protection'] = false;
$config['composer_autoload'] = false;

#LOG
$config['log_path'] = '';
$config['log_file_extension'] = '';
$config['log_file_permissions'] = 0644;
$config['log_date_format'] = 'Y-m-d H:i:s';

#SESSION
$config['sess_driver'] = 'files';
$config['sess_expiration'] = 3600000;
$config['sess_save_path'] = sys_get_temp_dir();
$config['sess_match_ip'] = false;
$config['sess_time_to_update'] = 7200;
$config['sess_regenerate_destroy'] = false;
$config['cookie_prefix'] = '';
$config['cookie_domain'] = '';
$config['cookie_path'] = '/';
$config['cookie_secure'] = false;
$config['cookie_httponly'] = false;

#CRSF
$config['csrf_token_name'] = 'csrf_token_name';
$config['csrf_cookie_name'] = 'csrf_cookie_name';
$config['csrf_expire'] = 7200;
$config['csrf_regenerate'] = true;
$config['csrf_exclude_uris'] = array();

#GENERAL
$config['index_page'] = '';
$config['allow_get_array'] = true;
$config['enable_query_strings'] = false;
$config['controller_trigger'] = 'c';
$config['function_trigger'] = 'm';
$config['directory_trigger'] = 'd';
$config['uri_protocol'] = 'REQUEST_URI';
$config['url_suffix'] = '';
$config['language'] = 'english';
$config['charset'] = 'UTF-8';
$config['enable_hooks'] = false;
$config['subclass_prefix'] = 'LOCAL_';
$config['permitted_uri_chars'] = 'a-z 0-9~%.:_\-';
$config['error_views_path'] = '';
$config['cache_path'] = '';
$config['cache_query_string'] = false;
$config['encryption_key'] = '';
$config['standardize_newlines'] = false;
$config['global_xss_filtering'] = false;
$config['compress_output'] = false;
$config['time_reference'] = 'local';
$config['rewrite_short_tags'] = false;
$config['proxy_ips'] = '';
