
jQuery(function () {
    var ajaxflagunblock = true;

    /***Funciones***/
        function blockpage(mensaje) {
            jQuery.blockUI({ 
                css: { 
                    border: 'none', 
                    padding: '15px', 
                    backgroundColor: '#000', 
                    '-webkit-border-radius': '10px', 
                    '-moz-border-radius': '10px', 
                    opacity: 1, 
                    color: '#fff',
                },
                baseZ: 2000, 
                message: mensaje
            });
        }
        
        function reiniciarform(idform, formvalidate) {
            jQuery(idform)[0].reset();
            jQuery(idform).find('.form-group').removeClass('has-error');
            if(formvalidate==''){}else{ formvalidate.resetForm(); }
        }

        function notifytemplate(icon, message, type,delay=2000) {
            jQuery.notify({
                icon: icon,
                message: message
                },{
                element: 'body',
                type: type,
                allow_dismiss: true,
                newest_on_top: true,
                showProgressbar: false,
                mouse_over: 'pause',
                offset: 20,
                spacing: 10,
                z_index: 2001,
                delay: delay,
                animate: {
                    enter: 'animated fadeIn',
                    exit: 'animated fadeOutDown'
                }
            });
        }

        jQuery( document ).ajaxStart(function() {
            blockpage('<h1><i class="fa fa-cog fa-spin fa-fw"></i> Procesando</h1>');
        });
        jQuery( document ).ajaxError(function(event, xhr, textStatus, errorThrown) {
            ajaxflagunblock = true;
            jQuery.unblockUI();
            notifytemplate('fa fa-times', 'Sin conexión', 'danger');
        });
        jQuery( document ).ajaxSuccess(function() {
            if(ajaxflagunblock){
                jQuery.unblockUI();
            }
        });
        jQuery.validator.addClassRules('required', {
            required: true
        });
        jQuery.validator.addClassRules('email', {
            email: true
        });
        jQuery.validator.addClassRules('textoinput', {
            minlength: 2,
            maxlength: 255
        });
        jQuery.validator.addClassRules('textoareainput', {
            maxlength: 1000,
        });
        jQuery.validator.addClassRules('passwordinput', {
            minlength: 8
        });
        jQuery.validator.addClassRules('digits', {
            digits: true
        });
        jQuery.validator.addClassRules('number', {
            number: true
        });
        jQuery.extend(jQuery.validator.messages, {
            required: jQuery.validator.format("Obligatorio"),
            equalTo: jQuery.validator.format("Campo diferente a {0}"),
            minlength: jQuery.validator.format("Mínimo {0} caracteres"),
            maxlength: jQuery.validator.format("Máximo {0} caracteres"),
            digits: jQuery.validator.format("Solo dígitos"),
            email: jQuery.validator.format("Correo inválido"),
            number: jQuery.validator.format("Número inválido"),
            min: jQuery.validator.format("Mínimo: {0}"),
            max: jQuery.validator.format("Máximo: {0} ")
        });
        jQuery.validator.setDefaults({ 
            ignore: ":hidden",
            errorClass: 'help-block text-right animated fadeInDown',
            errorElement: 'div',
            errorPlacement: function(error, e) {
                jQuery(e).parents('.form-group > div').append(error);
            },
            highlight: function(e) {
                jQuery(e).closest('.form-group').removeClass('has-error').addClass('has-error');
                jQuery(e).closest('.help-block').remove();
            },
            success: function(e) {
                jQuery(e).closest('.form-group').removeClass('has-error');
                jQuery(e).closest('.help-block').remove();
            },
        });
    /***Funciones***/

    jQuery('.js-masked-ruc').mask('99999999999',{autoclear: false});

    if (crear_contrasena == true) {
        jQuery('.nav-tabs a[href="#crear_contrasena"]').tab('show');
    }

    jQuery('#recuperacionbtn').click(function(){
        reiniciarform('#form-login-rec', formloginrecval);
        jQuery('.nav-tabs a[href="#recuperacion"]').tab('show');
    });

    jQuery('.ingresobtn').click(function(){
        reiniciarform('#form-login', formloginval);
        jQuery('.nav-tabs a[href="#ingreso"]').tab('show');
    });

    var modalrec = '#modal-rec';
    var modalcrear = '#modal-crear';
    var redirect = '';

    var formloginval=jQuery('#form-login').validate({
        rules: {
            'ruc': {
            },
            'username': {
            },
        },
        messages: {
            'ruc': {
                required: 'Ingrese número de RUC',
            },
            'username': {
                required: 'Ingrese usuario',
            }
        },
        submitHandler: function(form) {
            jQuery.ajax({
                url: form.action,
                type: form.method,
                data: $(form).serialize(),
                dataType: 'json',
                timeout: 60000,
                success: function(response) {
                    if(response.status=='500'){
                        notifytemplate('fa fa-times', response.message, 'danger', 4000);
                    }
                    if(response.status=='200'){
                        ajaxflagunblock = false;
                        notifytemplate('fa fa-check', response.message, 'success');
                        setTimeout(function(){
                            window.location.href = response.redirect;
                            ajaxflagunblock = true;
                        }, 1000);
                    }
                }
            });
        }
    });

    var formlogincrearval=jQuery('#form-login-crear').validate({
        rules: {
            'password2': {
                equalTo: '#password3'
            },
        },
        messages: {
            'password2': {
                equalTo: 'Contraseña ingresada diferente',
            },
        },
        submitHandler: function(form) {
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
                    if(response.status=='201'){
                        notifytemplate('fa fa-check', response.message, 'success');
                        reiniciarform('#form-login-crear', formlogincrearval);
                        jQuery(modalcrear).modal('toggle');
                        redirect = response.redirect;
                    }
                }
            });
        }
    });

    jQuery(modalcrear).on('hidden.bs.modal', function (e) {
        blockpage('<h1><i class="fa fa-cog fa-spin fa-fw"></i> Redireccionando</h1>');
        setTimeout(function(){
            window.location.href = redirect;
            ajaxflagunblock = true;
        }, 1500);
    })

    var formloginrecval=jQuery('#form-login-rec').validate({
        submitHandler: function(form) {
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
                    if(response.status=='201'){
                        reiniciarform('#form-login-rec',formloginrecval);
                        jQuery(modalrec).modal('toggle');
                        jQuery('.nav-tabs a[href="#ingreso"]').tab('show');
                    }
                }
            });
        }
    });

});