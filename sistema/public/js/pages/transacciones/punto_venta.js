
jQuery(function () {

  /**Venta */
    var registroform= '#registro-form';
    var tabledetalles= '#table-detalles';
    var cajadetalles= '.caja-detalles';

    jQuery('body').on('click', registroform+' .quitarfila', function() {
      $(this).tooltip('hide');
      $(this).closest("tr").remove();
      calcular_total();
    });

    jQuery('body').on('change', registroform+' [name="igv_percent"]', function() {
      calcular_total();
    });

    jQuery('body').on('change', tabledetalles+' .input-cantidad', function() {
      var cantidad = parseFloat($(this).closest('tr').find('.input-cantidad').val());
      var max = parseFloat($(this).closest('tr').find('.input-cantidad').attr('max'));
      cantidad = (cantidad < 0 ? 1 : cantidad);
      cantidad = (cantidad >= max ? max : cantidad);
      $(this).closest('tr').find('.input-cantidad').val(cantidad);
      if($(this).valid()) $(this).closest('.form-group').removeClass('has-error');
      
      var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
      var subtotal = (precio)*cantidad;
      subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
      $(this).closest('tr').find('.input-subtotal').val(subtotal).trigger('change');
      calcular_total();
    });

    jQuery('body').on('change', registroform+' [name="codigo_descuento"]', function() {
      calcular_total();
    });
  
    jQuery('body').on('change', tabledetalles+' .input-precio', function() {
      var precio = parseFloat($(this).closest('tr').find('.input-precio').val());
      precio = (precio < 0 ? 0.00 : precio.toFixed(2));
      $(this).closest('tr').find('.input-precio').val(precio);
      
      var cantidad = parseFloat($(this).closest('tr').find('.input-cantidad').val());
      var subtotal = (precio)*cantidad;
      subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
      $(this).closest('tr').find('.input-subtotal').val(subtotal);
      calcular_total();
    });

    jQuery('body').on('change', registroform+' [name="tipo_comprobante"]', function() {
      validar_tipo_documento();
      var tipo_comprobante = $(this).val();
      if(tipo_comprobante){
        jQuery.ajax({
          type: "POST",
          url: base_url + "generico/detalleregistro",
          data: {
            table: 'base_sucursal',
            id: sucursal,
            tipo_comprobante: tipo_comprobante,
            estado: '1',
          },
          dataType: 'json',
          timeout: 60000,
          success: function(response) {
            if(response.status=='500'){
              notifytemplate('fa fa-times', response.message, 'danger');
            }
            if(response.status=='200'){
              jQuery(registroform+' [name="comprobante"]').val(response.registro.numeracion);
            }
          }
        });
      }else{
        jQuery(registroform+' [name="comprobante"]').val(null);
      }
    });

    jQuery('body').on('change', registroform+' [name="tipo_venta_pago"]', function() {
      if($(this).val()=='2'){
        jQuery(registroform+' .tipo_venta_pago_div').show();
        jQuery(registroform+' [name="tipo_pago"]').addClass('required');
      }else{
        jQuery(registroform+' .tipo_venta_pago_div').hide();
        jQuery(registroform+' [name="tipo_pago"]').removeClass('required');
        jQuery(registroform+' [name="tipo_pago"]').parents('.form-group').removeClass('has-error');
      }
    });

    jQuery('body').on('change', registroform+' [name="tipo_pago"]', function() {
      if($(this).val()=='2'){
        jQuery(registroform+' .tipo_pago_div').show();
        jQuery(registroform+' [name="numero_operacion"]').addClass('required');
      }else{
        jQuery(registroform+' .tipo_pago_div').hide();
        jQuery(registroform+' [name="numero_operacion"]').removeClass('required');
        jQuery(registroform+' [name="numero_operacion"]').parents('.form-group').removeClass('has-error');
      }
    });

    jQuery('body').on('click', registroform + ' .btn-producto', function() {
      var elemento = jQuery(this);
      var origin = jQuery(this).data('origin');
      var counter = jQuery(registroform+' [name="counter"]').val();

      if(origin == 'button') {
        var producto_sel = jQuery(this).data('producto');
        var tipo_sel = jQuery(this).data('tipo');
      } else {
        var producto_sel = jQuery(registroform+' [name="producto_sel"]').val();
        var tipo_sel = jQuery(registroform+' [name="producto_sel"]').find("option:selected").attr('data-tipo');
      }

      if(producto_sel){
        var productos = jQuery(tabledetalles+' .input-id');
        var producto_tipos = jQuery(tabledetalles+' .input-tipo');
        var flag = true;

        jQuery.each(productos, function(index, item) {
          if(jQuery(item).val() == producto_sel) {
            flag = false;
            message = 'El producto ya se encuentra agregado';
          }
        });

        if (tipo_sel == 2) {
          jQuery.each(producto_tipos, function(index, item) {
            if(jQuery(item).val() == 2) { //servicio
              flag = false;
              message = 'Solo se puede agregar un servicio por venta';
            }
          });
        }

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
                                '<input type="hidden" class="input-tipo" name="producto['+counter+'][tipo]" value="'+response.registro.tipo+'">'+
                            '</td>'+
                            '<td>';
                if (response.registro['tipo'] == 1) {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" step="1" min="1" max="'+response.registro.existencias+'" name="producto['+counter+'][cantidad]" value="1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                } else if (response.registro['tipo'] == 2) {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                } else {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                }
                        tr += '</td>'+
                                '<td>'+
                                    response.registro.codigo+
                                '</td>'+
                                '<td>'+
                                    response.registro.descripcion+
                                '</td>'+
                                '<td>';
                if (response.registro['tipo'] == 1) {
                            tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+response.registro.existencias+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                } else if (response.registro['tipo'] == 2) {
                            tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+response.registro.duracion+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.duracion_unidad_desc+'</span></div></div></div>';
                } else {
                            tr += '';
                }
                        tr += '</td>'+
                                '<td>'+
                                    '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+response.registro.precio+'"></div></div></div>'+
                                '</td>'+
                                '<td>'+
                                    '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="0.00" readonly></div></div></div>'+
                                '</td>'+
                                '<td>'+
                                    '<a class="btn btn-xs btn-danger quitarfila" data-toggle="tooltip" data-placement="top" title="BORRAR"><i class="fa fa-times"></i></a>'+
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
          notifytemplate('fa fa-times', message, 'danger');
        }
      }else{
        notifytemplate('fa fa-times', 'Seleccione un producto', 'danger');
      }
    });

    jQuery('body').on('click', registroform + ' .clear-form', function() {
      load(false);
    });

    jQuery('body').on('change', registroform+' [name="cliente"]', function() {
      validar_tipo_documento();
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
                var documento = base_url + 'transacciones/comprobante/' + response.data.id;
                load();
                try {
                  window.open(documento, '_blank').focus();
                } catch(err) {
                  notifytemplate('fa fa-times', 'Por favor habilite los popups en este navegador para poder abrir el comprobante de forma automática', 'danger', 8000);
                }
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', 'La venta no tiene detalles', 'danger');
        }
      }
    });
  /**Venta */

  /**PREVenta */
    var preventamodal= '#preventa-modal';
    var preventaform= '#preventa-form';
    var preventadetalles= '#preventa-detalles';
    var preventas= '.preventas';
    var nuevapreventa= '.nuevapreventa';
    var eliminar_preventa= '.eliminar_preventa';

    jQuery('body').on('click', preventadetalles+' .quitarfila', function() {
      $(this).tooltip('hide');
      $(this).closest(".detalle").remove();
      calcular_total_preventa();
    });

    jQuery('body').on('change', preventadetalles+' .input-precio', function() {
      var parent = $(this).closest('.detalle');
      var precio = parseFloat(parent.find('.input-precio').val());
      precio = (precio < 0 ? 0.00 : precio.toFixed(2));
      parent.find('.input-precio').val(precio);
      
      var cantidad = parseFloat(parent.find('.input-cantidad').val());
      var subtotal = (precio)*cantidad;
      subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
      parent.find('.input-subtotal').val(subtotal);
      calcular_total_preventa();
    });

    jQuery('body').on('change', preventadetalles+' .input-cantidad', function() {
      var parent = $(this).closest('.detalle');
      var cantidad = parseFloat(parent.find('.input-cantidad').val());
      var max = parseFloat(parent.find('.input-cantidad').attr('max'));
      cantidad = (cantidad < 0 ? 1 : cantidad);
      cantidad = (cantidad >= max ? max : cantidad);
      parent.find('.input-cantidad').val(cantidad);
      if($(this).valid()) $(this).closest('.form-group').removeClass('has-error');
      
      var precio = parseFloat(parent.find('.input-precio').val());
      var subtotal = (precio)*cantidad;
      subtotal = (isNaN(subtotal) ? 0.00 : subtotal.toFixed(2));
      parent.find('.input-subtotal').val(subtotal).trigger('change');
      calcular_total_preventa();
    });
  
    jQuery('body').on('click', preventaform + ' .clear-form', function() {
      load_preventa(false);
    });

    /*jQuery(preventamodal).on( 'shown.bs.modal', function( evt ) {
      load_preventa(true);
    });*/

    jQuery('body').on('click', nuevapreventa , function() {
      load_preventa(true);
      jQuery(preventamodal).modal('show');
    });

    jQuery('body').on('click', preventaform + ' .btn-producto', function() {
      var elemento = jQuery(this);
      var origin = jQuery(this).data('origin');
      var counter = jQuery(preventaform+' [name="counter"]').val();

      if(origin == 'button') {
        var producto_sel = jQuery(this).data('producto');
        var tipo_sel = jQuery(this).data('tipo');
      } else {
        var producto_sel = jQuery(preventaform+' [name="producto_sel"]').val();
        var tipo_sel = jQuery(preventaform+' [name="producto_sel"]').find("option:selected").attr('data-tipo');
      }

      if(producto_sel){
        var productos = jQuery(preventadetalles+' .input-id');
        var producto_tipos = jQuery(preventadetalles+' .input-tipo');
        var flag = true;

        jQuery.each(productos, function(index, item) {
          if(jQuery(item).val() == producto_sel) {
            flag = false;
            message = 'El producto ya se encuentra agregado';
          }
        });

        if (tipo_sel == 2) {
          jQuery.each(producto_tipos, function(index, item) {
            if(jQuery(item).val() == 2) { //servicio
              flag = false;
              message = 'Solo se puede agregar un servicio por venta';
            }
          });
        }

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
                var element = '<div class="row detalle">'+
                                '<div class="col-xs-12 col-md-12 col-lg-10 col-lg-offset-1">'+
                                    '<a class="block block-bordered">'+
                                        '<button class="btn btn-xs btn-rounded btn-danger btn-delete quitarfila" data-toggle="tooltip" data-placement="top" title="BORRAR" type="button"><i class="fa fa-times"></i><span class="hidden-sm hidden-md hidden-lg push-5-l">BORRAR</span></button>'+
                                        '<div class="block-content block-content-mini clearfix">'+
                                            '<div class="row">'+
                                                '<div class="col-xs-12 col-sm-5">'+
                                                    '<div class="form-group">'+
                                                        '<label class="col-xs-12">'+(response.registro.categoriadesc || response.registro.tipodesc)+'</label>'+
                                                        '<div class="col-sm-12">'+
                                                            '<div class="form-control-static">'+
                                                              response.registro.descripcion+
                                                              '<small class="text-muted visible-xs-inline"> - '+response.registro.notas+'</small>'+
                                                              '<small class="text-muted visible-sm-block visible-md-block visible-lg-block">'+response.registro.notas+'</small>'+
                                                            '</div>'+
                                                            '<input type="hidden" class="input-id" name="producto['+counter+'][id]" value="'+response.registro.id+'">'+
                                                            '<input type="hidden" name="producto['+counter+'][productodesc]" value="'+response.registro.codigo+' - '+response.registro.descripcion+'">'+
                                                            '<input type="hidden" class="input-tipo" name="producto['+counter+'][tipo]" value="'+response.registro.tipo+'">'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="col-xs-6 col-sm-3">'+
                                                    '<div class="form-group">'+
                                                        '<label class="col-xs-12">Cantidad</label>'+
                                                        '<div class="col-xs-12">'+
                                                            '<div class="input-group">';
                if (response.registro['tipo'] == 1) {
                          element += '<input class="form-control input-cantidad required" type="number" step="1" min="1" max="'+response.registro.existencias+'" name="producto['+counter+'][cantidad]" value="1">';
                } else if (response.registro['tipo'] == 2) {
                          element += '<input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly>';
                } else {
                          element += '<input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1">';
                }
                                                element +=  '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="col-xs-6 col-sm-2">'+
                                                    '<div class="form-group">'+
                                                        '<label class="col-xs-12">P. Venta</label>'+
                                                        '<div class="col-xs-12">'+
                                                            '<div class="input-group">'+
                                                                '<span class="input-group-addon">S/</span>'+
                                                                '<input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+response.registro.precio+'">'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                                '<div class="col-xs-6 col-xs-offset-3 col-sm-2 col-sm-offset-0">'+
                                                    '<div class="form-group">'+
                                                        '<label class="col-xs-12">Total</label>'+
                                                        '<div class="col-xs-12">'+
                                                            '<div class="input-group">'+
                                                                '<span class="input-group-addon">S/</span>'+
                                                                '<input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="0.00" readonly>'+
                                                            '</div>'+
                                                        '</div>'+
                                                    '</div>'+
                                                '</div>'+
                                            '</div>'+
                                        '</div>'+
                                    '</a>'+
                                '</div>'+
                            '</div>';
                jQuery(preventadetalles).append(element);
                jQuery(preventadetalles + " .input-cantidad").TouchSpin({
                  min: 1,
                  step: 1,
                  postfix: response.registro.abreviatura,
                  postfix_extraclass:'btn-xxs',
                  buttondown_class:'btn btn-default btn-xxs',
                  buttonup_class:'btn btn-default btn-xxs',
                });

                jQuery(preventaform+' [name="producto['+counter+'][precio]"]').trigger('change');
                jQuery(preventaform+' [name="counter"]').val( parseInt(counter)+1);
                jQuery(preventaform+' [name="producto_sel"]').val(null).trigger('change');
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', message, 'danger');
        }
      }else{
        notifytemplate('fa fa-times', 'Seleccione un producto', 'danger');
      }
    });

    jQuery('body').on('click', preventaform + ' .editar_preventa', function() {
      var elemento = jQuery(this);
      var counter = jQuery(preventaform+' [name="counter"]').val();
      var id = jQuery(this).data('id');

      jQuery.ajax({
        type: "POST",
        url: base_url + "generico/detalleregistro",
        data: 'table=proceso_preventa&id=' + id,
        dataType: 'json',
        timeout: 60000,
        success: function(response) {
          if(response.status=='500'){
            notifytemplate('fa fa-times', response.message, 'danger');
          }
          if(response.status=='200'){
            elemento.closest('.border-b').addClass('bg-primary');
            elemento.closest('.block').find('.block-nd').addClass('bg-gray-lighter');
            reiniciarform(preventaform,preventavalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> EDITAR PRE-VENTA');
            jQuery(preventaform+' [name="id"]').val(response.registro.id);
            jQuery(preventaform+' [name="datos_adicionales"]').val(response.registro.datos_adicionales).trigger('change');
            jQuery(preventadetalles).html('');
            var counter = 1;

            jQuery.each(response.registro.detalles, function(index, item) {
              var element = '<div class="row detalle">'+
                              '<div class="col-xs-12 col-md-12 col-lg-10 col-lg-offset-1">'+
                                  '<a class="block block-bordered">'+
                                      '<button class="btn btn-xs btn-rounded btn-danger btn-delete quitarfila" data-toggle="tooltip" data-placement="top" title="BORRAR" type="button"><i class="fa fa-times"></i><span class="hidden-sm hidden-md hidden-lg push-5-l">BORRAR</span></button>'+
                                      '<div class="block-content block-content-mini clearfix">'+
                                          '<div class="row">'+
                                              '<div class="col-xs-12 col-sm-6">'+
                                                  '<div class="form-group">'+
                                                      '<label class="col-xs-12">'+(item.categoriadesc || item.tipodesc)+'</label>'+
                                                      '<div class="col-sm-12">'+
                                                          '<div class="form-control-static">'+
                                                            item.producto_detalle.descripcion+
                                                            '<small class="text-muted visible-xs-inline"> - '+item.producto_detalle.notas+'</small>'+
                                                            '<small class="text-muted visible-sm-block visible-md-block visible-lg-block">'+item.producto_detalle.notas+'</small>'+
                                                          '</div>'+
                                                          '<input type="hidden" class="input-id" name="producto['+counter+'][id]" value="'+item.producto_detalle.id+'">'+
                                                          '<input type="hidden" name="producto['+counter+'][productodesc]" value="'+item.producto_detalle.codigo+' - '+item.producto_detalle.descripcion+'">'+
                                                          '<input type="hidden" class="input-tipo" name="producto['+counter+'][tipo]" value="'+item.producto_detalle.tipo+'">'+
                                                      '</div>'+
                                                  '</div>'+
                                              '</div>'+
                                              '<div class="col-xs-4 col-sm-2">'+
                                                  '<div class="form-group">'+
                                                      '<label class="col-xs-12">Cantidad</label>'+
                                                      '<div class="col-xs-12">'+
                                                          '<div class="input-group">';
                if (item.producto_detalle.tipo == 1) {
                          element += '<input class="form-control input-cantidad required" type="number" step="1" min="1" max="'+item.producto_detalle.existencias+'" name="producto['+counter+'][cantidad]" value="'+item.cantidad+'"><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span>';
                } else if (item.producto_detalle.tipo == 2) {
                          element += '<input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span>';
                } else {
                          element += '<input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="'+item.cantidad+'"><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span>';
                }
                                              element +=  '</div>'+
                                                      '</div>'+
                                                  '</div>'+
                                              '</div>'+
                                              '<div class="col-xs-4 col-sm-2">'+
                                                  '<div class="form-group">'+
                                                      '<label class="col-xs-12">P. Venta</label>'+
                                                      '<div class="col-xs-12">'+
                                                          '<div class="input-group">'+
                                                              '<span class="input-group-addon">S/</span>'+
                                                              '<input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+item.precio+'">'+
                                                          '</div>'+
                                                      '</div>'+
                                                  '</div>'+
                                              '</div>'+
                                              '<div class="col-xs-4 col-sm-2">'+
                                                  '<div class="form-group">'+
                                                      '<label class="col-xs-12">Total</label>'+
                                                      '<div class="col-xs-12">'+
                                                          '<div class="input-group">'+
                                                              '<span class="input-group-addon">S/</span>'+
                                                              '<input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="'+item.subtotal+'" readonly>'+
                                                          '</div>'+
                                                      '</div>'+
                                                  '</div>'+
                                              '</div>'+
                                          '</div>'+
                                      '</div>'+
                                  '</a>'+
                              '</div>'+
                          '</div>';
              jQuery(preventadetalles).append(element);
              counter++;
            });
            jQuery(preventaform+' [name="counter"]').val(parseInt(counter));
            jQuery(preventaform+' [name="total"]').val(response.registro.total);
          }
        }
      });
    });
  
    jQuery('body').on('click', eliminar_preventa, function() {
      var elemento = jQuery(this);
      var id = jQuery(this).data('id');

      jQuery.confirm({
        icon: 'fa fa-warning',
        title: 'Advertencia',
        content: '¿Eliminar preventa?',
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
                data: 'table=proceso_preventa&id=' + id + '&estado=5',
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                  if(response.status=='500'){
                    notifytemplate('fa fa-times', response.message, 'danger');
                  }
                  if(response.status=='201'){
                    preventas_();
                  }
                }
              });
            }
          }
        }
      });
    });

    jQuery('body').on('click', preventaform + ' .convertir_venta', function(e) {
      e.preventDefault();
      var elemento = jQuery(this);
      var id = jQuery(this).data('id');

      jQuery.ajax({
        type: "POST",
        url: base_url + "generico/detalleregistro",
        data: 'table=proceso_preventa&id=' + id,
        dataType: 'json',
        timeout: 60000,
        success: function(response) {
          if(response.status=='500'){
            notifytemplate('fa fa-times', response.message, 'danger');
          }
          if(response.status=='200'){
            jQuery('.preventas').find('.border-b').removeClass('bg-primary');
            jQuery('.preventas').find('.block-nd').removeClass('bg-gray-lighter');
            jQuery(registroform+' [name="preventa"]').val(response.registro.id);
            jQuery(registroform+' .preventa-tag').html('(Preventa: '+response.registro.datos_adicionales+')');
            jQuery(tabledetalles+' tbody').html('');
            var counter = 1;

            jQuery.each(response.registro.detalles, function(index, item) {
              var tr = '<tr>'+
                          '<td>'+
                              '<input type="hidden" class="input-id" name="producto['+counter+'][id]" value="'+item.producto_detalle.id+'">'+
                              '<input type="hidden" name="producto['+counter+'][productodesc]" value="'+item.producto_detalle.codigo+' - '+item.producto_detalle.descripcion+'">'+
                              '<input type="hidden" class="input-tipo" name="producto['+counter+'][tipo]" value="'+item.producto_detalle.tipo+'">'+
                          '</td>'+
                          '<td>';
              if (item.producto_detalle.tipo == 1) {
                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" step="1" min="1" max="'+item.producto_detalle.existencias+'" name="producto['+counter+'][cantidad]" value="'+item.cantidad+'"><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span></div></div></div>';
              } else if (item.producto_detalle.tipo == 2) {
                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span></div></div></div>';
              } else {
                        tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="'+item.cantidad+'"><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span></div></div></div>';
              }
                      tr += '</td>'+
                              '<td>'+
                                  item.producto_detalle.codigo+
                              '</td>'+
                              '<td>'+
                                  item.producto_detalle.descripcion+
                              '</td>'+
                              '<td>';
              if (item.producto_detalle.tipo == 1) {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+item.producto_detalle.existencias+'" readonly tabindex="-1"><span class="input-group-addon">'+item.producto_detalle.abreviatura+'</span></div></div></div>';
              } else if (item.producto_detalle.tipo == 2) {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+item.producto_detalle.duracion+'" readonly tabindex="-1"><span class="input-group-addon">'+item.producto_detalle.duracion_unidad_desc+'</span></div></div></div>';
              } else {
                          tr += '';
              }
                      tr += '</td>'+
                              '<td>'+
                                  '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+item.precio+'"></div></div></div>'+
                              '</td>'+
                              '<td>'+
                                  '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="0.00" readonly></div></div></div>'+
                              '</td>'+
                              '<td>'+
                                  '<a class="btn btn-xs btn-danger quitarfila" data-toggle="tooltip" data-placement="top" title="BORRAR"><i class="fa fa-times"></i></a>'+
                              '</td>'+
                          '</tr>';
              jQuery(tabledetalles+' tbody').append(tr);
              jQuery(registroform+' [name="producto['+counter+'][precio]"]').trigger('change');
              counter++;
            });
            jQuery(registroform+' [name="counter"]').val(parseInt(counter));
            jQuery(registroform+' [name="producto_sel"]').val(null).trigger('change');
            jQuery(preventamodal).modal('hide');
          }
        }
      });
    });

    var preventavalidate = jQuery(preventaform).validate({
      submitHandler: function(form) {
        var productos = jQuery(preventadetalles+' .input-id').length;
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
                load_preventa(true);
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', 'La preventa no tiene detalles', 'danger');
        }
      }
    });
  /**PREVenta */

  /**Cliente */
    var registroclienteform= '#registro-cliente-form';
    var registroclientemodal= '#registro-cliente-modal';
    var date = new Date(); 
    var fecha_nacimiento = new Date(date.getFullYear() - 15, date.getMonth()); 

    jQuery('body').on('click', '.btn-cliente', function() {
      jQuery(registroclienteform+' [name="id"]').val(null);
      jQuery(registroclienteform+' [name="distrito"]').html('');
      reiniciarform(registroclienteform,registroclientevalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
      jQuery('[name=fecha_nacimiento]').datepicker("setDate", fecha_nacimiento);
      jQuery(registroclientemodal).modal('toggle');
    });

    jQuery('body').on('change', registroclienteform+' [name="documento"], ' + registroclienteform+' [name="tipo_documento"]', function() {
      var documento = jQuery(registroclienteform+' [name="documento"]').val();
      var tipo_documento = jQuery(registroclienteform+' [name="tipo_documento"]').val();
      var types = [1, 6];
      jQuery(registroclienteform+' [name="nombre_o_razon_social"]').val(null);
      if(documento || types.includes(tipo_documento)){
        jQuery.ajax({
          type: "POST",
          url: base_url + "sistema/consultaDocumento",
          data: {
            tipo_documento: tipo_documento,
            documento: documento
          },
          dataType: 'json',
          timeout: 60000,
          success: function(response) {
            if(response.status=='500'){
              notifytemplate('fa fa-times', response.message, 'danger');
            }
            if(response.status=='200'){
              switch (tipo_documento) {
                case '1':
                  jQuery(registroclienteform+' [name="nombre_o_razon_social"]').val(response.data.nombres);
                  break;
                case '6':
                  jQuery(registroclienteform+' [name="nombre_o_razon_social"]').val(response.data.nombres);
                  jQuery(registroclienteform+' [name="direccion_completa"]').val(response.data.response?.direccion);
                  break;
                default:
                  break;
              }
            }
          }
        });
      }
    });

    var registroclientevalidate = jQuery(registroclienteform).validate({
      submitHandler: function(form) {
        var tipo_documento = jQuery(registroclienteform + ' [name="tipo_documento"]').val();
        var documento = jQuery(registroclienteform + ' [name="documento"]').val();
        var validar = validarTipoDocumento(tipo_documento, documento);

        if(validar.flag){
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
                load(false);
                jQuery(registroclientemodal).modal('toggle');
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', validar.message, 'danger');
          jQuery(registroclienteform + ' [name="documento"]').focus();
        }
      }
    });
  /**Cliente */

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

            jQuery(abrirmodal).modal('toggle');
          }
        }
      });
    });
  /**Caja */

  /**Ajuste */
    var nuevoajusteregistro= '.nuevoajusteregistro';
    var registroajusteform= '#registro-ajuste-form';
    var registroajustemodal= '#registro-ajuste-modal';
    jQuery('body').on('click', nuevoajusteregistro, function() {
      jQuery.ajax({
        type: "POST",
        url: base_url + "generico/detalleregistro",
        data: {
          table: 'proceso_caja',
          id: caja_id,
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
            reiniciarform(registroajusteform,registroajustevalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar');
            jQuery(registroajusteform+' [name="caja"]').val(response.registro.id);
            jQuery(registroajusteform+' [name="actual"]').val(response.registro.total).prop('readonly', true);
            jQuery(registroajusteform+' [name="ajuste"]').val('0.00');
            jQuery(registroajusteform+' [name="total"]').val(response.registro.total).prop('readonly', true);
            jQuery(registroajusteform+' [name="sucursal"]').val(response.registro.sucursaldesc);
            jQuery(registroajustemodal).modal('toggle');
          }
        }
      });
    });

    var registroajustevalidate = jQuery(registroajusteform).validate({
      submitHandler: function(form) {
        var ajuste = jQuery(registroajusteform+' [name="ajuste"]').val();
        if(ajuste != 0){
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
                detalle();
                jQuery(registroajustemodal).modal('toggle');
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', 'El ajuste no puede ser 0.00', 'danger');
        }
      }
    });

    jQuery('body').on('change', registroajusteform+' [name="ajuste"]', function() {
      var actual = parseFloat(jQuery(registroajusteform+' [name="actual"]').val());
      var ajuste = parseFloat($(this).val());
      var total = parseFloat(actual + ajuste);
      if (total < 0) {
        jQuery(registroajusteform+' [name="ajuste"]').val(actual.toFixed(2)*(-1));
        total = 0.00;
      }
      jQuery(registroajusteform+' [name="total"]').val(total.toFixed(2));
    });
  /**Ajuste */

  function load(load_detalle = true) {
    jQuery.ajax({
      type: "POST",
      url: base_url + "generico/listado",
      data: {
          table: 'proceso_producto_y_clientes',
          estado: '1',
      },
      dataType: 'json',
      timeout: 60000,
      success: function(response) {
        if(response.status=='500'){
            notifytemplate('fa fa-times', response.message, 'danger');
        }
        if(response.status=='200'){
          reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> REGISTRAR VENTA');

          jQuery(registroform+' [name="id"]').val(null);
          jQuery(registroform+' [name="preventa"]').val(null);
          jQuery(registroform+' [name="estado"]').val(1);
          jQuery(registroform+' [name="counter"]').val(0);
          jQuery(registroform+' .preventa-tag').html('');
          jQuery(tabledetalles+' tbody').html('');
          var productos_selector = '<option value="">Seleccione producto - servicio</option>';
          var membresias = '';
          var servicios = '';
          var productos = '';
          var favoritos = '';
          jQuery.each(response.data.productos, function(index, item) {
            var subdesc = '';
            var disabled = '';
            var tipo = '';
            var tipo_color = '';
            switch (item.tipo) {
              case '1':
                tipo = item.tipodesc;
                if (productos == '') productos += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'primary';
                if(item.existencias>0) {
                  subdesc = item.existencias+' '+item.abreviatura;
                } else { 
                  subdesc = 'Sin existencias';
                  disabled = 'disabled';
                }
                productos += '<option data-tipo="'+item.tipo+'" value="'+item.id+'" '+disabled+'>'+item.codigo+' | '+item.descripcion+' - '+item.categoriadesc+' ('+subdesc+')</option>';
                break;
              case '2':
                tipo = item.tipodesc;
                if (membresias == '') membresias += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'success';
                subdesc = item.duracion+' '+item.duracion_unidad_desc;
                membresias += '<option data-tipo="'+item.tipo+'" value="'+item.id+'">'+item.codigo+' | '+item.descripcion+' ('+ subdesc+')</option>';
                break;
              case '3':
                tipo = item.tipodesc;
                if (servicios == '') servicios += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'primary';
                servicios += '<option data-tipo="'+item.tipo+'" value="'+item.id+'">'+item.codigo+' | '+item.descripcion+' - '+item.categoriadesc+'</option>';
              default:
                  break;
            }

            if (item.favorito == "1") {
              favoritos += '<div class="col-xs-6 col-sm-3">'+
                          '  <a class="block block-bordered '+(disabled ? 'block-link-disabled' : 'block-link-hover3 btn-producto')+'" href="javascript:void(0)" data-tipo="'+item.tipo+'" data-producto="'+item.id+'" data-origin="button">'+
                          '      <div class="block-content block-content-mini ribbon">'+
                          '          <div class="ribbon-box text-center"><i class="fa fa-star text-warning"></i></div>'+
                          '          <div class="text-left push-5">'+
                          '              <small class="text-'+tipo_color+'">'+tipo+'</small> <small class="text-muted">'+(item.categoriadesc ? '- '+item.categoriadesc : '')+'</small>'+
                          '              <h6 class="h6">'+item.descripcion+' <small class="text-muted">'+subdesc+'</small></h6>'+
                          '          </div>'+
                          '      </div>'+
                          '  </a>'+
                          '</div>';
            }
          });
          ;
          productos_selector += productos + '</optgroup>' + membresias + '</optgroup>' + servicios + '</optgroup>';
          jQuery(registroform+' [name="producto_sel"]').html(productos_selector).trigger('change');
          jQuery(registroform+' .favoritos').html(favoritos == '' ? '<div class="col-xs-12 text-muted text-center push-15">No existen productos - servicios favoritos</div>' : favoritos);

          var clientes = '<option value="">Seleccione</option>';
          jQuery.each(response.data.clientes, function(index, item) {
            clientes += '<option value="'+item.id+'" data-tipo_documento="'+item.tipo_documento+'"x>'+item.tipodesc+ ' ' +item.documento+' | '+item.nombre_o_razon_social+'</option>';
          });
          jQuery(registroform+' [name="tipo_comprobante"]').val(99).prop('disabled',false).trigger('change');
          jQuery(registroform+' [name="cliente"]').html(clientes).val(1).prop('disabled',false).trigger('change');
          jQuery(registroform+' [name="sucursal"]').val(response.meta.sucursal);

          jQuery(registroform+' button[type="submit"]').show();
          jQuery(registroform+' .producto-div').show();
          jQuery(registroform+' [name="comprobante"]').prop('disabled',false);
          jQuery(registroform+' [name="tipo_pago"]').prop('disabled',false).trigger('change');
          jQuery(registroform+' [name="datos_adicionales"]').prop('disabled',false);
          jQuery(registroform+' [name="igv_percent"]').val(igv_id);
        }
        if(load_detalle){
          detalle();
        }
      }
    });
  };

  function detalle() {
    var total = 0.00;
    var totaltarjeta = 0.00;
    var empty ='<li>'+
                '<div class="font-w600 text-center"><i class="si si-close push-10-r text-danger"></i>Sin detalles<br><br></div>'+
              '</li>';
    jQuery(cajadetalles).html(empty);
    jQuery('.caja-date').text('-/-/-');
    jQuery('.caja-total').text('S/ ' + total.toFixed(2));
    jQuery('.caja-total-tarjeta').text('S/ ' + totaltarjeta.toFixed(2));

    if(caja_id) {
      jQuery('.block-caja').addClass('block-opt-refresh');
      jQuery.ajax({
        type: "POST",
        url: base_url + "generico/detalleregistro",
        data: {
          table: 'proceso_caja',
          id: caja_id,
          action: 'detalle',
          estado: '^5',
        },
        dataType: 'json',
        timeout: 60000,
        success: function(response) {
          jQuery('.block-caja').removeClass('block-opt-refresh');
          if(response.status=='500'){
            notifytemplate('fa fa-times', response.message, 'danger');
          }
          if(response.status=='200'){
            jQuery('.caja-date').text(response.registro.fecha_apertura_format);
            if (response.registro.detalles.length > 0) {
              jQuery(cajadetalles).html('');
              jQuery.each(response.registro.detalles, function(index, item) {
                var icon = '';
                var element = '';
                var tipo_pago = '';
                var detalle = '<div><span class="text-muted">Usuario: '+item.username+'<small class="pull-right">'+item.fecha+'</small></span></div>';
                var montostr = '';
                var monto = Number(item.monto);

                switch (item.tipo_pago) {
                  case '1':
                    tipo_pago = 'Efectivo'
                    break;
                  case '2':
                    tipo_pago = 'Tarjeta'
                    break;
                }


                switch (item.tipo_caja_detalle) {
                  case '1'://Ajuste
                    if (item.monto > 0) {
                      icon = 'fa fa-plus-circle text-info';
                      montostr = '<span class="pull-right text-success"><small>('+tipo_pago+')</small> + S/ '+monto.toFixed(2)+'</span>';
                    } else {
                      icon = 'fa fa-minus-circle text-danger';
                      montostr = '<span class="pull-right text-danger"><small>('+tipo_pago+')</small> - S/ '+Math.abs(monto).toFixed(2)+'</span>';
                    }
                    element ='<li>'+
                              '<i class="'+icon+'"></i>'+
                              '<div class="">'+
                                detalle+
                                '<div>'+
                                  '<span class="text-info">'+item.tipodesc+'</span>'+
                                  '<span class="pull-right text-danger font-w600">'+montostr+'</span>'+
                                '</div>'+
                              '</div>'+
                            '</li>';
                    break;
                  case '2'://Venta
                    icon = 'si si-basket text-success';
                    element ='<li>'+
                              '<i class="'+icon+'"></i>'+
                              '<div class="">'+
                                detalle+
                                '<div>'+
                                  '<a class="text-info link-effect" target="_blank" href="'+ base_url + 'transacciones/comprobante/' + item.referencia + '"><i class="fa fa-file-pdf-o push-5-r"></i>'+item.tipodesc+'<i class="si si-share-alt push-10-l"></i></a>'+
                                  '<span class="text-muted push-10-l">Cliente:</span> <b>'+item.clientedesc+'</b><span class="pull-right text-success font-w600"><small>('+tipo_pago+')</small> + S/ '+monto.toFixed(2)+'</span>'+
                                '</div>'+
                              '</div>'+
                            '</li>';
                    break;
                  case '3'://Anulacion de venta
                    icon = 'fa fa-ban';
                    element ='<li class="text-muted">'+
                              '<i class="'+icon+'"></i>'+
                              '<div class="">'+
                                detalle+
                                '<div>'+
                                  '<a class="text-info link-effect" target="_blank" href="'+ base_url + 'transacciones/comprobanteAnulacion/' + item.referencia + '"><i class="fa fa-file-pdf-o push-5-r"></i>'+item.tipodesc+'<i class="si si-share-alt push-10-l"></i></a>'+
                                  '<span class="text-muted push-10-l">Cliente:</span> <b>'+item.clientedesc+'</b><span class="pull-right font-w600"><small>('+tipo_pago+')</small> + S/ '+monto.toFixed(2)+'</span>'+
                                '</div>'+
                              '</div>'+
                            '</li>';
                    break;
                  case '4'://Ajuste por anulacion
                    icon = 'fa fa-minus-circle text-danger';
                    element ='<li>'+
                              '<i class="'+icon+'"></i>'+
                              '<div class="">'+
                                detalle+
                                '<div>'+
                                  '<span class="text-info">'+item.tipodesc+'</span>'+
                                  '<span class="pull-right text-danger font-w600"><small>('+tipo_pago+')</small> - S/ '+Math.abs(monto).toFixed(2)+'</span>'+
                                '</div>'+
                              '</div>'+
                            '</li>';
                    break;
                  default:
                    break;
                }
                jQuery(cajadetalles).append(element);
              });              
              var total = Number(response.registro.total);
              var total_tarjeta = Number(response.registro.total_tarjeta);
              jQuery('.caja-total').text('S/ ' + total.toFixed(2));
              jQuery('.caja-total-tarjeta').text('S/ ' + total_tarjeta.toFixed(2));
            }
          }
        }
      });
    }
  };

  function calcular_total() {
    var subtotales = jQuery(tabledetalles+' .input-subtotal');
    var igv_percent = parseFloat(jQuery(registroform+' [name="igv_percent"]').find("option:selected").attr('data-value'));
    var descuento_tipo = jQuery(registroform+' [name="codigo_descuento"]').find("option:selected").data('descuento_tipo');
    var descuento_cantidad = parseFloat(jQuery(registroform+' [name="codigo_descuento"]').find("option:selected").data('descuento_cantidad'));
    var igv = 0;
    var descuento = 0;
    var subtotal = 0;
    var total = 0;
    var total_inicial = 0;
    
    /**Total venta */
      jQuery.each(subtotales, function(index, item) {
        var subtotal_item = parseFloat(jQuery(item).val());
        total_inicial = total_inicial + subtotal_item; 
      });
      total_inicial = (isNaN(total_inicial) ? 0 : total_inicial.toFixed(2));
      jQuery(registroform+' [name="total_inicial"]').val(total_inicial);

      switch (descuento_tipo) {
        case '%':
          descuento = total_inicial*(descuento_cantidad/100);
          break;
        case '-':
          descuento = total_inicial<=descuento_cantidad ? total_inicial : descuento_cantidad;
          break;
        default:
          break;
      }
      jQuery(registroform+' [name="descuento"]').val(descuento.toFixed(2));

      total = total_inicial - descuento;
      total = (isNaN(total) ? 0 : total.toFixed(2));
      jQuery(registroform+' [name="total"]').val(total);

      subtotal = total*(100/(igv_percent+100));
      subtotal = (isNaN(subtotal) ? 0 : subtotal.toFixed(2));
      jQuery(registroform+' [name="subtotal"]').val(subtotal);

      igv = total-subtotal;
      igv = (isNaN(igv) ? 0 : igv.toFixed(2));
      jQuery(registroform+' [name="igv"]').val(igv);

    /**Total venta */
  }

  function load_preventa(load_preventa = true) {
    jQuery.ajax({
      type: "POST",
      url: base_url + "generico/listado",
      data: {
          table: 'proceso_producto_y_clientes',
          estado: '1',
      },
      dataType: 'json',
      timeout: 60000,
      success: function(response) {
        if(response.status=='500'){
            notifytemplate('fa fa-times', response.message, 'danger');
        }
        if(response.status=='200'){
          reiniciarform(preventaform,preventavalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> REGISTRAR PREVENTA');

          jQuery(preventaform+' [name="id"]').val(null);
          jQuery(preventaform+' [name="estado"]').val(1);
          jQuery(preventaform+' [name="counter"]').val(0);
          jQuery(preventadetalles).html('');
          var productos_selector = '<option value="">Seleccione producto - servicio</option>';
          var membresias = '';
          var servicios = '';
          var productos = '';
          var favoritos = '';
          jQuery.each(response.data.productos, function(index, item) {
            var subdesc = '';
            var disabled = '';
            var tipo = '';
            var tipo_color = '';
            switch (item.tipo) {
              case '1':
                tipo = item.tipodesc;
                if (productos == '') productos += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'primary';
                if(item.existencias>0) {
                  subdesc = item.existencias+' '+item.abreviatura;
                } else { 
                  subdesc = 'Sin existencias';
                  disabled = 'disabled';
                }
                productos += '<option data-tipo="'+item.tipo+'" value="'+item.id+'" '+disabled+'>'+item.codigo+' | '+item.descripcion+' - '+item.categoriadesc+' ('+subdesc+')</option>';
                break;
              case '2':
                tipo = item.tipodesc;
                if (membresias == '') membresias += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'success';
                subdesc = item.duracion+' '+item.duracion_unidad_desc;
                membresias += '<option data-tipo="'+item.tipo+'" value="'+item.id+'">'+item.codigo+' | '+item.descripcion+' ('+ subdesc+')</option>';
                break;
              case '3':
                tipo = item.tipodesc;
                if (servicios == '') servicios += '<optgroup label="'+tipo.toUpperCase()+'">';
                tipo_color = 'primary';
                servicios += '<option data-tipo="'+item.tipo+'" value="'+item.id+'">'+item.codigo+' | '+item.descripcion+' - '+item.categoriadesc+'</option>';
              default:
                  break;
            }

            if (item.favorito == "1") {
              favoritos += '<div class="col-xs-6 col-sm-3">'+
                          '  <a class="block block-bordered '+(disabled ? 'block-link-disabled' : 'block-link-hover3 btn-producto')+'" href="javascript:void(0)" data-tipo="'+item.tipo+'" data-producto="'+item.id+'" data-origin="button">'+
                          '      <div class="block-content block-content-mini ribbon">'+
                          '          <div class="ribbon-box text-center"><i class="fa fa-star text-warning"></i></div>'+
                          '          <div class="text-left push-5">'+
                          '              <small class="text-'+tipo_color+'">'+tipo+'</small> <small class="text-muted">'+(item.categoriadesc ? '- '+item.categoriadesc : '')+'</small>'+
                          '              <h6 class="h6">'+item.descripcion+' <small class="text-muted">'+subdesc+'</small></h6>'+
                          '          </div>'+
                          '      </div>'+
                          '  </a>'+
                          '</div>';
            }
          });
          ;
          productos_selector += productos + '</optgroup>' + membresias + '</optgroup>' + servicios + '</optgroup>';
          jQuery(preventaform+' [name="producto_sel"]').html(productos_selector).trigger('change');
          jQuery(preventaform+' .favoritos').html(favoritos == '' ? '<div class="col-xs-12 text-muted text-center push-15">No existen productos - servicios favoritos</div>' : favoritos);

          var clientes = '<option value="">Seleccione</option>';
          jQuery.each(response.data.clientes, function(index, item) {
            clientes += '<option value="'+item.id+'" data-tipo_documento="'+item.tipo_documento+'"x>'+item.tipodesc+ ' ' +item.documento+' | '+item.nombre_o_razon_social+'</option>';
          });
        }
        if(load_preventa){
          preventas_();
        }
      }
    });
  };

  function preventas_() {
    var empty ='<div class="col-xs-12 text-muted text-center push-15">No existen preventas registradas</div>';

    jQuery.ajax({
      type: "POST",
      url: base_url + "generico/listado",
      data: {
        table: 'proceso_preventa',
        estado: '1',
      },
      dataType: 'json',
      timeout: 60000,
      success: function(response) {
        jQuery('.block-caja').removeClass('block-opt-refresh');
        if(response.status=='500'){
          notifytemplate('fa fa-times', response.message, 'danger');
        }
        if(response.status=='200'){
          jQuery(preventas).html('');
          if (response.data.length > 0) {
            jQuery.each(response.data, function(index, item) {
              var element = '';
              var total = Number(item.total);

              element ='<div class="col-xs-12 col-sm-4">'+
                '<div class="block block-bordered text-center">'+
                  '<div class="block-content block-content-mini border-b">'+
                    '<div class="block-options-simple btn-group btn-group-xs">'+
                      '<button class="btn btn-success editar_preventa" data-id="'+item.id+'" type="button" data-toggle="tooltip" title="EDITAR"><i class="fa fa-edit"></i></button>'+
                      '<button class="btn btn-info convertir_venta" data-id="'+item.id+'" type="button" data-toggle="tooltip" title="CONVERTIR A VENTA"><i class="si si-action-redo"></i></button>'+
                      '<button class="btn btn-danger eliminar_preventa" data-id="'+item.id+'" type="button" data-toggle="tooltip" title="BORRAR"><i class="fa fa-times"></i></button>'+
                    '</div>'+
                    '<div class="h6 text-left text-uppercase"><i class="si si-tag text-info push-10-r"></i> '+(item.datos_adicionales || '-')+'</div>'+
                  '</div>'+
                  '<div class="block-content block-content-mini block-nd">'+
                    '<div class="h2 font-w400"><span class="h4 text-muted">S/</span> '+total.toFixed(2)+'</div>'+
                    '<hr class="mini">'+
                    '<i class="si si-calendar text-info push-10-r"></i>'+item.fecha+'<i class="si si-user text-info push-10-l push-10-r"></i>'+item.username+
                  '</div>'+
                '</div>'+
              '</div>';

              jQuery(preventas).append(element);
            });              
          } else {
            jQuery(preventas).append(empty);
          }
        }
      }
    });
  };

  function calcular_total_preventa() {
    var subtotales = jQuery(preventadetalles+' .input-subtotal');
    var total = 0;
    
    jQuery.each(subtotales, function(index, item) {
      var subtotal_item = parseFloat(jQuery(item).val());
      total = total + subtotal_item; 
    });

    total = (isNaN(total) ? 0 : total.toFixed(2));
    jQuery(preventaform+' [name="total"]').val(total);
  }

  function validar_tipo_documento() {
    var tipo_comprobante = jQuery(registroform+' [name="tipo_comprobante"]').val();
    var tipo_documento = jQuery(registroform+' [name="cliente"]').find("option:selected").data('tipo_documento');
    console.log(tipo_comprobante);
    console.log(tipo_documento);
    jQuery(registroform+' button[type="submit"]').prop('disabled',false);

    if(tipo_comprobante && tipo_documento){
      switch (tipo_comprobante) {
        case '1'://FACTURA
          if (tipo_documento != 6) {
            notifytemplate('fa fa-times', 'Solo de puede crear una FACTURA a clientes con RUC', 'danger');
            jQuery(registroform+' button[type="submit"]').prop('disabled',true);
          }
          break;
        case '3'://BOLETA
          break;
        default:
          break;
      }
    }
  }

  /*jQuery('body').on('focus','.input-cantidad', function() {
    var that = this;
    setTimeout(function(){ that.selectionStart = that.selectionEnd = 10000; }, 0);
  });*/

  load();
});
