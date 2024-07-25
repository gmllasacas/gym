<?php
defined('BASEPATH') or exit('No direct script access allowed');

$config['default_url'] = 'sistema'; //Pagina default del sistema
$config['curl_timeout'] = '20000'; //Timeout para cURL request en microsegundos
$config['ajax_timeout'] = '30000'; //Timeout para AJAX request en microsegundos
$config['date_format_mysql_full'] = '%d-%m-%Y %l:%i:%s %p'; //Formato de fecha y hora para la funcion DATE_FORMAT
$config['date_format_mysql'] = '%d-%m-%Y'; //Formato de fecha para la funcion DATE_FORMAT
$config['contact_email'] = 'contacto@tahuaclub.com';
$config['system_email'] = 'sistema@tahuaclub.com';
$config['system_username'] = 'Tahua Fitness Club';
$config['user_logging_waiting_time'] = 15; //minutos
$config['user_logging_attempts'] = 3; //intentos
$config['user_recovery_token_time'] = 180; //minutos
$config['recaptcha_html_web_secret'] = '6Ld4Tw0qAAAAANrRPE8LyYcAFmkGOxL2hKlcSm2O';
$config['recaptcha_html_server_secret'] = '6Ld4Tw0qAAAAAMMSQjjx1S5LifkYTDj1h2_Q-9k8';
$config['recaptcha_system_web_secret'] = '6LdtZg0qAAAAAGkiiyg5bSZATbfpGTiMBqwWJjpm';
$config['recaptcha_system_server_secret'] = '6LdtZg0qAAAAADvtMM2aIvfzlqWPfZQRvAYZm0Va';
