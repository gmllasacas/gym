<!DOCTYPE html>
<!--[if IE 9]>
<html class="ie9 no-focus">
<![endif]-->
<!--[if gt IE 9]>-->
<html class="no-focus">
<!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta name="description" content="<?php echo $this->configuracion['titulo'];?>">
        <meta name="author" content="">
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">

        <title><?php echo $this->configuracion['titulo'];?></title>

        <link rel="apple-touch-icon" sizes="180x180" href="<?php echo base_url();?>public/img/recursos/icon/apple-touch-icon.png">
        <link rel="icon" type="image/png" sizes="32x32" href="<?php echo base_url();?>public/img/recursos/icon/favicon-32x32.png">
        <link rel="icon" type="image/png" sizes="16x16" href="<?php echo base_url();?>public/img/recursos/icon/favicon-16x16.png">
        <link rel="manifest" href="<?php echo base_url();?>public/img/recursos/icon/site.webmanifest">
        <link rel="mask-icon" href="<?php echo base_url();?>public/img/recursos/icon/safari-pinned-tab.svg" color="#5bbad5">
        <link rel="shortcut icon" href="<?php echo base_url();?>public/img/recursos/icon/favicon.ico">
        <meta name="msapplication-TileColor" content="#da532c">
        <meta name="msapplication-config" content="<?php echo base_url();?>public/img/recursos/icon/browserconfig.xml">
        <meta name="theme-color" content="#ffffff">
        
    </head>
    <body>
        <main id="main-container" >
            <div class="content">

                <style>
                    body{
                        font-family: "Open Sans", "Helvetica Neue", Helvetica, Arial, sans-serif;
                        font-size: 16px;
                        color: black;
                        background-color: #f5f5f5;
                    }
                    .table {
                        padding: 2px;
                        font-size: 16px;
                        width: 100%;
                        border-spacing: 0px;
                           border-collapse: collapse;
                    }
                    .table > thead:first-child > tr:first-child > th {
                        vertical-align: middle;
                    }
                    .table>tbody>tr>td, .table>tbody>tr>th, .table>tfoot>tr>td, .table>tfoot>tr>th, .table>thead>tr>td, .table>thead>tr>th {
                        padding: 4px 6px;
                        line-height: 1.42857143;
                        vertical-align: top;
                        border-top: none;
                    }
                    .table-bordered>tbody>tr>td {
                        border: none;
                    }
                    /*.table-bordered>thead>tr>th {
                        
                    }*/
                    .text-left{
                        text-align: left;
                    }
                    .text-right{
                        text-align: right;
                    }
                    .text-center{
                        text-align: center;
                    }
                    .table>tfoot {
                        border-top: 1px solid black;
                    }
                </style>

                <div class="row">
                    <div class="text-right" style="width:100%;display:inline-block;margin-bottom:8px;">
                        <span style="font-size: 12px;">USUARIO DE IMPRESIÓN: <?php echo $this->session->userdata('username'); ?>    FECHA DE IMPRESIÓN: <?php echo date('Y-m-d H:i:s'); ?></span>
                    </div>
                    <div style="width:64%;display:inline-block;">
                    </div>
                    <div style="width:35%;display:inline-block;">
                        <table class="table table-bordered"  border="1">
                            <tbody>
                                <tr>
                                    <td class="text-center" style="font-size: 20px;"><br></td>
                                </tr>
                                <tr>
                                    <td class="text-center" style="font-size: 20px;"><b><?php echo($registro['tipo_comprobante_desc'] != '' ? $registro['tipo_comprobante_desc']['descripcion'].' ELECTRÓNICA': ''); ?></b></td>
                                </tr>
                                <tr>
                                    <td class="text-center" style="font-size: 20px;"><?php echo($registro['comprobante'] != '' ? $registro['comprobante'] : ''); ?></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width:100%;">
                        <table class="table">
                            <tbody>
                                <tr>
                                    <td class="text-left" width="10%">CLIENTE:</td>
                                    <td class="text-left" width="60%"><?php echo $registro['cliente_datos']['nombre_o_razon_social']; ?></td>
                                    <td class="text-left" width="10%">FECHA:</td>
                                    <td class="text-left" width="20%"><?php echo $registro['fecha']; ?></td>
                                </tr>
                                <tr>
                                    <td class="text-left" width="10%">DIRECCIÓN:</td>
                                    <td class="text-left" width="60%"><?php echo $registro['cliente_datos']['direccion_completa']; ?></td>
                                    <td class="text-left" width="10%"></td>
                                    <td class="text-left" width="20%"></td>
                                </tr>
                                <tr>
                                    <td class="text-left" width="10%"><?php echo $registro['cliente_datos']['tipo_documento_desc']['descripcion']; ?>:</td>
                                    <td class="text-left" width="60%"><?php echo $registro['cliente_datos']['documento']; ?></td>
                                    <td class="text-left" width="10%"></td>
                                    <td class="text-left" width="20%"></td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div style="width:100%;">
                        <table class="table table-bordered" border="1">
                            <thead>
                                <tr>
                                    <th class="text-center" width="10%">CANTIDAD</th>
                                    <th class="text-center" width="10%">UNID.</th>
                                    <th class="text-center" width="10%">CÓDIGO</th>
                                    <th class="text-center" width="40%">DESCRIPCIÓN</th>
                                    <th class="text-center" width="15%">P. VENTA</th>
                                    <th class="text-center" width="15%">TOTAL</th>
                                </tr>
                            </thead>
                                <tbody>
                                    <?php foreach ($registro['detalles'] as $item) :?>
                                        <tr>
                                            <td class="text-right"><?php echo $item['cantidad']; ?></td>
                                            <td class="text-center">UNID.</td>
                                            <td class="text-center"><?php echo $item['codigo']; ?></td>
                                            <td class="text-left"><?php echo $item['descripcion']; ?></td>
                                            <td class="text-right">S/ <?php echo $item['precio']; ?></td>
                                            <td class="text-right">S/ <?php echo $item['subtotal']; ?></td>
                                        </tr>
                                    <?php endforeach;?>
                                    <tr>
                                        <td colspan="6"><br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6"><br></td>
                                    </tr>
                                    <tr>
                                        <td colspan="6">SON: <?php echo $registro['letras']; ?></td>
                                    </tr>
                                <tbody>
                                <tfoot>
                                    <tr>
                                        <td colspan="4" rowspan="3" class="text-right"></td>
                                        <td class="text-right">SUBTOTAL</td>
                                        <td class="text-right">S/ <?php echo $registro['subtotal']; ?></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right">IGV</td>
                                        <td class="text-right">S/ <?php echo $registro['igv']; ?></td>
                                    </tr>
                                    <tr>
                                        <td class="text-right">TOTAL</td>
                                        <td class="text-right">S/ <?php echo $registro['total']; ?></td>
                                    </tr>
                                </tfoot>
                        </table>
                        <br>
                        <span style="font-size: 14px;">REPRESENTACIÓN IMPRESA DE LA <?php echo($registro['tipo_comprobante_desc'] != '' ? $registro['tipo_comprobante_desc']['descripcion'].' ELECTRÓNICA': ''); ?></span>
                    </div>
                </div>
            </div>
        </main>

        <script type="text/javascript">
            window.onafterprint = window.close;
            window.print();
        </script>

    </body>
</html>