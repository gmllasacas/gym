
jQuery(function () {

    var tablelist= '#table-list';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var cambiadatoregistro= '.cambiadatoregistro';

    var listdt = jQuery(tablelist).DataTable({
        ajax: {
            type: 'POST',
            url: base_url+'generico/listado/',
            timeout: ajax_timeout,
            data: {
                table: 'proceso_cliente',
                estado: '^5',
            },
            dataSrc: function (response) {
                switch (response.status) {
                    case 200:
                        for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                            switch (response.data[i]['estado']) {
                                case '2':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                            '    <button class="btn btn-xs btn-success detallecredito" data-toggle="tooltip" data-placement="top" title="Detalle de crédito" data-id="'+response.data[i]['id']+'" data-table="proceso_credito">'+
                                                                            '        <i class="si si-wallet"></i>'+
                                                                            '    </button>'+
                                                                            '    <button class="btn btn-xs btn-success cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Activar" data-id="' + response.data[i]['id'] + '" data-table="proceso_cliente" data-valor="1" data-campo="estado">' +
                                                                            '        <i class="fa fa-check"></i>'+
                                                                            '    </button>'+
                                                                            '</div>';
                                    break;
                                case '1':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                            '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Detalles / Editar" data-id="'+response.data[i]['id']+'" data-table="proceso_cliente">'+
                                                                            '        <i class="fa fa-edit"></i>'+
                                                                            '    </button>'+
                                                                            '    <button class="btn btn-xs btn-success detallecredito" data-toggle="tooltip" data-placement="top" title="Detalle de crédito" data-id="'+response.data[i]['id']+'" data-table="proceso_credito">'+
                                                                            '        <i class="si si-wallet"></i>'+
                                                                            '    </button>'+
                                                                            '    <button class="btn btn-xs btn-warning cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Desactivar" data-id="' + response.data[i]['id'] + '" data-table="proceso_cliente" data-valor="2" data-campo="estado">' +
                                                                            '        <i class="fa fa-ban"></i>'+
                                                                            '    </button>'+
                                                                            '</div>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
                            response.data[i]['contactostr'] = (response.data[i]['contacto']=='' ? '' : response.data[i]['contacto']) + (response.data[i]['telefono']=='' ? '' : ' ( '+response.data[i]['telefono']+' )');
                            var color = '';
                            if(response.data[i]['credito']==0){
                                color = 'success';
                            }else{
                                color = 'danger';
                            }
                            response.data[i]['creditostr'] = '<span class="text-'+color+'">S/ '+response.data[i]['credito']+'</span>';
                            response.data[i]['estadostr'] = '<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                            /*response.data[i]['acciones'] += '    <button class="btn btn-xs btn-danger cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Eliminar" data-id="' + response.data[i]['id'] + '" data-table="proceso_cliente" data-valor="5" data-campo="estado">' +
                                                                    '        <i class="fa fa-times"></i>'+
                                                                    '    </button>';*/
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
            { data: 'tipodesc' },
            { data: 'documento' },
            { data: 'nombre_o_razon_social' },
            { data: 'creditostr' },
            { data: 'contactostr' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            /*{	
                visible: false, 
                targets: [-3 ]
            },*/
            {
                targets: [3,4,-2,-1],
                className: 'dt-body-center'
            },
        ],
        buttons: true,
        order: [[ 3, "desc" ]],
        bAutoWidth: false
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

    jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload();
    });
    
    jQuery('body').on('click', nuevoregistro, function() {
        jQuery(registroform+' [name="id"]').val(null);
        jQuery(registroform+' [name="credito"]').prop('disabled',false);
        jQuery(registroform+' .credito-block').show();
        reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
        jQuery(registroform+' [name="credito"]').val(0.00);
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
                    jQuery(registroform+' [name="credito"]').prop('disabled',true);
                    jQuery(registroform+' .credito-block').hide();
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
            var tipo_documento = jQuery(registroform + ' [name="tipo_documento"]').val();
            var documento = jQuery(registroform + ' [name="documento"]').val();
            var flag = false;
            switch (tipo_documento) {
                case '1': //DNI
                    if(documento.length=='8') flag=true;
                    break;
                case '5': //RUC
                    if(documento.length=='11') flag=true;
                    break;
                default:
                    //if(documento.length<'15') flag=true;
                    flag=false;
                    break;
            }

            if(flag){
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
            }else{
                notifytemplate('fa fa-times', 'El número de documento es inválido para el tipo de documento seleccionado', 'danger');
                jQuery(registroform + ' [name="documento"]').focus();
            }
        }
    });

    /**Credito */
        var creditotable = '#table-credito';
        var creditomodal = '#credito-modal';
        var detallecredito = '.detallecredito';

        jQuery('body').on('click', detallecredito, function () {
            var elemento = jQuery(this);
            jQuery(creditomodal + ' [name="cliente"]').val(elemento.data('id'));
            creditodt.ajax.reload();
            jQuery(creditomodal).modal('toggle');		
        });

        var creditodt = jQuery(creditotable).DataTable({
            "deferLoading": 0, // here
            ajax: {
                type: 'POST',
                url: base_url + 'generico/listado/',
                data: function (d) {
                    d.table = 'proceso_credito';
                    d.cliente = jQuery(creditomodal + ' [name="cliente"]').val();
                    d.estado = '1';
                },
                dataSrc: function (response) {
                    switch (response.status) {
                        case 200:
                            for (var i = 0, ien = response.data.length; i < ien; i++) {
                                switch (response.data[i]['tipo_credito']) {
                                    case '1':
                                        response.data[i]['totalstr'] = '<span class="text-danger">S/ '+response.data[i]['total']+'</span>';
                                        break;
                                    case '2':
                                        response.data[i]['totalstr'] = '<span class="text-success">S/ '+response.data[i]['total']+'</span>';
                                        break;
                                    case '3':
                                        response.data[i]['totalstr'] = '<span class="text-danger">S/ '+response.data[i]['total']+'</span>';
                                        break;
                                    case '4':
                                        response.data[i]['totalstr'] = '<span class="text-warning">S/ '+response.data[i]['total']+'</span>';
                                        break;
                                    case '5':
                                        response.data[i]['totalstr'] = '<span class="text-warning">S/ '+response.data[i]['total']+'</span>';
                                        break;
                                    default:
                                        break;
                                }
                                response.data[i]['estadostr']='<label class="label label-'+response.data[i]['estadocol']+'">'+response.data[i]['estadodesc']+'</label>';
                                response.data[i]['creditostr'] = '<span class="text-info">S/ '+response.data[i]['credito']+'</span>';
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
                { data: 'tipodesc' },
                { data: 'totalstr' },
                { data: 'creditostr' },
                { data: 'fecha_registro' },
                { data: 'estadostr' },
            ],
            columnDefs: [
                {
                    targets: [0, -1],
                    className: 'dt-body-center'
                },
            ],
            buttons: true,
            order: [[0, "desc"]],
            bAutoWidth: false,
        });

    /**Credito */

});