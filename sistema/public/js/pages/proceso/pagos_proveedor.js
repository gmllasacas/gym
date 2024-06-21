
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
    var editarregistro= '.editarregistro';
    var detalleregistro= '.detalleregistro';
    var anularregistro= '.anularregistro';
    var cambiadatoregistro= '.cambiadatoregistro';
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
                            switch (response.data[i]['estado']) {
                                case '3':
                                    response.data[i]['pagostr'] = '<span class="text-danger">S/ '+response.data[i]['pago']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_gasto">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '1':
                                    response.data[i]['pagostr'] = '<span class="text-success">S/ '+response.data[i]['pago']+'</span>';
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_gasto">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Editar" data-id="'+response.data[i]['id']+'" data-table="proceso_gasto">'+
                                                                        '        <i class="fa fa-edit"></i>'+
                                                                        '    </button>';
                                    switch (perfil) {
                                        case '1':
                                        case '2':
                                        case '4':
                                            response.data[i]['acciones']+='<button class="btn btn-xs btn-danger anularregistro" data-toggle="tooltip" data-placement="top" title="Anular" data-id="' + response.data[i]['id'] + '" data-table="proceso_gasto">' +
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
                            response.data[i]['pagosum']=response.data[i]['pagosum'];
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
            { data: 'referenciadesc' },
            { data: 'pagostr' },
            { data: 'pagosum' },
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
                visible: false, 
                targets: [3]
            },
            {
                targets: [3],
                className: 'notexport'
            },
        ],
        buttons: true,
        order: [[ 0, "desc" ]],
        bAutoWidth: false,
        initComplete: function () {
            //selectores();
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
                
            $( api.column( 2 ).footer() ).html('<span class="text-info">S/ '+parseFloat(total).toFixed(2)+'</span>')
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

    var busquedavalidate = jQuery(busquedaform).validate({
        submitHandler: function(form) {
            listdt.ajax.reload();
        }
    });

    jQuery('body').on('click', nuevoregistro, function() {
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_proveedor',
                estado: '1',
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
                    var proveedores = '<option value=""></option>';
                    jQuery.each(response.data, function(index, item) {
                        proveedores += '<option value="'+item.id+'">'+item.ruc+' - '+item.nombre_o_razon_social+'</option>';
                    });
                    jQuery(registroform+' [name="proveedor"]').html(proveedores).trigger('change');
                    jQuery(registroform+' [name="id"]').val(null);
                    jQuery(registroform+' [name="proveedor"]').prop('disabled',false);
                    jQuery(registroform+' [name="pago"]').prop('disabled',false);
                    jQuery(registroform+' [name="observaciones"]').prop('disabled',false);
                    jQuery(registroform+' button[type="submit"]').show();
                    reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
                    jQuery(registroform+' [name="pago"]').val(0.00);
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });

    jQuery('body').on('click', editarregistro, function() {
        var elemento = jQuery(this);
        jQuery.ajax({
            type: "POST",
            url: base_url + "generico/listado",
            data: {
                table: 'proceso_proveedor',
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
                                reiniciarform(registroform,registrovalidate,'generico/actualizarregistro','<i class="fa fa-edit push-5-r"></i> Editar');
                                jQuery(anulacionform).hide();
                                var proveedores = '<option value=""></option>';
                                jQuery.each(responseouter.data, function(index, item) {
                                    proveedores += '<option value="'+item.id+'">'+item.ruc+' - '+item.nombre_o_razon_social+'</option>';
                                });
                                jQuery(registroform+' [name="proveedor"]').html(proveedores).trigger('change');
                                jQuery.each(response.registro, function(index, item) {
                                    if(jQuery(registroform+' [name='+index+']').length>0){
                                        jQuery(registroform+' [name='+index+']').val(item).prop('disabled',true).trigger("change");
                                    }
                                });
                                jQuery(registroform+' [name="id"]').prop('disabled',false);
                                jQuery(registroform+' [name="observaciones"]').prop('disabled',false);
                                jQuery(registroform+' button[type="submit"]').show();
                                jQuery(registromodal).modal('toggle');
                            }
                        }
                    });
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
                table: 'proceso_proveedor',
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
                                reiniciarform(registroform,registrovalidate,'generico/actualizarregistro','<i class="fa fa-edit push-5-r"></i> Editar');
                                var proveedores = '<option value=""></option>';
                                jQuery.each(responseouter.data, function(index, item) {
                                    proveedores += '<option value="'+item.id+'">'+item.ruc+' - '+item.nombre_o_razon_social+'</option>';
                                });
                                jQuery(registroform+' [name="proveedor"]').html(proveedores).trigger('change');
                                jQuery.each(response.registro, function(index, item) {
                                    if(jQuery(registroform+' [name='+index+']').length>0){
                                        jQuery(registroform+' [name='+index+']').val(item).prop('disabled',true).trigger("change");
                                    }
                                });
                                jQuery(registroform+' button[type="submit"]').hide();

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
                table: 'proceso_proveedor',
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
                                reiniciarform(registroform,registrovalidate,'generico/actualizarregistro','<i class="fa fa-edit push-5-r"></i> Editar');
                                var proveedores = '<option value=""></option>';
                                jQuery.each(responseouter.data, function(index, item) {
                                    proveedores += '<option value="'+item.id+'">'+item.ruc+' - '+item.nombre_o_razon_social+'</option>';
                                });
                                jQuery(registroform+' [name="proveedor"]').html(proveedores).trigger('change');
                                jQuery.each(response.registro, function(index, item) {
                                    if(jQuery(registroform+' [name='+index+']').length>0){
                                        jQuery(registroform+' [name='+index+']').val(item).prop('disabled',true).trigger("change");
                                    }
                                });
                                jQuery(registroform+' button[type="submit"]').hide();

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

    var registrovalidate = jQuery(registroform).validate({
        submitHandler: function(form) {
            event.preventDefault();
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

    jQuery('body').on('click', cambiadatoregistro, function() {
        var elemento = jQuery(this);
        jQuery.confirm({
            icon: 'fa fa-warning',
            title: 'Advertencia',
            content: elemento.data('message'),
            type: 'red',
            closeIcon: true,
            draggable: false,
            buttons: {
                cancel: {
                    btnClass: 'btn-muted',
                    text: 'Cancelar'
                },
                success: {
                    btnClass: 'btn-green',
                    text: 'Confimar',
                    action: function(){
                        jQuery.ajax({
                            type: "POST",
                            url: base_url + "generico/actualizarregistro",
                            data: 'table=' + elemento.data('table') + '&id=' + elemento.data('id') + '&' +elemento.data('campo') +'=' + elemento.data('valor'),
                            dataType: 'json',
                            timeout: 60000,
                            success: function(response) {
                                if(response.status=='500'){
                                    notifytemplate('fa fa-times', response.message, 'danger');
                                }
                                if(response.status=='201'){
                                    listdt.ajax.reload();
                                }
                            }
                        });
                    }
                }
            }
        });
    });

    jQuery(busquedaform+' [name="proveedor"]').select2({
        allowClear: true
    }).on('select2:unselecting', function() {
        jQuery(this).data('unselecting', true);
    }).on('select2:opening', function(e) {
        if (jQuery(this).data('unselecting')) {
            jQuery(this).removeData('unselecting');
            e.preventDefault();
        }
    });
});