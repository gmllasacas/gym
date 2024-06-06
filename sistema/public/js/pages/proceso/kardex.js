
jQuery(function () {
    var date = new Date(); 
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1); 
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0); 
    jQuery('[name=fechainicio]').datepicker("setDate", firstDay);
    jQuery('[name=fechafin]').datepicker("setDate", lastDay);
    
    var busquedaform= '#busqueda-form';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var detalleregistro= '.detalleregistro';
    var tablelist= '#table-list';
    var tabledetalles= '#table-detalles';

    var listdt = jQuery(tablelist).DataTable({
        ajax: {
            type: 'POST',
            url: base_url+'generico/busqueda/',
            timeout: ajax_timeout,
            data: function ( d ) {
                return jQuery(busquedaform).serialize();
            },
            dataSrc: function (response) {
                switch (response.status) {
                    case 200:
                        for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                            switch (response.data[i]['tipo_kardex']) {
                                case '1'://ingreso
                                    response.data[i]['tipodescstr']='<label class="label label-success">'+response.data[i]['tipodesc']+'</label>';
                                    response.data[i]['cantidadstr'] = '<span class="text-success">'+response.data[i]['cantidad']+' '+response.data[i]['abreviatura']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info btn-ingreso" data-toggle="tooltip" data-placement="top" title="Detalles de ingreso" data-id="'+response.data[i]['referencia']+'" data-table="proceso_ingreso">'+
                                                                        '        <i class="si si-login"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '3'://ingreso anulado
                                    response.data[i]['tipodescstr']='<label class="label label-warning">'+response.data[i]['tipodesc']+'</label>';
                                    response.data[i]['cantidadstr'] = '<span class="text-warning">'+response.data[i]['cantidad']+' '+response.data[i]['abreviatura']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info btn-ingreso" data-toggle="tooltip" data-placement="top" title="Detalles de ingreso anulada" data-id="'+response.data[i]['referencia']+'" data-table="proceso_ingreso">'+
                                                                        '        <i class="si si-login"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '2'://venta
                                    response.data[i]['tipodescstr']='<label class="label label-info">'+response.data[i]['tipodesc']+'</label>';
                                    response.data[i]['cantidadstr'] = '<span class="text-info">'+response.data[i]['cantidad']+' '+response.data[i]['abreviatura']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info btn-venta" data-toggle="tooltip" data-placement="top" title="Detalles de venta" data-id="'+response.data[i]['referencia']+'" data-table="proceso_venta">'+
                                                                        '        <i class="si si-basket"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '4'://venta anulada
                                    response.data[i]['tipodescstr']='<label class="label label-danger">'+response.data[i]['tipodesc']+'</label>';
                                    response.data[i]['cantidadstr'] = '<span class="text-danger">'+response.data[i]['cantidad']+' '+response.data[i]['abreviatura']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info btn-venta" data-toggle="tooltip" data-placement="top" title="Detalles de venta anulada" data-id="'+response.data[i]['referencia']+'" data-table="proceso_venta">'+
                                                                        '        <i class="si si-basket"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                default:
                                    break;
                            }
                            if (response.data[i]['tipo_producto'] == 1) {
                                response.data[i]['saldostr'] = '<span class="text-info">'+response.data[i]['saldo']+' '+response.data[i]['abreviatura']+'</span>';
                            } else {
                                response.data[i]['saldostr'] = '-';
                            }
                            response.data[i]['productostr']=response.data[i]['codigo']+' - '+response.data[i]['descripcion'];
                            response.data[i]['preciostr']='S/ '+response.data[i]['precio'];
                            response.data[i]['subtotalstr']='S/ '+response.data[i]['subtotal'];
                            response.data[i]['estadostr']='<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                        }
                        return response.data;
                        break;
                    case 500:
                        notifytemplate('fa fa-times', response.message, 'danger');
                        return [];
                        break;
                    default:
                        return [];
                        break;
                }
            }
        },
        columns: [
            { data: 'fecha' },
            { data: 'tipodescstr' },
            { data: 'productostr' },
            { data: 'cantidadstr' },
            { data: 'tipodesc' },
            { data: 'preciostr' },
            { data: 'subtotalstr' },
            { data: 'saldostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            {	
                targets: [4],
                visible: false, 
            },
            {
                targets: [1,3,5,6,-2,-1],
                className: 'dt-body-center'
            },
            {
                targets: [4],
                className: 'notexport'
            },
        ],
        buttons: true,
        order: [[ 0, "desc" ]],
        bAutoWidth: false,
        initComplete: function () {
            selectores();
        },
    });	
    var buttons = new jQuery.fn.dataTable.Buttons(listdt, {
        buttons: [
            {
                extend: 'copy',
                text: '<i class="fa fa-copy push-5-r"></i> Copiar',
                exportOptions: {
                    columns: ':not(:last-child):not(.notexport)',
                }
            },
            {
                extend: 'excel',
                text: '<i class="fa fa-file-excel-o push-5-r"></i> Exportar a Excel',
                title: reportetext,
                filename: reportetext,
                exportOptions: {
                    columns: ':not(:last-child):not(.notexport)',
                }
            },
            {
                extend: 'print',
                text: '<i class="si si-printer push-5-r"></i> Imprimir',
                title: reportetext,
                exportOptions: {
                    columns: ':not(:last-child):not(.notexport)',
                }
            },
        ],
    }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(1)'));

    function selectores() { 
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns([4]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por tipo" data-allow-clear="true"><option></option></select>')
                .appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)'))
                .on( 'change', function () {
                    var val = jQuery.fn.dataTable.util.escapeRegex(
                        jQuery(this).val()
                    ); 
                    column
                        .search( val ? '^'+val+'$' : '', true, false )
                        .draw();
                } );
            column.data().unique().sort().each( function ( d, j ) {
                select.append( '<option value="'+d+'">'+d+'</option>' )
            } );
        } );
        jQuery('.js-select2-filtro').select2();
    };

    var busquedavalidate = jQuery(busquedaform).validate({
        submitHandler: function(form) {
            listdt.ajax.reload(selectores);
        }
    });

    /*jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload(selectores);
    });*/

    var ventamodal= '#venta-modal';
    var ventaform= '#venta-form';
    var ingresomodal= '#ingreso-modal';
    var ingresoform= '#ingreso-form';
    var btnventa= '.btn-venta';
    var btningreso= '.btn-ingreso';
    var tabledetalles= '#table-detalles';
    
    jQuery('body').on('click', btnventa, function() {
        var elemento = jQuery(this);		
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/detalleregistro",
            data: 'table=' + elemento.data('table') + '&id=' + elemento.data('id'),
            dataType: 'json',
            timeout: 60000,
            success: function(response) {
                if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                }
                if(response.status=='200'){
                    reiniciarform(ventaform,'','','');

                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(ventaform+' [name='+index+']').length>0){
                            jQuery(ventaform+' [name='+index+']').val(item).trigger("change");
                        }
                    });
                    jQuery(ventaform+' [name="cliente"]').prop('disabled',true);
                    jQuery(ventaform+' [name="tipo_comprobante"]').prop('disabled',true);
                    jQuery(ventaform+' [name="comprobante"]').prop('disabled',true);
                    jQuery(ventaform+' [name="tipo_venta_pago"]').prop('disabled',true);
                    jQuery(ventaform+' [name="tipo_pago"]').prop('disabled',true);
                    jQuery(ventaform+' [name="fecha"]').prop('disabled',true);
                    jQuery(ventaform+' [name="datos_adicionales"]').prop('disabled',true);
                    jQuery(ventaform+' table tbody').html('');
                    var counter = 1;

                    jQuery.each(response.registro.detalles, function(index, item) {
                        var tr = '<tr>'+
                                        '<td class="text-center">'+
                                            counter+
                                        '</td>'+
                                        '<td>'+
                                            '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="number" value="'+item.cantidad+'" readonly><span class="input-group-addon">'+item.abreviatura+'</span></div></div></div>'+
                                        '</td>'+
                                        '<td class="text-center">'+
                                            item.codigo+
                                        '</td>'+
                                        '<td>'+
                                            item.descripcion+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                        '<td>'+
                                            '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="number" step="0.01" value="'+item.precio+'" readonly></div></div></div>'+
                                        '</td>'+									
                                        '<td>'+
                                            '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="text" value="'+item.subtotal+'" readonly></div>'+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                    '</tr>';
                        jQuery(ventaform+' table tbody').append(tr);
                        counter++;
                    });

                    jQuery(ventaform+' [name="subtotal"]').val(response.registro.subtotal);
                    jQuery(ventaform+' [name="igv"]').val(response.registro.igv);
                    jQuery(ventaform+' [name="total"]').val(response.registro.total);
                    jQuery(ventamodal).modal('toggle');
                }
            }
        });
                
    });
    
    jQuery('body').on('click', btningreso, function() {
        var elemento = jQuery(this);		
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/detalleregistro",
            data: 'table=' + elemento.data('table') + '&id=' + elemento.data('id'),
            dataType: 'json',
            timeout: 60000,
            success: function(response) {
                if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                }
                if(response.status=='200'){
                    reiniciarform(ingresoform,'','','');
                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(ingresoform+' [name='+index+']').length>0){
                            jQuery(ingresoform+' [name='+index+']').val(item).trigger("change");
                        }
                    });
                    jQuery(ingresoform+' [name="proveedor"]').prop('disabled',true);
                    jQuery(ingresoform+' [name="tipo_comprobante"]').prop('disabled',true);
                    jQuery(ingresoform+' [name="comprobante"]').prop('disabled',true);
                    jQuery(ingresoform+' [name="fecha"]').prop('disabled',true);
                    jQuery(ingresoform+' [name="datos_adicionales"]').prop('disabled',true);
                    jQuery(ingresoform+' table tbody').html('');
                    var counter = 1;

                    jQuery.each(response.registro.detalles, function(index, item) {
                        var tr = '<tr>'+
                                        '<td class="text-center">'+
                                            counter+
                                        '</td>'+
                                        '<td>'+
                                            '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+item.cantidad+'" readonly><span class="input-group-addon">'+item.abreviatura+'</span></div></div></div>'+
                                        '</td>'+
                                        '<td class="text-center">'+
                                            item.codigo+
                                        '</td>'+
                                        '<td>'+
                                            item.descripcion+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                        '<td>'+
                                            '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control" type="number" step="0.01" value="'+item.precio+'" readonly></div></div></div>'+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                        '<td>'+
                                            '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control input-subtotal" type="text" value="'+item.subtotal+'" readonly></div>'+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                    '</tr>';
                        jQuery(ingresoform+' table tbody').append(tr);
                        counter++;
                    });

                    //calcular_total();
                    jQuery(ingresomodal).modal('toggle');
                }
            }
        });
                
    });
});
