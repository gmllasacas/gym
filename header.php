<?php
$environment = getenv('CI_ENV');
$titulo = 'Tahua Fitness Club';
$description = 'En Tahua Fitness Club transformamos vidas a través del ejercicio y la realización de actividad física en nuestros gimnasios, promoviendo la vida saludable.';
$logo = './assets/images/logo.png';
$logo_coming = './assets/images/logo-footer.png';
$logo_footer = './assets/images/logo-footer.png';
$logo_meta = './assets/images/logo-meta.png';
$recaptcha_html_web_secret = '6Ld4Tw0qAAAAANrRPE8LyYcAFmkGOxL2hKlcSm2O';

if ($environment === 'production') {
    $url = getenv('PROD_HOSTNAME');
    $system = getenv('PROD_SYSTEM_HOSTNAME');
} else {
    $url = '#';
    $system = '/tahua/sistema';
}
$instagram = 'https://www.instagram.com/tahua_fitnessclub/';
$instagram_embed = 'https://www.instagram.com/tahua_fitnessclub/embed';
$facebook = 'https://www.facebook.com/profile.php?id=61558006179160';
$tiktok = 'https://www.tiktok.com/@tahua_fitnessclub';
$whatsapp = 'https://wa.me/51992171475';
?>

<!DOCTYPE html>
<html lang="es">

<head>
    <script async src="https://www.googletagmanager.com/gtag/js?id=G-1MC9VF0T5Z"></script>
    <script>
        window.dataLayer = window.dataLayer || [];
        function gtag(){dataLayer.push(arguments);}
        gtag('js', new Date());
        gtag('config', 'G-1MC9VF0T5Z');
    </script>

    <title><?php echo $titulo; ?></title>

    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=0">
    <meta charset="utf-8">
    <meta name="title" content="<?php echo $titulo; ?>" />
    <meta name="description" content="<?php echo $description; ?>">
    <meta property="og:type" content="website" />
    <meta property="og:url" content="<?php echo $url; ?>" />
    <meta property="og:title" content="<?php echo $titulo; ?>" />
    <meta property="og:description" content="<?php echo $description; ?>" />
    <meta property="og:image" content="<?php echo $logo_meta; ?>" />
    <meta property="twitter:card" content="summary_large_image" />
    <meta property="twitter:url" content="<?php echo $url; ?>" />
    <meta property="twitter:title" content="<?php echo $titulo; ?>" />
    <meta property="twitter:description" content="<?php echo $description; ?>" />
    <meta property="twitter:image" content="<?php echo $logo_meta; ?>" />
    <?php if ($environment !== 'production') { ?>
    <meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
    <meta http-equiv="Pragma" content="no-cache" />
    <meta http-equiv="Expires" content="0" />
    <?php } ?>

    <link rel="canonical" href="<?php echo $url; ?>"/>
    <link rel="apple-touch-icon" sizes="180x180" href="./assets/images/favicon/apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="./assets/images/favicon/favicon-32x32.png">
    <link rel="icon" type="image/png" sizes="16x16" href="./assets/images/favicon/favicon-16x16.png">
    <link rel="manifest" href="./assets/images/favicon/site.webmanifest">
    <link rel="mask-icon" href="./assets/images/favicon/safari-pinned-tab.svg" color="#5bbad5">
    <link rel="shortcut icon" href="./assets/images/favicon/favicon.ico">
    <meta name="msapplication-TileColor" content="#da532c">
    <meta name="msapplication-config" content="./assets/images/favicon/browserconfig.xml">
    <meta name="theme-color" content="#ffffff">

    <link href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap/4.6.2/css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" rel="stylesheet" type="text/css">
    <link href="./assets/css/owl.carousel.min.css" rel="stylesheet" type="text/css">
    <link href="./assets/css/aos.min.css" rel="stylesheet" type="text/css">
    <link href="./assets/css/style.css?v<?php echo rand();?>" rel="stylesheet" type="text/css">
    <script src="https://www.google.com/recaptcha/api.js?hl=es-419" async defer></script>
</head>