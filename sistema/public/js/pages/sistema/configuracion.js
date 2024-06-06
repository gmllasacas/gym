
jQuery(function () {
    
    jQuery('.js-masked-dni').mask('99999999',{autoclear: false});
    jQuery('.js-masked-ruc').mask('99999999999',{autoclear: false});
    enviobtn(jQuery('#envio').data('envio'));
    //jQuery('#ruc').trigger('input');
    
    var registroform= '#registro-form';

    jQuery('body').on('click', '#editarlogo', function() {
        jQuery(registroform+' [name=logo]').trigger('click');
    });

    jQuery('body').on('click', '#editardashboard', function() {
        jQuery(registroform+' [name=dashboard]').trigger('click');
    });

    var registrovalidate = jQuery(registroform).validate({
        rules: {
            'ruc': {
            },
        },
        messages: {
            'ruc': {
                required: 'Ingrese número de RUC',
            },
        },
        submitHandler: function(form) {
            event.preventDefault();
            var data =new FormData(form);
            jQuery.ajax({
                url: form.action,
                type: form.method,
                data: data,
                contentType: false,
                cache: false,
                processData:false,
                dataType: 'json',
                timeout: 300000,
                success: function(response) {
                    if(response.status=='500'){
                        notifytemplate('fa fa-times', response.message, 'danger');
                    }
                    if(response.status=='200'){
                        notifytemplate('fa fa-check', 'Configuración guardada', 'success');
                    }
                    if(response.status=='201'){
                        notifytemplate('fa fa-check', 'Configuración guardada', 'success');
                    }
                }
            });
        }
    });

    function enviobtn(envio) {
        if(envio==1){
            jQuery('#envio').data('envio',0);
            jQuery('#envio').data('texto','desactivará');
            stringbtn='<div class="block-content block-content-full">'+
                            '	<span class="item item-circle bg-success-light"><i class="fa fa-check text-success"></i></span>'+
                            '</div>'+
                            '<div class="block-content block-content-full block-content-mini text-uppercase bg-gray-lighter text-success font-w600">Envío activado</div>';
        }else{
            jQuery('#envio').data('envio',1);
            jQuery('#envio').data('texto','activará');
            stringbtn='<div class="block-content block-content-full">'+
                            '	<span class="item item-circle bg-danger-light"><i class="fa fa-times text-danger"></i></span>'+
                            '</div>'+
                            '<div class="block-content block-content-full block-content-mini text-uppercase bg-gray-lighter text-danger font-w600">Envío desactivado</div>';
        }
        jQuery('#envio').html(stringbtn);
    }

    jQuery('body').on('click', '#envio', function() {
        var elemento = jQuery(this);
        jQuery.confirm({
            icon: 'fa fa-warning',
            title: 'Confirmación',
            content: 'Se '+ elemento.data('texto')+' el envío',
            type: 'blue',
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
                            data: 'table=' + elemento.data('table') + '&id=' + elemento.data('id') + '&envio=' + elemento.data('envio'),
                            dataType: 'json',
                            timeout: 60000,
                            success: function(response) {
                                if(response.status=='500'){
                                    notifytemplate('fa fa-times', response.message, 'danger');
                                }
                                if(response.status=='201'){
                                    enviobtn(elemento.data('envio'));
                                    notifytemplate('fa fa-check', 'Configuración guardada', 'success');
                                }
                            }
                        });
                    }
                }
            }
        });
    });
});