<?php
defined('BASEPATH') or exit('No direct script access allowed');

$config['default_url'] = 'sistema'; //Pagina default del sistema
$config['curl_timeout'] = '20000'; //Timeout para cURL request en microsegundos
$config['ajax_timeout'] = '30000'; //Timeout para AJAX request en microsegundos
$config['date_format_mysql_full'] = '%d-%m-%Y %l:%i:%s %p'; //Formato de fecha y hora para la funcion DATE_FORMAT
$config['date_format_mysql'] = '%d-%m-%Y'; //Formato de fecha para la funcion DATE_FORMAT
$config['contact_email'] = 'contacto@tahuaclub.com';
$config['system_email'] = 'sistema@tahuaclub.com';
$config['system_username'] = 'TAHUA FITNESS CLUB';
$config['system_ruc'] = '20610902961';
$config['user_logging_waiting_time'] = 15; //minutos
$config['user_logging_attempts'] = 3; //intentos
$config['user_recovery_token_time'] = 180; //minutos
$config['document_consult_url'] = 'https://dniruc.apisperu.com/api/v1/';
$config['document_consult_token'] = 'eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJlbWFpbCI6Imd6LnVubXNtQGdtYWlsLmNvbSJ9.QjOf0kcZYYBdUcrHtNrU5ekFS1c9scCJD2FFQxXSvG8';
$config['user_recovery_token_time'] = 180; //minutos
$config['recaptcha_html_web_secret'] = getenv('RECAPTCHA_HTML_WEB_SECRET');
$config['recaptcha_html_server_secret'] = getenv('RECAPTCHA_HTML_SERVER_SECRET');
$config['recaptcha_system_web_secret'] = getenv('RECAPTCHA_SYSTEM_WEB_SECRET');
$config['recaptcha_system_server_secret'] = getenv('RECAPTCHA_SYSTEM_SERVER_SECRET');
