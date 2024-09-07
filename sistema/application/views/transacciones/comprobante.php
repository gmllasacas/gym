<!DOCTYPE html>
<!--[if IE 9]>
<html class="ie9 no-focus">
<![endif]-->
<!--[if gt IE 9]>-->
<html class="no-focus">
<!--<![endif]-->
    <head>
        <meta charset="utf-8">
        <meta name="robots" content="noindex, nofollow">
        <meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1.0">
        <title><?php echo $this->configuracion['titulo'];?></title>
        
    </head>
    <body>
        <main>
            <div class="content">
                <style>
                    @font-face {
                        font-family: 'Fake Receipt';
                        src: url('../../../sistema/public/fonts/FakeReceipt-Regular.woff2') format('woff2'),
                            url('../../../sistema/public/fonts/FakeReceipt-Regular.woff') format('woff');
                        font-weight: normal;
                        font-style: normal;
                        font-display: swap;
                    }

                    .content {
                        width: 20%;
                        margin: 0 auto;
                    }
                    body{
                        font-family: "Fake Receipt", Helvetica, Arial, sans-serif;
                        font-size: 13px;
                        color: black;
                    }
                    .table {
                        padding: 2px;
                        font-size: 16px;
                        width: 100%;
                        border-spacing: 0px;
                        border-collapse: collapse;
                    }
                    .text-left{
                        text-align: left;
                    }
                    .text-right{
                        text-align: right;
                    }
                    .text-center{
                        text-align: center;
                    }
                    table {
                        width: 100%;
                    }
                    table tfoot {
                        border-top: 1px solid black;
                    }
                    @media print{
                        .content {
                            width: 100%;
                            margin: 0 auto;
                        } 
                    }

                </style>

                <div>
                    <table style="width:100%;">
                        <tbody>
                            <tr>
                                <td class="text-center"><b><?php echo $this->config->item('system_username'); ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-center"><?php echo $registro['sucursal']['direccion']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-center"><b>RUC <?php echo $this->config->item('system_ruc'); ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-center"><b><?php echo($registro['tipo_comprobante_desc'] != '' ? $registro['tipo_comprobante_desc']['descripcion'].' ELECTRÓNICA': ''); ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-center"><b><?php echo($registro['comprobante'] != '' ? $registro['comprobante'] : ''); ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>ADQUIRIENTE</b></td>
                            </tr>
                            <tr>
                                <td class="text-left"><?php echo $registro['cliente_datos']['tipo_documento_desc']['descripcion']; ?>: <?php echo $registro['cliente_datos']['documento']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-left"><?php echo $registro['cliente_datos']['nombre_o_razon_social']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>FECHA DE EMISIÓN:</b> <?php echo $registro['fecha']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>FECHA DE VENC:</b> <?php echo $registro['fecha']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>MONEDA:</b> SOLES</td>
                            </tr>
                            <tr>                                  
                               <td class="text-left"><b>IGV: </b> <?php echo number_format($registro['igv_percent'], 2, '.', ''); ?>%</td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="width:100%;">
                        <hr>
                        <table>
                            <thead>
                                <tr>
                                    <th class="text-left" width="50%">[CANT.] DESCRIPCIÓN</th>
                                    <th class="text-right" width="20%">P/U</th>
                                    <th class="text-right" width="30%">TOTAL</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($registro['detalles'] as $item) :
                                    $descripcion = tipo_producto($item)['descripcionComprobante'];
                                    ?>
                                    <tr>
                                        <td class="text-left"><?php echo $descripcion; ?></td>
                                        <td class="text-right"><?php echo $item['precio']; ?></td>
                                        <td class="text-right"><?php echo $item['subtotal']; ?></td>
                                    </tr>
                                <?php endforeach;?>
                            </tbody>
                        </table>
                        <hr>
                        <table>
                            <tfoot>
                                <tr>
                                    <th class="text-right" colspan="2">TOTAL SIN DESC.</th>
                                    <th class="text-right">S/ <?php echo $registro['total_inicial']; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-right" colspan="2">DESCUENTO</th>
                                    <th class="text-right">S/ <?php echo $registro['descuento']; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-right" colspan="2">GRAVADA</th>
                                    <th class="text-right">S/ <?php echo $registro['subtotal']; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-right" colspan="2">IGV</th>
                                    <th class="text-right">S/ <?php echo $registro['igv']; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-right" colspan="2">TOTAL</th>
                                    <th class="text-right">S/ <?php echo $registro['total']; ?></th>
                                </tr>
                            </tfoot>
                        </table>
                        <hr>
                        <div style="width:100%;" class="text-center"><b>IMPORTE EN LETRAS:</b> <?php echo $registro['letras']; ?></div>
                        <hr>
                        <div style="width:100%;" class="text-center">
                            REPRESENTACIÓN IMPRESA DE LA <?php echo($registro['tipo_comprobante_desc'] != '' ? $registro['tipo_comprobante_desc']['descripcion'].' ELECTRÓNICA': ''); ?>, 
                            VISITA: <a href="www.nubefact.com/20610902961" target="_blank">www.nubefact.com/20610902961</a>
                            <img style="width: 50%;" src="<?php echo $registro['qr']; ?>" alt="QR Code" />
                        </div>
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