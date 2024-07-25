
jQuery(function () {
    var date = new Date(); 
    var tablelist= '#table-list';
    var detalleregistro= '.detalleregistro';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var tabledetalles= '#table-detalles';
    var busquedaform= '#busqueda-form';

    jQuery('[name=fechainicio]').datepicker("setDate", date);
    jQuery('[name=fechafin]').datepicker("setDate", date);

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
                                case '1':
                                    response.data[i]['acciones']='<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info detalleregistro" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_auditoria">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }
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
            { data: 'username' },
            { data: 'accion' },
            { data: 'sucursaldesc' },
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
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por usuario" data-allow-clear="true"></select>')
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
            else { select.append( '<option value="">Filtro por usuario</option>' ); }
            column.data().unique().sort().each( function ( d, j ) {
                select.append( '<option value="'+d+'">'+d+'</option>' )
            } );
        } );
        if (select2_enabled) { jQuery('.js-select2-filtro').select2(); }
    };

    var busquedavalidate = jQuery(busquedaform).validate({
        submitHandler: function(form) {
            listdt.ajax.reload(selectores);
        }
    });

    jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload(selectores);
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
                    reiniciarform(registroform,'','','');

                    jQuery.each(response.registro, function(index, item) {
                        if(jQuery(registroform+' [name='+index+']').length>0){
                            jQuery(registroform+' [name='+index+']').val(item).trigger("change").prop('disabled',true);
                        }
                    });
                    jQuery(registroform+' [name="username"]').val(response.registro.usuario.username).prop('disabled',true);

                    jQuery(tabledetalles+' tbody').html('');
                    if (response.registro.detalles.length > 0) {
                        jQuery.each(response.registro.detalles, function(index, item) {
                            var tr = '<tr>'+
                                            '<td>'+
                                                item.campo+
                                            '</td>'+
                                            '<td>'+
                                                item.dato+
                                            '</td>'+
                                        '</tr>';
                            jQuery(tabledetalles+' tbody').append(tr);
                        });
                    } else {
                        jQuery(tabledetalles+' tbody').html('<tr><td class="text-center" colspan="2">Sin detalles</td></tr>');
                    }
                    jQuery(registromodal).modal('toggle');
                }
            }
        });
    });
});
