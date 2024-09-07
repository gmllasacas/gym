
jQuery(function () {
    var date = new Date(); 
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1); 
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0); 
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var editarregistro= '.editarregistro';
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

    jQuery('body').on('click', editarregistro, function() {
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/detalleregistro",
            data: 'table=' + jQuery(this).data('table') + '&id=' + jQuery(this).data('id'),
            dataType: 'json',
            timeout: 60000,
            success: function(response) {
                if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                }
                if(response.status=='200'){
                    reiniciarform(registroform,'','','');
                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(registroform+' [name='+index+']').length>0){
                            jQuery(registroform+' [name='+index+']').val(item).prop('readonly',true);
                        }
                    });
                    jQuery(registroform+' [name="tipo_documento"]').prop('disabled',true);
                    jQuery(registroform+' [name="provincia"]').prop('disabled',true);
                    jQuery(registroform+' [name="distrito"]').prop('disabled',true);
                    jQuery(registroform+' [name="fecha_nacimiento"]').prop('disabled',true);
                    jQuery(registroform+' [name="provincia"]').trigger('change', response.registro.distrito);
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });

    jQuery('body').on('change', registroform+' [name="provincia"]', function(e, distrito) {
        var provincia = jQuery(registroform+' [name="provincia"]').val();
        if (provincia != null) {
            jQuery.ajax({
                type: "POST",
                url: base_url + "generico/listado",
                data: {
                    table: 'proceso_distrito',
                    provincia: provincia,
                    estado: '^5',
                },
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                    if(response.status=='500'){
                        notifytemplate('fa fa-times', response.message, 'danger');
                    }
                    if(response.status=='200'){
                        var options = '<option value=""></option>';
                        jQuery.each(response.data, function(index, item) {
                            options += '<option value="'+item.iddistrito+'">'+item.distrito+'</option>';
                        });
                        jQuery(registroform+' [name="distrito"]').html(options).trigger('change');
                        if (distrito !== undefined) {
                            jQuery(registroform+' [name="distrito"]').val(distrito).trigger('change');
                        }
                    }
                }
            });
        }
    });

    /**Clientes nuevos */
        var busquedaform= '#busqueda-form';
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
                            var data = [];
                            for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                                if (response.data[i]['id'] == '1') {
                                    continue;
                                }
                                response.data[i]['acciones'] =
                                    '<div class="btn-group">'+
                                    '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_cliente">'+
                                    '        <i class="fa fa-edit"></i>'+
                                    '    </button>'+
                                    '</div>';
                                response.data[i]['preciostr']='S/ '+response.data[i]['precio'];
                                response.data[i]['estadostr']='<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                                data.push(response.data[i]);
                            }
                            return data;
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
                { data: 'codigo' },
                { data: 'nombre_o_razon_social' },
                { data: 'telefono' },
                { data: 'correo' },
                { data: 'productodesc' },
                { data: 'username' },
                { data: 'estadostr' },
                { data: 'acciones' },
            ],
            columnDefs: [
                {
                    targets: [1,6,-2,-1],
                    className: 'dt-body-center'
                },
            ],
            buttons: true,
            order: [[ 0, "desc" ]],
            bAutoWidth: false,
            initComplete: function () {
                //selectores();
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
        }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options-1 div:nth-child(1)'));

        var busquedavalidate = jQuery(busquedaform).validate({
            submitHandler: function(form) {
                listdt.ajax.reload();
            }
        });
    /**Clientes nuevos */

    /**Clientes inactivos */
        var tablelist2= '#table-list-2';
        var listdt2 = jQuery(tablelist2).DataTable({
            ajax: {
                type: 'POST',
                url: base_url+'generico/listado/',
                timeout: ajax_timeout,
                data: {
                    table: 'proceso_cliente',
                    inactive: 'true',
                    estado: '^5',
                },
                dataSrc: function (response) {
                    switch (response.status) {
                        case 200:
                            var data = [];
                            for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                                if (response.data[i]['id'] == '1') {
                                    continue;
                                }
                                response.data[i]['acciones'] = '<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_cliente">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';

                                var fomartted = formatMembresia(response.data[i]);
                                response.data[i]['dias'] = fomartted.dias;
                                response.data[i]['diasstr'] = fomartted.diasstr;
                                response.data[i]['etiqueta'] = fomartted.etiqueta;
                                response.data[i]['dias_filter'] = fomartted.dias_filter;
                                response.data[i]['estadostr'] = '<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                                data.push(response.data[i]);
                            }
                            return data;
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
                { data: 'fecha_fin' },
                { data: 'codigo' },
                { data: 'nombre_o_razon_social' },
                { data: 'telefono' },
                { data: 'correo' },
                { data: 'productodesc' },
                { data: 'etiqueta' },
                { data: 'username' },
                { data: 'estadostr' },
                { data: 'acciones' }
            ],
            columnDefs: [
                {
                    targets: [1,6,7,-2,-1],
                    className: 'dt-body-center'
                },
            ],
            buttons: true,
            order: [[ 0, "desc" ]],
            bAutoWidth: false,
        });	
        var buttons = new jQuery.fn.dataTable.Buttons(listdt2, {
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
                    title: reportetext_2,
                    filename: reportetext_2,
                    exportOptions: {
                        columns: ':not(:last-child):not(.notexport)',
                    }
                },
                {
                    extend: 'print',
                    text: '<i class="si si-printer push-5-r"></i> Imprimir',
                    title: reportetext_2,
                    exportOptions: {
                        columns: ':not(:last-child):not(.notexport)',
                    }
                },
            ],
        }).container().appendTo(jQuery(tablelist2).closest('.block-content').find('.options-2 > div:nth-child(1)'));
    /**Clientes inactivos */

});
