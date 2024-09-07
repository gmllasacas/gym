
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
                            switch (response.data[i]['estado']) {
                                case '2':
                                    response.data[i]['acciones'] = '<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info caja" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_caja" data-action="detalle" data-estado="^5">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    response.data[i]['estadostr'] = '<label class="label label-danger">Cerrado</label>';
                                    break;
                                case '1':
                                    response.data[i]['acciones'] = '<div class="btn-group">'+
                                                                        '    <button class="btn btn-xs btn-info caja" data-toggle="tooltip" data-placement="top" title="Detalles" data-id="'+response.data[i]['id']+'" data-table="proceso_caja" data-action="detalle" data-estado="^5">'+
                                                                        '        <i class="fa fa-bars"></i>'+
                                                                        '    </button>'+
                                                                        '</div>';
                                    response.data[i]['estadostr'] = '<label class="label label-success">Abierto</label>';
                                    break;
                                default:
                                    response.data[i]['acciones'] = '';
                                    break;
                            }
                            response.data[i]['total'] = 'S/ '+response.data[i]['total'];
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
            { data: 'fecha_apertura' },
            { data: 'fecha_cierre' },
            { data: 'total' },
            { data: 'usuariodesc' },
            { data: 'usuario_cierredesc' },
            { data: 'sucursaldesc' },
            { data: 'estadostr' },
            { data: 'acciones' },
        ],
        columnDefs: [
            /*{	
                targets: [4],
                visible: false, 
            },*/
            {
                targets: [3,-2,-1],
                className: 'dt-body-center'
            }
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
            var select = jQuery('<select class="js-select2-filtro form-control" id="filtrado1" data-placeholder="Filtro por usuario de apertura" data-allow-clear="true"></select>')
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
            else { select.append( '<option value=""></option>' ); }
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

    /**Ajuste */
        jQuery('body').on('click', nuevoregistro, function() {
            jQuery.ajax({
                type: "POST",
                url: base_url + "generico/detalleregistro",
                data: {
                    table: 'proceso_caja',
                    id: jQuery('.caja').data('id'),
                    action: 'ajuste',
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
                        jQuery(registroform+' [name="caja"]').val(response.registro.id);
                        jQuery(registroform+' [name="actual"]').val(response.registro.total).prop('readonly', true);
                        jQuery(registroform+' [name="ajuste"]').val('0.00');
                        jQuery(registroform+' [name="total"]').val(response.registro.total).prop('readonly', true);
                        jQuery(registroform+' [name="sucursal"]').val(response.registro.sucursaldesc);
                        jQuery(registromodal).modal('toggle');
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

        jQuery('body').on('change', registroform+' [name="ajuste"]', function() {
            var actual = parseFloat(jQuery(registroform+' [name="actual"]').val());
            var ajuste = parseFloat($(this).val());
            var total = parseFloat(actual + ajuste);
            if (total < 0) {
                jQuery(registroform+' [name="ajuste"]').val(actual.toFixed(2)*(-1));
                total = 0.00;
            }
            jQuery(registroform+' [name="total"]').val(total.toFixed(2));
        });
    /**Ajuste */

    /**Caja */
        var abrirform= '#abrir-form';
        var abrirmodal= '#abrir-modal';
        var detallemodal= '#detalle-modal';
        var abrirvalidate = jQuery(abrirform).validate({
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
                            //listdt.ajax.reload();
                            jQuery(abrirmodal).modal('toggle');
                            location.reload()
                        }
                        if(response.status=='201'){
                            notifytemplate('fa fa-check', response.message, 'success');
                            //listdt.ajax.reload();
                            jQuery(abrirmodal).modal('toggle');
                            location.reload()
                        }
                    }
                });
            }
        });

        jQuery('body').on('click', '.caja', function() {
            var action = jQuery(this).data('action');
            jQuery.ajax({
                type: "POST",
                url: base_url + "generico/detalleregistro",
                data: {
                    table: jQuery(this).data('table'),
                    id: jQuery(this).data('id'),
                    action: action,
                    estado: jQuery(this).data('estado'),
                },
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                    if(response.status=='500'){
                        notifytemplate('fa fa-times', response.message, 'danger');
                    }
                    if(response.status=='200'){
                        jQuery(abrirform+' button[type="submit"]').show();
                        jQuery(abrirform+' [name="id"]').val(null);
                        jQuery(abrirform+' [name="notas"]').prop('readonly', false);
                        jQuery(abrirform+' [name="notas_cierre"]').prop('readonly', false);
                        jQuery(abrirform+' .message-block').show();
                        switch (action) {
                            case 'apertura':
                                reiniciarform(abrirform,abrirvalidate,'generico/nuevoregistro','<i class="fa fa-unlock push-5-r"></i> Abrir Caja');
                                jQuery(abrirform+' .message').text('Al abrir la caja, todas las ventas se relacionaran a ésta caja hasta que sea cerrada manualmente.');
                                jQuery(abrirform+' [name="estado"]').val(1);
                                jQuery(abrirform+' [name="apertura"]').val('0.00').prop('readonly', false);
                                jQuery(abrirform+' [name="actual"]').val('0.00').prop('readonly', true);
                                jQuery(abrirform+' [name="cierre"]').val('0.00').prop('readonly', true);
                                jQuery(abrirform+' [name="fecha_apertura"]').val(response.registro.fecha_apertura);
                                jQuery(abrirform+' [name="fecha_cierre"]').val(response.registro.fecha_cierre);
                                jQuery(abrirform+' [name="notas"]').val(response.registro.notas);
                                jQuery(abrirform+' [name="notas_cierre"]').val(response.registro.notas_cierre);
                                jQuery(abrirform+' [name="usuario"]').val(response.registro.username);
                                jQuery(abrirform+' [name="usuario_cierre"]').val(null);
                                jQuery(abrirform+' [name="sucursal"]').val(response.registro.sucursal.sucursal);
                                jQuery(abrirform+' .apertura-block').show();
                                jQuery(abrirform+' .cierre-block').hide();
                                break;
                            case 'cierre':
                                reiniciarform(abrirform,abrirvalidate,'generico/actualizarregistro','<i class="fa fa-lock push-5-r"></i> Cerrar Caja');
                                jQuery(abrirform+' .message').text('Si el monto de cierre es diferente al monto actual, un ajuste de caja se creará automáticamente con la diferencia.');
                                jQuery(abrirform+' [name="id"]').val(response.registro.id);
                                jQuery(abrirform+' [name="estado"]').val(2);
                                jQuery(abrirform+' [name="apertura"]').val(response.registro.apertura).prop('readonly', true);
                                jQuery(abrirform+' [name="actual"]').val(response.registro.total).prop('readonly', true);
                                jQuery(abrirform+' [name="cierre"]').val(response.registro.total).prop('readonly', false);
                                jQuery(abrirform+' [name="fecha_apertura"]').val(response.registro.fecha_apertura);
                                jQuery(abrirform+' [name="fecha_cierre"]').val(response.registro.fecha_cierre);
                                jQuery(abrirform+' [name="notas"]').val(response.registro.notas).prop('readonly', true);
                                jQuery(abrirform+' [name="notas_cierre"]').val(response.registro.notas_cierre);
                                jQuery(abrirform+' [name="usuario"]').val(response.registro.usuariodesc);
                                jQuery(abrirform+' [name="usuario_cierre"]').val(response.registro.usuario_cierredesc);
                                jQuery(abrirform+' [name="sucursal"]').val(response.registro.sucursaldesc);
                                jQuery(abrirform+' .apertura-block').show();
                                jQuery(abrirform+' .cierre-block').show();
                                break;
                            case 'detalle':
                                reiniciarform(abrirform,abrirvalidate,'','');
                                jQuery(abrirform+' .message-block').hide();
                                jQuery(abrirform+' button[type="submit"]').hide();
                                jQuery(abrirform+' [name="id"]').val(response.registro.id);
                                jQuery(abrirform+' [name="estado"]').val('^5');
                                jQuery(abrirform+' [name="apertura"]').val(response.registro.apertura).prop('readonly', true);
                                jQuery(abrirform+' [name="actual"]').val(response.registro.total).prop('readonly', true);
                                jQuery(abrirform+' [name="cierre"]').val(response.registro.total).prop('readonly', true);
                                jQuery(abrirform+' [name="fecha_apertura"]').val(response.registro.fecha_apertura);
                                jQuery(abrirform+' [name="fecha_cierre"]').val(response.registro.fecha_cierre);
                                jQuery(abrirform+' [name="notas"]').val(response.registro.notas).prop('readonly', true);
                                jQuery(abrirform+' [name="notas_cierre"]').val(response.registro.notas_cierre).prop('readonly', true);
                                jQuery(abrirform+' [name="usuario"]').val(response.registro.usuariodesc);
                                jQuery(abrirform+' [name="usuario_cierre"]').val(response.registro.usuario_cierredesc);
                                jQuery(abrirform+' [name="sucursal"]').val(response.registro.sucursaldesc);
                                jQuery(abrirform+' .apertura-block').show();
                                jQuery(abrirform+' .cierre-block').show();
                                break;
                            default:
                                break;
                        }

                        jQuery(tabledetalles+' tbody').html('');
                        var total = 0.00;
                        if (response.registro.detalles.length > 0) {
                            jQuery.each(response.registro.detalles, function(index, item) {
                                switch (item.tipo_caja_detalle) {
                                  case '1':
                                    tipodescstr = '<label class="label label-info">'+item.tipodesc+'</label>';
                                    break;
                                  case '2':
                                    tipodescstr = '<label class="label label-success">'+item.tipodesc+'</label>';
                                    break;
                                  case '3':
                                    tipodescstr = '<label class="label label-danger">'+item.tipodesc+'</label>';
                                    break;
                                  default:
                                    break;
                                }

                                var tr = '<tr>'+
                                            '<td class="text-center">'+item.fecha+'</td>'+
                                            '<td class="text-center">'+item.username+'</td>'+
                                            '<td class="text-center">'+(item.clientedesc || '')+'</td>'+
                                            '<td class="text-center">'+tipodescstr+'</td>'+
                                            '<td>'+
                                                '<div class="input-group"><span class="input-group-addon">S/</span><input style="text-align:right" class="form-control input-subtotal" type="text" value="'+item.monto+'" readonly></div>'+
                                            '</td>'+
                                        '</tr>';
                                jQuery(tabledetalles+' tbody').append(tr);
                                total = total + Number(item.monto);
                            });
                        } else {
                            var tr = '<tr>'+
                                        '<td colspan="4" rowspan="3" class="text-center">Sin detalles</td>'+
                                    '</tr>'
                            jQuery(tabledetalles+' tbody').append(tr);
                        }
                        jQuery(abrirform+' [name="total"]').val(total.toFixed(2));

                        jQuery(abrirmodal).modal('toggle');
                    }
                }
            });
        });
    /**Caja */

    jQuery(busquedaform+' [name="producto"]').on('select2:unselecting', function() {
        jQuery(this).data('unselecting', true);
    }).on('select2:opening', function(e) {
        if (jQuery(this).data('unselecting')) {
            jQuery(this).removeData('unselecting');
            e.preventDefault();
        }
    });
});
