
jQuery(function () {
    if (crear_contrasena == true) {
        jQuery('.nav-tabs a[href="#crear_contrasena"]').tab('show');
    }

    jQuery('#recuperacionbtn').click(function(){
        reiniciarform('#form-login-rec', formloginrecval, 'sistema/recuperar','<i class="si si-envelope push-5-r"></i>Enviar correo');
        jQuery('.nav-tabs a[href="#recuperacion"]').tab('show');
    });

    jQuery('.ingresobtn').click(function(){
        reiniciarform('#form-login', formloginval, 'sistema/login','<i class="si si-login push-5-r"></i>Ingresar');
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
            var recaptcha_response = grecaptcha.getResponse();
            if (!recaptcha_response) {
                notifytemplate('fa fa-times', 'El captcha es requerido', 'danger', 4000);
            } else {
                jQuery.ajax({
                    url: form.action,
                    type: form.method,
                    data: $(form).serialize() + '&recaptcha_response=' + recaptcha_response,
                    dataType: 'json',
                    timeout: 60000,
                    success: function(response) {
                        if(response.status=='500'){
                            notifytemplate('fa fa-times', response.message, 'danger', 4000);
                        }
                        if(response.status=='200'){
                            notifytemplate('fa fa-check', response.message, 'success', 2000, false, 2001);
                            setTimeout(function(){
                                window.location.href = response.redirect;
                            }, 1500);
                        }
                    }
                });
            }
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
                        reiniciarform('#form-login-rec', formloginrecval, 'sistema/recuperar','<i class="si si-envelope push-5-r"></i>Enviar correo');
                        jQuery(modalrec).modal('toggle');
                        jQuery('.nav-tabs a[href="#ingreso"]').tab('show');
                    }
                }
            });
        }
    });

});