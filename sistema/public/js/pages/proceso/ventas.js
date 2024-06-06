
jQuery(function () {
    var date = new Date(); 
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1); 
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0); 
    switch (perfil) {
        case '1':
        case '2':
            jQuery('[name=fechainicio]').datepicker("setDate", firstDay);
            jQuery('[name=fechafin]').datepicker("setDate", lastDay);
            break;
        case '4':
        default:
            jQuery('[name=fechainicio]').datepicker("setDate", date);
            jQuery('[name=fechafin]').datepicker("setDate", date);
            break;
    }
    
    var busquedaform= '#busqueda-form';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var anulacionform= '#anulacion-form';
    var nuevoregistro= '.nuevoregistro';
    var detalleregistro= '.detalleregistro';
    var anularregistro= '.anularregistro';
    var tablelist= '#table-list';
    var tabledetalles= '#table-detalles';

    function calcular_total() {
        var subtotales = jQuery(tabledetalles+' .input-subtotal');
        var igv_percent = parseFloat(jQuery(registroform+' [name="igv"]').data('igv'));
        var igv = 0;
        var total = 0;
        
        /**Total venta */
            jQuery.each(subtotales, function(index, item) {
                var subtotal = parseFloat(jQuery(item).val());
                total = total + subtotal; 
            });
            
            subtotal = total*(100/(igv_percent+100));
            subtotal = (isNaN(subtotal) ? 0 : subtotal.toFixed(2));
            jQuery(registroform+' [name="subtotal"]').val(subtotal);

            igv = total-subtotal;
            igv = (isNaN(igv) ? 0 : igv.toFixed(2));
            jQuery(registroform+' [name="igv"]').val(igv);

            total = (isNaN(total) ? 0 : total.toFixed(2));
            jQuery(registroform+' [name="total"]').val(total);
        /**Total venta */
    }

    jQuery('body').on('click', nuevoregistro, function() {
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_producto_y_clientes',
                estado: '1',
            },
            dataType: 'json',
            timeout: 60000,
            success: function(response) {
                if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                }
                if(response.status=='200'){
                    reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar venta');
                    jQuery(anulacionform).hide();
                    jQuery(registromodal+' .btn-print').hide();
                    jQuery(registroform+' [name="id"]').val(null);
                    jQuery(registroform+' [name="estado"]').val(1);
                    jQuery(registroform+' [name="counter"]').val(0);
                    jQuery(tabledetalles+' tbody').html('');
                    var productos_selector = '<option value=""></option>';
                    var servicios = '<optgroup label="Servicios">';
                    var productos = '<optgroup label="Productos">';
                    jQuery.each(response.data.productos, function(index, item) {
                        var text = '';
                        var disabled = '';
                        switch (item.tipo) {
                            case '1':
                                if(item.existencias>0) {
                                    text = item.existencias+' '+item.abreviatura;
                                } else { 
                                    text = 'Sin existencias';
                                    disabled = 'disabled';
                                }
                                productos += '<option value="'+item.id+'" '+disabled+'>'+item.codigo+' - '+item.descripcion+' ('+text+')</option>';
                                break;
                            case '2':
                                servicios += '<option value="'+item.id+'" '+disabled+'>'+item.codigo+' - '+item.descripcion+' ('+item.duracion+' '+item.duracion_unidad_desc+')</option>';
                            default:
                                break;
                        }
                    });
                    ;
                    productos_selector += servicios + '</optgroup>' + productos + '</optgroup>';
                    jQuery(registroform+' [name="producto_sel"]').html(productos_selector).trigger('change');

                    var clientes = '<option value=""></option>';
                    jQuery.each(response.data.clientes, function(index, item) {
                        var disabled = (parseFloat(item.credito)<= 0 ? '' : 'disabled');
                        clientes += '<option value="'+item.id+'">'+item.documento+' - '+item.nombre_o_razon_social+'</option>';
                    });
                    jQuery(registroform+' [name="cliente"]').html(clientes).trigger('change');

                    jQuery(registroform+' button[type="submit"]').show();
                    jQuery(registroform+' .producto-div').show();
                    jQuery(registroform+' [name="cliente"]').prop('disabled',false);
                    jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',false);
                    jQuery(registroform+' [name="comprobante"]').prop('disabled',false);
                    jQuery(registroform+' [name="tipo_pago"]').prop('disabled',false);
                    jQuery(registroform+' [name="datos_adicionales"]').prop('disabled',false);
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });

    jQuery('body').on('click', detalleregistro, function() {
        var elemento = jQuery(this);
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_producto_y_clientes',
                estado: '^5',
            },
            dataType: 'json',
            timeout: 60000,
            success: function(responseouter) {
                if(responseouter.status=='500'){
                    notifytemplate('fa fa-times', responseouter.message, 'danger');
                }
                if(responseouter.status=='200'){
                    jQuery.ajax({
                        type: "POST",
                        url: base_url + "generico/detalleregistro",
                        data: {
                            table: elemento.data('table'),
                            id:  elemento.data('id'),
                            exception: false,
                        },
                        dataType: 'json',
                        timeout: 60000,
                        success: function(response) {
                            if(response.status=='500'){
                                notifytemplate('fa fa-times', response.message, 'danger');
                            }
                            if(response.status=='200'){
                                reiniciarform(registroform,registrovalidate,'','');
                                jQuery(registromodal+' .btn-print').prop("href", base_url+'transaccion/comprobanteventa/'+elemento.data('id'));
                                jQuery(registromodal+' .btn-print').show();
                                var clientes = '<option value=""></option>';
                                jQuery.each(responseouter.data.clientes, function(index, item) {
                                    var disabled = (item.credito> 0 ? 'disabled' : '');
                                    clientes += '<option value="'+item.id+'" '+disabled+'>'+item.documento+' - '+item.nombre_o_razon_social+' (Crédito: S/ '+item.credito+')</option>';
                                });
                                jQuery(registroform+' [name="cliente"]').html(clientes).trigger('change');

                                jQuery.each(response.registro, function(index, item) {
                                    if(jQuery(registroform+' [name='+index+']').length>0){
                                        jQuery(registroform+' [name='+index+']').val(item).trigger("change");
                                    }
                                });
                                jQuery(registroform+' [name="cliente"]').prop('disabled',true);
                                jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',true);
                                jQuery(registroform+' [name="comprobante"]').prop('disabled',true);
                                jQuery(registroform+' [name="tipo_pago"]').prop('disabled',true);
                                jQuery(registroform+' [name="datos_adicionales"]').prop('disabled',true);
                                jQuery(tabledetalles+' tbody').html('');
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
                                    jQuery(tabledetalles+' tbody').append(tr);
                                    counter++;
                                });

                                jQuery(registroform+' [name="subtotal"]').val(response.registro.subtotal);
                                jQuery(registroform+' [name="igv"]').val(response.registro.igv);
                                jQuery(registroform+' [name="total"]').val(response.registro.total);
                                jQuery(registroform+' button[type="submit"]').hide();
                                jQuery(registroform+' .producto-div').hide();

                                if(response.registro.anulacion && response.registro.anulacion.motivo){
                                    jQuery(anulacionform+' [name=usuario]').val(response.registro.anulacion.usuario.username);
                                    jQuery(anulacionform+' [name=fecha]').val(response.registro.anulacion.fecha);
                                    jQuery(anulacionform+' [name=motivo]').val(response.registro.anulacion.motivo);
                                    jQuery(anulacionform+' [name=motivo]').prop('readonly',true);
                                    jQuery(anulacionform+' .datos').show();
                                    jQuery(anulacionform).show();
                                }else{
                                    jQuery(anulacionform).hide();
                                }
                                jQuery(anulacionform+' .buttons').hide();

                                jQuery(registromodal).modal('toggle');
                            }
                        }
                    });
                }
            }
        });
    });

    jQuery('body').on('click', anularregistro, function() {
        var elemento = jQuery(this);
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_producto_y_clientes',
                estado: '^5',
            },
            dataType: 'json',
            timeout: 60000,
            success: function(responseouter) {
                if(responseouter.status=='500'){
                    notifytemplate('fa fa-times', responseouter.message, 'danger');
                }
                if(responseouter.status=='200'){
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
                                reiniciarform(registroform,registrovalidate,'','');
                                jQuery(registromodal+' .btn-print').hide();
                                var clientes = '<option value=""></option>';
                                jQuery.each(responseouter.clientes, function(index, item) {
                                    var disabled = (item.credito> 0 ? 'disabled' : '');
                                    clientes += '<option value="'+item.id+'" '+disabled+'>'+item.documento+' - '+item.nombre_o_razon_social+' (Crédito: S/ '+item.credito+')</option>';
                                });
                                jQuery(registroform+' [name="cliente"]').html(clientes).trigger('change');

                                jQuery.each(response.registro, function(index, item) {
                                    if(jQuery(registroform+' [name='+index+']').length>0){
                                        jQuery(registroform+' [name='+index+']').val(item).trigger("change");
                                    }
                                });
                                jQuery(registroform+' [name="cliente"]').prop('disabled',true);
                                jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',true);
                                jQuery(registroform+' [name="comprobante"]').prop('disabled',true);
                                jQuery(registroform+' [name="tipo_pago"]').prop('disabled',true);
                                jQuery(registroform+' [name="datos_adicionales"]').prop('disabled',true);
                                jQuery(tabledetalles+' tbody').html('');
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
                                    jQuery(tabledetalles+' tbody').append(tr);
                                    counter++;
                                });

                                jQuery(registroform+' [name="subtotal"]').val(response.registro.subtotal);
                                jQuery(registroform+' [name="igv"]').val(response.registro.igv);
                                jQuery(registroform+' [name="total"]').val(response.registro.total);
                                jQuery(registroform+' button[type="submit"]').hide();
                                jQuery(registroform+' .producto-div').hide();

                                reiniciarform(anulacionform,anulacionvalidate,'generico/actualizarregistro','<i class="fa fa-times push-5-r"></i> Anular');
                                jQuery(anulacionform+' [name=id]').val(response.registro.id);
                                jQuery(anulacionform+' [name=motivo]').prop('readonly',false);
                                jQuery(anulacionform+' .datos').hide();
                                jQuery(anulacionform+' .buttons').show();
                                jQuery(anulacionform).show();

                                jQuery(registromodal).modal('toggle');
                            }
                        }
                    });
                }
            }
        });
    });

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
                            switch (response.data[i]['estado']) {
                                case '3':
                                    response.data[i]['totalstr'] = '<span class="text-danger">S/ '+response.data[i]['total']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_venta">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '1':
                                    response.data[i]['totalstr'] = '<span class="text-success">S/ '+response.data[i]['total']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_venta">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '    <a target="_new" class="btn btn-xs btn-success" href="'+base_url+'transaccion/comprobanteventa/'+response.data[i]['id']+'" data-toggle="tooltip" data-placement="top" title="Comprobante de venta">'+
                                                                        '        <i class="si si-printer"></i>'+
                                                                        '    </a>';
                                    switch (perfil) {
                                        case '1':
                                        case '2':
                                            response.data[i]['acciones']+='<button class="btn btn-xs btn-danger anularregistro" data-toggle="tooltip" data-placement="top" title="Anular" data-id="' + response.data[i]['id'] + '" data-table="proceso_venta">' +
                                                                                '        <i class="fa fa-times"></i>'+
                                                                                '    </button>';
                                            break;
                                        default:
                                            response.data[i]['acciones']+='';
                                            break;
                                    }
                                    response.data[i]['acciones']+='</div>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
                            response.data[i]['totalsum']=response.data[i]['totalsum'];
                            response.data[i]['cantidadsum']=response.data[i]['cantidad'];
                            response.data[i]['cantidadstr'] = response.data[i]['cantidad']+' unid. ('+response.data[i]['cantidad_docenas']+')';
                            response.data[i]['estadostr']='<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                            response.data[i]['comprobantestr']=response.data[i]['tipo_comprobantedesc']+' - '+response.data[i]['comprobante'];
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
            { data: 'clientedesc' },
            { data: 'totalstr' },
            { data: 'totalsum' },
            { data: 'tipodesc' },
            { data: 'comprobantestr' },
            { data: 'username' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            {
                targets: [-2,-1],
                className: 'dt-body-center'
            },
            {
                targets: [3],
                className: 'notexport'
            },
            {	
                visible: false, 
                targets: [3]
            },
        ],
        buttons: true,
        order: [[ 0, "desc" ]],
        bAutoWidth: false,
        initComplete: function () {
            selectores();
        },
        "footerCallback": function ( row, data, start, end, display ) {
            var api = this.api(), data;

            var intVal = function ( i ) {
                return typeof i === 'string' ?
                    i.replace(/[\$,]/g, '')*1 :
                    typeof i === 'number' ?
                        i : 0;
            };

            var total = 0;
            if (api.column(3, {search:'applied'}).data().length>0) {
                    total = api
                        .column( 3, {search:'applied'} )
                        .data()
                        .reduce( function (a, b) {
                            return intVal(a) + intVal(b);
                        } );
            } else {
                total = 0;
            }
                
            $( api.column( 2 ).footer() ).html('<span class="text-info">S/ '+parseFloat(total).toFixed(2)+'</span>');
        }
    });	
    var buttons = new jQuery.fn.dataTable.Buttons(listdt, {
        buttons: [
            {
                extend: 'copy',
                footer: true,
                text: '<i class="fa fa-copy push-5-r"></i> Copiar',
                exportOptions: {
                    columns: ':not(:last-child):not(.notexport)',
                }
            },
            {
                extend: 'excel',
                footer: true,
                text: '<i class="fa fa-file-excel-o push-5-r"></i> Exportar a Excel',
                title: reportetext,
                filename: reportetext,
                exportOptions: {
                    columns: ':not(:last-child):not(.notexport)',
                }
            },
            {
                extend: 'print',
                footer: true,
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
        listdt.columns([1]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por cliente" data-allow-clear="true"><option></option></select>')
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

    jQuery('body').on('click', '.quitarfila', function() {
        $(this).tooltip('hide');
        $(this).closest("tr").remove();
        calcular_total();
    });

    jQuery('body').on('change', tabledetalles+' .input-cantidad', function() {
        var cantidad = parseFloat($(this).closest('tr').find('.input-cantidad').val());
        if(cantidad == 0){ 
            $(this).closest("tr").remove(); 
            calcular_total();
        }else{
            var max = parseFloat($(this).closest('tr').find('.input-cantidad').attr('max'));
            cantidad = (cantidad < 0 ? 1 : cantidad);
            cantidad = (cantidad >= max ? max : cantidad);
            $(this).closest('tr').find('.input-cantidad').val(cantidad);
            if($(this).valid()) $(this).closest('.form-group').removeClass('has-error');
            
            var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
            var subtotal = (precio)*cantidad;
            subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
            $(this).closest('tr').find('.input-subtotal').val(subtotal).trigger('change');
            calcular_total();
        }
    });

    jQuery('body').on('change', tabledetalles+' .input-precio', function() {
        var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
        precio = (precio < 0 ? 0.00 : precio.toFixed(2));
        $(this).closest('tr').find('.input-precio').val(precio);
        
        var cantidad = parseFloat($(this).closest('tr').find('.input-cantidad').val());
        var subtotal = (precio)*cantidad;
        subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
        $(this).closest('tr').find('.input-subtotal').val(subtotal);
        calcular_total();
    });

    /*jQuery('body').on('change', registroform+' [name="tipo_comprobante"]', function() {
        if($(this).val()){
            jQuery(registroform+' [name="comprobante"]').removeClass('required');
            jQuery(registroform+' [name="comprobante"]').parents('.form-group').removeClass('has-error');
        }else{
            jQuery(registroform+' [name="comprobante"]').addClass('required');
        }
    });*/

    jQuery('body').on('change', registroform+' [name="tipo_venta_pago"]', function() {
        if($(this).val()=='2'){
            jQuery(registroform+' .tipo_pago_div').show();
            jQuery(registroform+' [name="tipo_pago"]').addClass('required');
        }else{
            jQuery(registroform+' .tipo_pago_div').hide();
            jQuery(registroform+' [name="tipo_pago"]').removeClass('required');
            jQuery(registroform+' [name="tipo_pago"]').parents('.form-group').removeClass('has-error');
        }
    });

    jQuery('body').on('click', registroform + ' .btn-producto', function() {
        var elemento = jQuery(this);
        var producto_sel = jQuery(registroform+' [name="producto_sel"]').val();
        var counter = jQuery(registroform+' [name="counter"]').val();
        if(producto_sel){
            var productos = jQuery(tabledetalles+' .input-id');
            var producto_tipos = jQuery(tabledetalles+' .input-tipo');
            var flag = true;

            jQuery.each(productos, function(index, item) {
                if(jQuery(item).val() == producto_sel) {
                    flag = false;
                    message = 'El producto ya se encuentra agregado';
                }
            });

            jQuery.each(producto_tipos, function(index, item) {
                if(jQuery(item).val() == 2) { //servicio
                    flag = false;
                    message = 'Solo se puede agregar un servicio por venta';
                }
            });

            if(flag){
                jQuery.ajax({
                    type: "POST",
                    url: base_url + "generico/detalleregistro",
                    data: 'table=proceso_producto&id=' + producto_sel,
                    dataType: 'json',
                    timeout: 60000,
                    success: function(response) {
                        if(response.status=='500'){
                            notifytemplate('fa fa-times', response.message, 'danger');
                        }
                        if(response.status=='200'){
                            var tr = '<tr>'+
                                            '<td>'+
                                                '<input type="hidden" class="input-id" name="producto['+counter+'][id]" value="'+response.registro.id+'">'+
                                                '<input type="hidden" name="producto['+counter+'][productodesc]" value="'+response.registro.codigo+' - '+response.registro.descripcion+'">'+
                                                '<input type="hidden" class="input-tipo" name="producto['+counter+'][tipo]" value="'+response.registro.tipo+'">'+
                                           '</td>'+
                                            '<td>';
                            if (response.registro['tipo'] == 1) {
                                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" step="1" min="0" max="'+response.registro.existencias+'" name="producto['+counter+'][cantidad]" value=""><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                            } else {
                                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                            }
                                    tr += '</td>'+
                                            '<td>'+
                                                response.registro.codigo+
                                            '</td>'+
                                            '<td>'+
                                                response.registro.descripcion+
                                            '</td>'+
                                            '<td>';
                            if (response.registro['tipo'] == 1) {
                                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+response.registro.existencias+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                            } else {
                                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+response.registro.duracion+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.duracion_unidad_desc+'</span></div></div></div>';
                            }
                                    tr += '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+response.registro.precio+'"></div></div></div>'+
                                            '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="0.00" readonly></div></div></div>'+
                                            '</td>'+
                                            '<td>'+
                                                '<a class="btn btn-xs btn-danger quitarfila" data-toggle="tooltip" data-placement="top" title="Eliminar detalle"><i class="fa fa-times"></i></a>'+
                                            '</td>'+
                                        '</tr>';
                            jQuery(tabledetalles+' tbody').append(tr);
                            jQuery(registroform+' [name="producto['+counter+'][precio]"]').trigger('change');
                            jQuery(registroform+' [name="counter"]').val( parseInt(counter)+1);
                            jQuery(registroform+' [name="producto_sel"]').val(null).trigger('change');
                        }
                    }
                });
            }else{
                notifytemplate('fa fa-times', message, 'danger');
            }
        }else{
            notifytemplate('fa fa-times', 'Seleccione un producto', 'danger');
        }
    });

    jQuery('body').on('click', registroform + ' .btn-incompleto', function() {
        jQuery(registroform+' [name="estado"]').val(4);
        jQuery(registroform).submit();
    });

    var registrovalidate = jQuery(registroform).validate({
        ignore: '',
        errorClass: 'help-block text-right animated fadeInDown',
        errorElement: 'div',
        errorPlacement: function(error, e) {
        },
        highlight: function(e) {
            var elem = jQuery(e);
            elem.closest('.form-group').removeClass('has-error').addClass('has-error');
        },
        success: function(e) {
            var elem = jQuery(e);
            elem.closest('.form-group').removeClass('has-error');
        },
        submitHandler: function(form) {
            var productos = jQuery(tabledetalles+' .input-id').length;
            if(productos>0){
                jQuery.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize(),
                    dataType: 'json',
                    timeout: 60000,
                    success: function(response) {
                        if(response.status=='500'){
                            notifytemplate('fa fa-times', response.message, 'danger');
                        }
                        if(response.status=='200'){
                            notifytemplate('fa fa-check', response.message, 'success');
                            listdt.ajax.reload(selectores);
                            jQuery(registromodal).modal('toggle');
                        }
                        if(response.status=='201'){
                            notifytemplate('fa fa-check', response.message, 'success');
                            listdt.ajax.reload(selectores);
                            jQuery(registromodal).modal('toggle');
                        }
                    }
                });
            }else{
                notifytemplate('fa fa-times', 'La venta no tiene detalles', 'danger');
            }
        }
    });

    var anulacionvalidate = jQuery(anulacionform).validate({
        submitHandler: function(form) {
            jQuery.ajax({
                url: form.action,
                type: form.method,
                data: $(form).serialize(),
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                    if(response.status=='500'){
                        notifytemplate('fa fa-times', response.message, 'danger');
                    }
                    if(response.status=='200'){
                        notifytemplate('fa fa-check', response.message, 'success');
                        listdt.ajax.reload();
                        jQuery(registromodal).modal('toggle');
                    }
                    if(response.status=='201'){
                        notifytemplate('fa fa-check', response.message, 'success');
                        listdt.ajax.reload();
                        jQuery(registromodal).modal('toggle');
                    }
                }
            });
        }
    });
});
