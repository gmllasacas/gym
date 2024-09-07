
jQuery(function () {
    
    jQuery('.js-masked-dni').mask('99999999',{autoclear: false});

    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var cambiadatoregistro= '.cambiadatoregistro';
    var tablelist= '#table-list';

    jQuery('body').on('click', nuevoregistro, function() {
        jQuery(registroform+' [name="id"]').val(null);
        jQuery(registroform+' [name=cliente_sistema]').prop('disabled',false);
        jQuery('#passwordswb').hide();
        jQuery('#passwordsw').prop("checked",true).trigger("change");
        reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
        jQuery(registroform+' [name=perfil]').trigger('change');
        jQuery(registroform+' [name="estado"]').val(1);
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
                    jQuery(registroform+' [name=perfil]').trigger('change');
                    jQuery(registroform+' [name=cliente_sistema]').val(response.registro.cliente_sistema).trigger("change");
                    jQuery(registroform+' [name=cliente_sistema]').prop('disabled',true);
                    jQuery(registroform+' [name=password]').val('');
                    jQuery(registroform+' [name=password2]').val('');
                    jQuery('#passwordswb').show();
                    jQuery('#passwordsw').prop("checked",false).trigger("change");
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });

    jQuery('#passwordsw').on('change', function () {
        if(this.checked){
            jQuery(registroform+' [name=password]').val('').prop('disabled',false);
            jQuery(registroform+' [name=password2]').val('').prop('disabled',false);
        }else{
            jQuery(registroform+' [name=password]').val('').prop('disabled',true);
            jQuery(registroform+' [name=password2]').val('').prop('disabled',true);
        }
    });

    jQuery(registroform+' [name="perfil"]').on('change', function () {
        var elemento = jQuery(this);
        jQuery(registroform+' [name=cliente_sistema]').closest('.form-group').removeClass('has-error');
        jQuery(registroform+' [name=cliente_sistema]').closest('.form-group').find('.help-block').remove();
        if(jQuery(registroform+' [name="id"]').val()!=''){
            jQuery(registroform+' [name=cliente_sistema]').prop('disabled',true);
        }else{
            if(elemento.val()=='1'){
                jQuery(registroform+' [name=cliente_sistema]').prop('disabled',true);
            }else{
                jQuery(registroform+' [name=cliente_sistema]').valid();
                jQuery(registroform+' [name=cliente_sistema]').prop('disabled',false);
            }
        }
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
                                    listdt.ajax.reload(selectores);
                                }
                            }
                        });
                    }
                }
            }
        });
    });

    var listdt = jQuery(tablelist).DataTable({
        ajax: {
            type: 'POST',
            url: base_url+'generico/listado/',
            timeout: ajax_timeout,
            data: {
                table: 'base_usuario',
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
                                                    '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Editar" data-id="'+response.data[i]['id']+'" data-table="base_usuario">'+
                                                    '        <i class="fa fa-edit"></i>'+
                                                    '    </button>'+
                                                    '    <button class="btn btn-xs btn-success cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Activar" data-id="' + response.data[i]['id'] + '" data-table="base_usuario" data-valor="1" data-campo="estado">' +
                                                    '        <i class="fa fa-check"></i>'+
                                                    '    </button>';
                                    break;
                                case '1':
                                    response.data[i]['acciones']+=
                                                    '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Editar" data-id="'+response.data[i]['id']+'" data-table="base_usuario">'+
                                                    '        <i class="fa fa-edit"></i>'+
                                                    '    </button>'+
                                                    '    <button class="btn btn-xs btn-warning cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Desactivar" data-id="' + response.data[i]['id'] + '" data-table="base_usuario" data-valor="2" data-campo="estado">' +
                                                    '        <i class="fa fa-ban"></i>'+
                                                    '    </button>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
                            response.data[i]['acciones']+='    <button class="btn btn-xs btn-danger cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Eliminar" data-id="' + response.data[i]['id'] + '" data-table="base_usuario" data-valor="5" data-campo="estado">' +
                                                                    '        <i class="fa fa-times"></i>'+
                                                                    '    </button>'+
                                                                    '</div>';
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
            { data: 'id' },
            { data: 'cliente_sistemadesc' },
            { data: 'nombres' },
            { data: 'username' },
            { data: 'correo' },
            { data: 'perfil' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            /*{	
                visible: false, 
                targets: [-3 ]
            },*/
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
    }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(1)'));

    function selectores() { 
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(2)').empty();
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns([-3]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por perfil" data-allow-clear="true"></select>')
                .appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)'))
                .on( 'change', function () {
                    var val = jQuery.fn.dataTable.util.escapeRegex(
                        jQuery(this).val()
                    ); 
                    column
                        .search( val ? '^'+val+'$' : '', true, false )
                        .draw();
                } );
            if (select2_enabled) { select.append( '<option value=""></option>' ); }
            else { select.append( '<option value="">Filtro por perfil</option>' ); }
            column.data().unique().sort().each( function ( d, j ) {
                select.append( '<option value="'+d+'">'+d+'</option>' )
            } );
        } );
        if (select2_enabled) { jQuery('.js-select2-filtro').select2(); }
    };

    jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload(selectores);
    });

    var registrovalidate = jQuery(registroform).validate({
        rules: {
            'password2': {
                equalTo: '#password2'
            },
        },
        messages: {
            'password2': {
                equalTo: 'Contraseña ingresada diferente',
            },
        },
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
        }
    });
});