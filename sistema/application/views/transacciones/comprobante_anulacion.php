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
    <?php
    $comprobante = explode("-", $registro['comprobante']);
    $electronica = ' ELECTRÓNICA';
    if ($registro['tipo_comprobante'] == 99) {
        $electronica = '';
    }
    ?>
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
                        font-family: Helvetica, Arial, sans-serif;
                        font-size: 11px;
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
                                <td class="text-center"><b>COMUNICACIÓN DE BAJA</b></td>
                            </tr>
                            <tr>
                                <td class="text-center"><b>NÚMERO : <?php echo spd($registro['sunat']['numero'], 8, '0'); ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-center"><b>NÚMERO DE TICKET : <?php echo $registro['sunat']['sunat_ticket_numero']; ?></b></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>FECHA DE EMISIÓN:</b> <?php echo $registro['anulacion']['fecha']; ?></td>
                            </tr>
                            <tr>
                                <td class="text-left"><b>FECHA DE GENERACIÓN:</b> <?php echo $registro['anulacion']['fecha']; ?></td>
                            </tr>
                        </tbody>
                    </table>
                    <div style="width:100%;">
                        <hr>
                        <table>
                            <tbody>
                                <tr>
                                    <th class="text-left">FECHA: <?php echo $registro['fecha']; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-left">TIPO DE DOCUMENTO: <?php echo $registro['tipo_comprobante_desc']['descripcion'] . $electronica; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-left">SERIE: <?php echo $comprobante[0]; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-left">NUMERO: <?php echo $comprobante[1]; ?></th>
                                </tr>
                                <tr>
                                    <th class="text-left">MOTIVO: <?php echo $registro['anulacion']['motivo']; ?></th>
                                </tr>
                            </tfoot>
                        </table>
                        <hr>
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