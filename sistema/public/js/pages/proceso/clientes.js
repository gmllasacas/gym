
jQuery(function () {
    var date = new Date(); 
    var fecha_nacimiento = new Date(date.getFullYear() - 15, date.getMonth()); 
    var tablelist= '#table-list';
    var nuevoregistro= '.nuevoregistro';
    var editarregistro= '.editarregistro';
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var cambiadatoregistro= '.cambiadatoregistro';
    var sin_membresias = $.fn.dataTable.absoluteOrderNumber( [
        {
            value: '',
            position: 'bottom'
        }
    ] );
    var fecha_fin = $.fn.dataTable.absoluteOrder( [
        {
            value: '',
            position: 'bottom'
        }
    ] );
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
                                                                            '    <button class="btn btn-xs btn-warning cambiadatoregistro" data-toggle="tooltip" data-placement="top" title="Desactivar" data-id="' + response.data[i]['id'] + '" data-table="proceso_cliente" data-valor="2" data-campo="estado">' +
                                                                            '        <i class="fa fa-ban"></i>'+
                                                                            '    </button>'+
                                                                            '</div>';
                                    break;
                                default:
                                    response.data[i]['acciones']='';
                                    break;
                            }

                            var fomartted = formatMembresia(response.data[i]);
                            response.data[i]['dias'] = fomartted.dias;
                            response.data[i]['diasstr'] = fomartted.diasstr;
                            response.data[i]['etiqueta'] = fomartted.etiqueta;
                            response.data[i]['dias_filter'] = fomartted.dias_filter;
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
            { data: 'codigo' },//0
            { data: 'tipodesc' },//1
            { data: 'documento' },//2
            { data: 'nombre_o_razon_social' },//3
            { data: 'productodesc' },//4
            { data: 'fecha_fin' },//5
            { data: 'diasstr' },//6
            { data: 'etiqueta' },//7
            { data: 'telefono' },//8
            { data: 'correo' },//9
            { data: 'provinciadesc' },//10
            { data: 'distritodesc' },//11
            { data: 'estadostr' },//12
            { data: 'dias_filter' },//13
            { data: 'acciones' },//14
        ],
        columnDefs: [
            {	
                visible: false, 
                targets: [1,2,8,9,10,11,13]
            },
            {
                targets: [4,5,6,-3,-1],
                className: 'dt-body-center'
            },
            {
                targets: [7],
                className: 'dt-body-center notexport'
            },
            {
                searchable: false,
                targets: [1,2,8,9,10,11]
            },
            {
                type: fecha_fin,
                targets: 5
            },
            {
                type: sin_membresias,
                targets: 6
            },
        ],
        buttons: true,
        order: [[ 6, "desc" ]],
        bAutoWidth: false,
        //bFilter: false,
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
    }).container().appendTo(jQuery(tablelist).closest('.block-content').find('.options > div:nth-child(1)'));

    jQuery('#table-list_filter').hide();

    function selectores() { 
        //jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns().every(function () {
            var column = this;
            var title = column.footer().textContent;
            if (column.index() == 14) {
                var accion = '<div class="btn-group">'+
                                '    <button class="btn btn-xs btn-danger limpiarfiltros" data-toggle="tooltip" data-placement="top" title="Limpiar filtros">' +
                                '        <i class="fa fa-times"></i>'+
                                '    </button>'+
                                '</div>';
                $(accion).appendTo($(column.footer()).empty());
            } else {
                jQuery('<div class="form-group" style="width: 100%;"><div class="input-group" style="width: 100%;"><input class="form-control table-custom-filter" type="text" placeholder="Buscar '+title+'" tabindex="-1"/></div></div>')
                .appendTo($(column.footer()).empty()).on('keyup change clear', function () {
                    if (column.search() !== jQuery(this).find('input').val()) {
                        column.search(jQuery(this).find('input').val()).draw();
                    }
                });
            }
        });
        
        jQuery(tablelist).closest('.block-content').find('.options div:nth-child(3)').empty();
        listdt.columns([13]).every( function () {
            var column = this;
            var select = jQuery('<select class="js-select2-filtro form-control table-custom-filter" data-placeholder="Filtro por etiqueta" data-allow-clear="true"><option></option></select>')
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

    jQuery('body').on('click', '#block-reload', function() {
        listdt.ajax.reload(selectores());
    });

    jQuery('body').on('click', '.limpiarfiltros', function() {
        jQuery('.table-custom-filter').val(null).trigger('change');
    });

    jQuery('body').on('click', nuevoregistro, function() {
        jQuery(registroform+' [name="id"]').val(null);
        jQuery(registroform+' [name="distrito"]').html('');
        reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
        jQuery('[name=fecha_nacimiento]').datepicker("setDate", fecha_nacimiento);
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
                    jQuery(registroform+' [name="provincia"]').trigger('change', response.registro.distrito);
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
                                    listdt.ajax.reload(selectores());
                                }
                            }
                        });
                    }
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
                            listdt.ajax.reload(selectores());
                            jQuery(registromodal).modal('toggle');
                        }
                        if(response.status=='201'){
                            notifytemplate('fa fa-check', response.message, 'success');
                            listdt.ajax.reload(selectores());
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
                { data: 'fecha' },
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
