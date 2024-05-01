
jQuery(function () {
    
    //jQuery('.js-masked-codigo').mask('aaa99',{autoclear: false});

    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var tablelist= '#table-list';
    var cambiadatoregistro= '.cambiadatoregistro';

    jQuery('body').on('click', nuevoregistro, function() {
        reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
        jQuery(registroform+' [name="id"]').val(null);
        jQuery(registroform+' [name="estado"]').val(1);
        jQuery(registroform+' [name=cliente]').prop('disabled',false);
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
                    jQuery(registromodal).modal('toggle');
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
                table: 'proceso_producto',
                estado: '^5',
            },
            dataSrc: function (response) {
                switch (response.status) {
                    case 200:
                        for ( var i=0, ien=response.data.length ; i<ien ; i++ ) {
                            switch (response.data[i]['estado']) {
                                case '2':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-success cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Activar" data-id="' + response.data[i]['id'] + '" data-table="proceso_producto" data-valor="1" data-campo="estado">' +
                                                                        '        <i class="fa fa-check"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                case '1':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info editarregistro" data-toggle="tooltip" data-placement="top" title="Detalles / Editar" data-id="'+response.data[i]['id']+'" data-table="proceso_producto">'+
                                                                        '        <i class="fa fa-edit"></i>'+
                                                                        '    </button>'+
                                                                        '    <button class="btn btn-xs btn-warning cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Desactivar" data-id="' + response.data[i]['id'] + '" data-table="proceso_producto" data-valor="2" data-campo="estado">' +
                                                                        '        <i class="fa fa-ban"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
                            var color = '';
                            if(response.data[i]['existencias']==0){
                                color = 'danger';
                            }else if(response.data[i]['existencias']<60){
                                color = 'warning';
                            }else{
                                color = 'success';
                            }

                            response.data[i]['existenciasstr'] = '<span class="text-'+color+'">'+response.data[i]['existencias']+' unid. ('+response.data[i]['unidades_docenas']+')</span>';
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
            { data: 'codigo' },
            { data: 'descripcion' },
            { data: 'tipodesc' },
            { data: 'preciostr' },
            { data: 'existenciasstr' },
            { data: 'existencias' },
            { data: 'fecha' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            {	
                targets: [4],
                visible: false, 
            },
            {
                targets: [2,3,-2,-1],
                className: 'dt-body-center'
            },
        ],
        buttons: true,
        order: [[ 4, "desc" ]],
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
    }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options div:nth-child(1)'));

    /*function selectores() { 
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns([1]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por categoría" data-allow-clear="true"><option></option></select>')
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
    };*/

    jQuery('body').on('click', '#block-reload', function() {
        //listdt.ajax.reload(selectores);
        listdt.ajax.reload();
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