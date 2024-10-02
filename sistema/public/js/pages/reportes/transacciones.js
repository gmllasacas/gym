
jQuery(function () {
    var date = new Date(); 
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1); 
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0); 
    var registromodal= '#registro-modal';
    var registroform= '#registro-form';
    var editarregistro= '.editarregistro';
    var exportarexcel= '.exportar-excel';
    //jQuery('[name=fechainicio]').datepicker("setDate", firstDay);

    /**Reporte contable */
      var busquedaform= '#busqueda-form';
      var tablelist= '#table-list';
      var tabledetalles= '#table-detalles';
      var cantidad = 0;
      var subtotal = 0;
      var igv = 0;
      var total = 0;

      jQuery(busquedaform+' [name="fechainicio"]').datepicker({
        format: "yyyy-mm",
        viewMode: "months", 
        minViewMode: "months",
        language:'es'
      });
      jQuery('[name=fechainicio]').datepicker("setDate", firstDay);

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
                  var comprobante = response.data[i]['comprobante'].split('-');

                  response.data[i]['codigo_operacion']='';
                  response.data[i]['fecha_vcto']='';
                  response.data[i]['tipo_comprobante']='0'+response.data[i]['tipo_comprobante'];
                  response.data[i]['serie']=comprobante[0];
                  response.data[i]['numeracion']=comprobante[1] ?? '';
                  response.data[i]['valor_facturado_exp']='-';
                  response.data[i]['importe_op_ex']='-';
                  response.data[i]['importe_op_ina']='-';
                  response.data[i]['isc']='-';
                  response.data[i]['icbp']='-';
                  response.data[i]['otros']='-';
                  response.data[i]['tipo_de_cambio']='';
                  response.data[i]['original_fecha']='';
                  response.data[i]['original_tipo']='';
                  response.data[i]['original_serie']='';
                  response.data[i]['original_numero']='';

                  subtotal = subtotal + parseFloat(response.data[i]['subtotal']);
                  igv = igv + parseFloat(response.data[i]['igv']);
                  total = total + parseFloat(response.data[i]['total']);
                }
                cantidad = response.data.length;
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
          { data: 'codigo_operacion' },
          { data: 'fecha' },
          { data: 'fecha_vcto' },
          { data: 'tipo_comprobante' },
          { data: 'serie' },
          { data: 'numeracion' },
          { data: 'cliente_tipo_doc' },
          { data: 'cliente_documento' },
          { data: 'cliente_nombre_o_razon_social' },
          { data: 'valor_facturado_exp' },
          { data: 'subtotal' },
          { data: 'importe_op_ex' },
          { data: 'importe_op_ina' },
          { data: 'isc' },
          { data: 'igv' },
          { data: 'icbp' },
          { data: 'otros' },
          { data: 'total' },
          { data: 'tipo_de_cambio' },
          { data: 'original_fecha' },
          { data: 'original_tipo' },
          { data: 'original_serie' },
          { data: 'original_numero' },
        ],
        columnDefs: [
          /*{
              targets: [-2,-1],
              className: 'dt-body-center'
          },*/
        ],
        buttons: false,
        ordering: false,
        bAutoWidth: false,
        initComplete: function () {
          totales();
        },
      });
    
      function totales() { 
        jQuery(tablelist+' .cantidad').html(cantidad+' Registros');
        jQuery(tablelist+' .subtotal').html(subtotal.toFixed(2));
        jQuery(tablelist+' .igv').html(igv.toFixed(2));
        jQuery(tablelist+' .total').html(total.toFixed(2));
      };

      var busquedavalidate = jQuery(busquedaform).validate({
        submitHandler: function(form) {
          listdt.ajax.reload(totales);
        }
      });
      jQuery('#table-list_filter').hide();

      jQuery('body').on('click', exportarexcel, function() {
        var fecha = jQuery(busquedaform+' [name="fechainicio"]').val();
        var url = base_url + 'reportes/reporteContable/' + fecha;
        window.open(url, '_blank');
      });
    /**Reporte contable */
});
