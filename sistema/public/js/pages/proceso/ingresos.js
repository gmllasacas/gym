
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
        var total = 0;
        jQuery.each(subtotales, function(index, item) {
            var subtotal = parseFloat(jQuery(item).val());
            total = total + subtotal; 
        });

        total = (isNaN(total) ? 0 : total.toFixed(2));
        jQuery(registroform+' [name="total"]').val(total);
    }

    jQuery('body').on('click', nuevoregistro, function() {
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_producto',
                tipos: [1],
                estado: '^5',
            },
            dataType: 'json',
            timeout: 60000,
            success: function(response) {
                if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                }
                if(response.status=='200'){
                    reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
                    jQuery(anulacionform).hide();
                    jQuery(registroform+' [name="id"]').val(null);
                    jQuery(registroform+' [name="estado"]').val(1);
                    jQuery(registroform+' [name="counter"]').val(0);
                    jQuery(tabledetalles+' tbody').html('');
                    var options = '<option value=""></option>';
                    var text = '';
                    jQuery.each(response.data, function(index, item) {
                        if(item.existencias>0) { text = item.existencias+' '+item.abreviatura; }
                        else { text = 'Sin existencias'; }
                        options += '<option value="'+item.id+'">'+item.codigo+' - '+item.descripcion+' ('+text+')</option>';
                    });
                    jQuery(registroform+' [name="producto_sel"]').html(options).trigger('change');
                    jQuery(registroform+' button[type="submit"]').show();
                    jQuery(registroform+' .producto-div').show();
                    jQuery(registroform+' [name="proveedor"]').prop('disabled',false);
                    jQuery(registroform+' [name="proveedor"] option:eq(0)').prop('selected',true).trigger('change');
                    jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',false).val(null).trigger('change');
                    jQuery(registroform+' [name="comprobante"]').prop('disabled',false);
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

                    //jQuery(registroform+' [name="proveedor"]').val(response.registro.proveedor).trigger("change");
                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(registroform+' [name='+index+']').length>0){
                            jQuery(registroform+' [name='+index+']').val(item).trigger("change");
                        }
                    });
                    jQuery(registroform+' [name="proveedor"]').prop('disabled',true);
                    jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',true).trigger('change');
                    jQuery(registroform+' [name="comprobante"]').prop('disabled',true);
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
                                        '</td>'+
                                        '<td>'+
                                            '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control input-subtotal" type="text" value="'+item.subtotal+'" readonly></div>'+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                    '</tr>';
                        jQuery(tabledetalles+' tbody').append(tr);
                        counter++;
                    });

                    calcular_total();
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
    });

    jQuery('body').on('click', anularregistro, function() {
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
                    reiniciarform(registroform,registrovalidate,'','');

                    //jQuery(registroform+' [name="proveedor"]').val(response.registro.proveedor).trigger("change");
                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(registroform+' [name='+index+']').length>0){
                            jQuery(registroform+' [name='+index+']').val(item).trigger("change");
                        }
                    });
                    jQuery(registroform+' [name="proveedor"]').prop('disabled',true);
                    jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',true);
                    jQuery(registroform+' [name="comprobante"]').prop('disabled',true);
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
                                        '</td>'+
                                        '<td>'+
                                            '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control input-subtotal" type="text" value="'+item.subtotal+'" readonly></div>'+
                                        '</td>'+
                                        '<td>'+
                                        '</td>'+
                                    '</tr>';
                        jQuery(tabledetalles+' tbody').append(tr);
                        counter++;
                    });

                    calcular_total();
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
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_ingreso">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '1':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_ingreso">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>';
                                    switch (perfil) {
                                        case '1':
                                        case '2':
                                            response.data[i]['acciones']+='<button class="btn btn-xs btn-danger anularregistro" data-toggle="tooltip" data-placement="top" title="Anular" data-id="' + response.data[i]['id'] + '" data-table="proceso_ingreso">' +
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
                            response.data[i]['preciostr']='S/ '+response.data[i]['precio'];
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
            { data: 'proveedordesc' },
            { data: 'username' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            {
                targets: [-2,-1],
                className: 'dt-body-center'
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
                    columns: ':not(:last-child)',
                }
            },
            {
                extend: 'excel',
                text: '<i class="fa fa-file-excel-o push-5-r"></i> Exportar a Excel',
                title: reportetext,
                filename: reportetext,
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            },
            {
                extend: 'print',
                text: '<i class="si si-printer push-5-r"></i> Imprimir',
                title: reportetext,
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            },
        ],
    }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(1)'));

    function selectores() { 
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns([1]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por proveedor" data-allow-clear="true"><option></option></select>')
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
        var cantidad = parseInt($(this).closest('tr').find('.input-cantidad').val());
        var stock = parseFloat($(this).closest('tr').find('.input-stock').val());
        if(cantidad == 0){ 
            $(this).closest("tr").remove(); 
            calcular_total();
        }else{
            cantidad = (cantidad < 0 ? 1 : cantidad);
            $(this).closest('tr').find('.input-cantidad').val(cantidad);
            if($(this).valid()) $(this).closest('.form-group').removeClass('has-error');
            
            var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
            var subtotal = precio*cantidad;
            var saldo = cantidad+stock;
            subtotal = (isNaN(subtotal) ? 0 : subtotal.toFixed(2));
            $(this).closest('tr').find('.input-subtotal').val(subtotal).trigger('change');
            $(this).closest('tr').find('.input-saldo').val(saldo);
        }
    });

    jQuery('body').on('change', tabledetalles+' .input-precio', function() {
        var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
        precio = (precio < 0 ? 0.00 : precio.toFixed(2));
        $(this).closest('tr').find('.input-precio').val(precio);
        
        var cantidad = parseInt($(this).closest('tr').find('.input-cantidad').val());
        var subtotal = precio*cantidad;
        subtotal = (isNaN(subtotal) ? 0 : subtotal.toFixed(2));
        $(this).closest('tr').find('.input-subtotal').val(subtotal).trigger('change');
    });

    jQuery('body').on('change', tabledetalles+' .input-subtotal', function() {
        calcular_total();
    });

    jQuery('body').on('change', registroform+' [name="tipo_comprobante"]', function() {
        if($(this).val()!=''){
            jQuery(registroform+' [name="comprobante"]').addClass('required');
        }else{
            jQuery(registroform+' [name="comprobante"]').removeClass('required');
            jQuery(registroform+' [name="comprobante"]').parents('.form-group').removeClass('has-error');
        }
    });

    jQuery('body').on('click', registroform + ' .btn-producto', function() {
        var elemento = jQuery(this);
        var producto_sel = jQuery(registroform+' [name="producto_sel"]').val();
        var counter = jQuery(registroform+' [name="counter"]').val();
        if(producto_sel){
            var productos = jQuery(tabledetalles+' .input-id');
            var flag = true;
            jQuery.each(productos, function(index, item) {
                if(jQuery(item).val()==producto_sel) flag = false;
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
                                                '<input type="hidden" name="producto['+counter+'][tipo]" value="'+response.registro.tipo+'">'+
                                            '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" step="1" min="0" name="producto['+counter+'][cantidad]" value=""><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>'+
                                            '</td>'+
                                            '<td class="text-center">'+
                                                response.registro.codigo+
                                            '</td>'+
                                            '<td>'+
                                                response.registro.descripcion+
                                            '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-stock" type="text" value="'+response.registro.existencias+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>'+
                                            '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+response.registro.precio+'"></div></div></div>'+
                                            '</td>'+
                                            '<td>'+
                                                '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-saldo" type="text" value="'+response.registro.existencias+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>'+
                                            '</td>'+											
                                            '<td>'+
                                                '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" readonly tabindex="-1"></div>'+
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
                notifytemplate('fa fa-times', 'El producto ya se encuentra agregado', 'danger');
            }
        }else{
            notifytemplate('fa fa-times', 'Seleccione un producto', 'danger');
        }
        
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
                notifytemplate('fa fa-times', 'El ingreso no tiene detalles', 'danger');
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