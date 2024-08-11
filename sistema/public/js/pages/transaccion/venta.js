
jQuery(function () {

  /**Venta */
    var registroform= '#registro-form';
    var tabledetalles= '#table-detalles';
    var cajadetalles= '.caja-detalles';

    jQuery('body').on('click', '.quitarfila', function() {
      $(this).tooltip('hide');
      $(this).closest("tr").remove();
      calcular_total();
    });

    jQuery('body').on('change', tabledetalles+' .input-cantidad', function() {
      var cantidad = parseFloat($(this).closest('tr').find('.input-cantidad').val());
      if(cantidad == 0){ 
        $(this).closest("tr").remove(); 
        calcular_total();
      }else{
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
      }
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
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" step="1" min="0" max="'+response.registro.existencias+'" name="producto['+counter+'][cantidad]" value=""><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
                } else {
                          tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control input-cantidad required" type="number" name="producto['+counter+'][cantidad]" value="1" readonly><span class="input-group-addon">'+response.registro.abreviatura+'</span></div></div></div>';
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
                } else {
                            tr += '<div class="form-group"><div class="col-xs-12"><div class="input-group"><input class="form-control" type="text" value="'+response.registro.duracion+'" readonly tabindex="-1"><span class="input-group-addon">'+response.registro.duracion_unidad_desc+'</span></div></div></div>';
                }
                        tr += '</td>'+
                                '<td>'+
                                    '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-precio required" type="number" step="0.01" min="0" name="producto['+counter+'][precio]" value="'+response.registro.precio+'"></div></div></div>'+
                                '</td>'+
                                '<td>'+
                                    '<div class="form-group"><div class="col-xs-12"><div class="input-group"><span class="input-group-addon">S/</span><input class="form-control input-subtotal required" type="text" name="producto['+counter+'][subtotal]" value="0.00" readonly></div></div></div>'+
                                '</td>'+
                                '<td>'+
                                    '<a class="btn btn-xs btn-danger quitarfila" data-toggle="tooltip" data-placement="top" title="Eliminar detalle"><i class="fa fa-times"></i></a>'+
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

    jQuery('body').on('click', '.clear-form', function() {
      load(false);
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
                load();
              }
            }
          });
        }else{
          notifytemplate('fa fa-times', 'La venta no tiene detalles', 'danger');
        }
      }
    });
  /**Venta */

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
          reiniciarform(registroform,registrovalidate,'generico/nuevoregistro','<i class="fa fa-plus push-5-r"></i> Registrar venta');
          jQuery(registroform+' [name="id"]').val(null);
          jQuery(registroform+' [name="estado"]').val(1);
          jQuery(registroform+' [name="counter"]').val(0);
          jQuery(tabledetalles+' tbody').html('');
          var productos_selector = '<option value="">Seleccione</option>';
          var servicios = '<optgroup label="Servicios">';
          var productos = '<optgroup label="Productos">';
          var favoritos = '';
          jQuery.each(response.data.productos, function(index, item) {
            var subdesc = '';
            var disabled = '';
            var tipo = '';
            var tipo_color = '';
            switch (item.tipo) {
              case '1':
                tipo = 'Producto';
                tipo_color = 'primary';
                if(item.existencias>0) {
                  subdesc = item.existencias+' '+item.abreviatura;
                } else { 
                  subdesc = 'Sin existencias';
                  disabled = 'disabled';
                }
                productos += '<option data-tipo="'+item.tipo+'" value="'+item.id+'" '+disabled+'>'+item.codigo+' - '+item.descripcion+' ('+subdesc+')</option>';
                break;
              case '2':
                tipo = 'Servicio';
                tipo_color = 'success';
                subdesc = item.duracion+' '+item.duracion_unidad_desc;
                servicios += '<option data-tipo="'+item.tipo+'" value="'+item.id+'" '+disabled+'>'+item.codigo+' - '+item.descripcion+' ('+ subdesc+')</option>';
              default:
                  break;
            }

            if (item.favorito == "1") {
              favoritos += '<div class="col-xs-4 col-sm-3">'+
                          '  <a class="block block-bordered '+(disabled ? 'block-link-disabled' : 'block-link-hover3 btn-producto')+'" href="javascript:void(0)" data-tipo="'+item.tipo+'" data-producto="'+item.id+'" data-origin="button">'+
                          '      <div class="block-content block-content-mini ribbon ribbon-modern ribbon-'+tipo_color+' ribbon-bottom">'+
                          '          <div class="ribbon-box font-w600">'+tipo+'</div>'+
                          '          <div class="text-left push-5">'+
                          '              <h5 class="h6">'+item.descripcion+'</h5>'+
                          '              <small class="text-muted">'+subdesc+'</small>'+
                          '          </div>'+
                          '      </div>'+
                          '  </a>'+
                          '</div>';
            }

          });
          ;
          productos_selector += servicios + '</optgroup>' + productos + '</optgroup>';
          jQuery(registroform+' [name="producto_sel"]').html(productos_selector).trigger('change');
          jQuery(registroform+' .favoritos').html(favoritos);

          var clientes = '<option value="">Seleccione</option>';
          jQuery.each(response.data.clientes, function(index, item) {
            clientes += '<option value="'+item.id+'">'+item.documento+' - '+item.nombre_o_razon_social+'</option>';
          });
          jQuery(registroform+' [name="cliente"]').html(clientes).trigger('change');
          jQuery(registroform+' [name="sucursal"]').val(response.meta.sucursal);

          jQuery(registroform+' button[type="submit"]').show();
          jQuery(registroform+' .producto-div').show();
          jQuery(registroform+' [name="cliente"]').prop('disabled',false);
          jQuery(registroform+' [name="tipo_comprobante"]').prop('disabled',false);
          jQuery(registroform+' [name="comprobante"]').prop('disabled',false);
          jQuery(registroform+' [name="tipo_pago"]').prop('disabled',false).trigger('change');
          jQuery(registroform+' [name="datos_adicionales"]').prop('disabled',false);
        }
        if(load_detalle){
          detalle();
        }
      }
    });
  };

  function detalle() {
    var total = 0.00;
    var empty ='<li>'+
              '    <i class="si si-close text-danger"></i>'+
              '    <div class="font-w600 text-center">Sin detalles<br><br></div>'+
              '</li>';

    jQuery('.caja-date').text('-/-/-');
    jQuery('.caja-total').text('S/ ' + total.toFixed(2));

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
            jQuery(cajadetalles).html('');
            if (response.registro.detalles.length > 0) {
              var total = 0.00;
              jQuery.each(response.registro.detalles, function(index, item) {
                var icon = '';
                var element = '';
                var montostr = '';
                var monto = Number(item.monto);
                switch (item.tipo_caja_detalle) {
                  case '1':
                    if (item.monto > 0) {
                      icon = 'si si-shuffle text-info';
                      montostr = '<span class="pull-right text-success">+ S/ '+monto.toFixed(2)+'</span>';
                    } else {
                      icon = 'si si-share-alt text-danger';
                      montostr = '<span class="pull-right text-danger">- S/ '+Math.abs(monto).toFixed(2)+'</span>';
                    }
                    element ='<li>'+
                            '  <i class="'+icon+'"></i>'+
                            '  <div class="font-w600"><span class="text-muted">Usuario:</span> '+item.username+' '+montostr+'</div>'+
                            '  <div><span class="text-info">'+item.tipodesc+'</span></div>'+
                            '  <div><small class="text-muted">'+item.fecha+'</small></div>'+
                            '</li>';
                    break;
                  case '2':
                    icon = 'si si-wallet text-success';
                    element ='<li>'+
                            '  <i class="'+icon+'"></i>'+
                            '  <div class="font-w600"><span class="text-muted">Cliente:</span> '+item.clientedesc+' <br> <span class="text-muted">Usuario:</span> '+item.username+' <span class="pull-right text-success">+ S/ '+monto.toFixed(2)+'</span></div>'+
                            '  <div><a class="text-info link-effect" href="#"><i class="fa fa-file-pdf-o push-5-r"></i>'+item.tipodesc+'</a></div>'+
                            '  <div><small class="text-muted">'+item.fecha+'</small></div>'+
                            '</li>';
                    break;
                  default:
                    break;
                }
                jQuery(cajadetalles).append(element);
                total = total + monto;
              });              
              jQuery('.caja-date').text(response.registro.fecha_apertura);
              jQuery('.caja-total').text('S/ ' + total.toFixed(2));
            }
          }
        }
      });
    } else {
      jQuery(cajadetalles).append(empty);
    }
  };

  function calcular_total() {
    var subtotales = jQuery(tabledetalles+' .input-subtotal');
    var igv_percent = parseFloat(jQuery(registroform+' [name="igv"]').data('igv'));
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

  load();
});
