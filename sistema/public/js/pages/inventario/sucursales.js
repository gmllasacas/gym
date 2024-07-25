
jQuery(function () {
    var tablelist= '#table-list';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var cambiadatoregistro= '.cambiadatoregistro';

    jQuery('.js-masked-ruc').mask('99999999999',{autoclear: false});

    var listdt = jQuery(tablelist).DataTable({
        ajax: {
            type: 'POST',
            url: base_url+'generico/listado/',
            timeout: ajax_timeout,
            data: {
                table: 'base_sucursal',
                estado: '^5',
            },
            dataSrc: function (response) {
                switch (response.status) {
                    case 200:
                        for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                            response.data[i]['acciones']='<div class="btn-group">';
                            switch (response.data[i]['estado']) {
                                case '2':
                                    response.data[i]['acciones']+=
                                                    '    <button class="btn btn-xs btn-success cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Activar" data-id="' + response.data[i]['id'] + '" data-table="base_sucursal" data-valor="1" data-campo="estado">' +
                                                    '        <i class="fa fa-check"></i>'+
                                                    '    </button>';
                                    break;
                                case '1':
                                    response.data[i]['acciones']+=
                                                    '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Editar" data-id="'+response.data[i]['id']+'" data-table="base_sucursal">'+
                                                    '        <i class="fa fa-edit"></i>'+
                                                    '    </button>'+
                                                    '    <button class="btn btn-xs btn-warning cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Desactivar" data-id="' + response.data[i]['id'] + '" data-table="base_sucursal" data-valor="2" data-campo="estado">' +
                                                    '        <i class="fa fa-ban"></i>'+
                                                    '    </button>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
                            response.data[i]['estadostr'] = '<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
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
            { data: 'id' },
            { data: 'sucursal' },
            { data: 'direccion' },
            { data: 'usuarios' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            /*{	
                visible: false, 
                targets: [-3 ]
            },*/
            {
                targets: [-3,-2,-1],
                className: 'dt-body-center'
            },
        ],
        buttons: true,
        order: [[ 0, "asc" ]],
        bAutoWidth: false
    });	
    var buttons = new jQuery.fn.dataTable.Buttons(listdt, {
        buttons: [
            {
                extend: 'copy',
                text: 'Copiar',
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            },
            {
                extend: 'excel',
                text: 'Excel',
                title: reportetext,
                filename: reportetext,
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            },
            {
                extend: 'print',
                text: 'Imprimir',
                title: reportetext,
                exportOptions: {
                    columns: ':not(:last-child)',
                }
            },
        ],
    }).container().appendTo(jQuery(tablelist).closest('.tab-pane').find('.options div:nth-child(1)'));

    jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload();
    });
    
    jQuery('body').on('click', nuevoregistro, function() {
        jQuery(registroform+' [name="id"]').val(null);
        jQuery(registroform+' [name=ruc]').prop('disabled',false);
        reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
        jQuery(registromodal).modal('toggle');
    });

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
                    reiniciarform(registroform,registrovalidate,'generico/actualizarregistro','<i class="fa fa-edit push-5-r"></i> Editar');
                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(registroform+' [name='+index+']').length>0){
                            jQuery(registroform+' [name='+index+']').val(item);
                        }
                    });

					jQuery(registroform+' select[name="usuarios[]"]').val(response.registro.usuarios).trigger('change');
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });

    jQuery('body').on('click', cambiadatoregistro, function() {
        var elemento = jQuery(this);
        jQuery.confirm({
            icon: 'fa fa-warning',
            title: 'Advertencia',
            content: '¿' + elemento.data('original-title') +' registro?',
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
});
