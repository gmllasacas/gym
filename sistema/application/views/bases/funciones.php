        <script src="<?php echo base_url();?>public/js/plugins/chartjs/Chart.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/jquery.dataTables.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-maxlength/bootstrap-maxlength.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datepicker/bootstrap-datepicker.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datepicker/locales/bootstrap-datepicker.es.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datetimepicker/moment.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datetimepicker/bootstrap-datetimepicker.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-datetimepicker/locale/es.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-wizard/jquery.bootstrap.wizard.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-notify/bootstrap-notify.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/bootstrap-confirmation/bootstrap-confirmation.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/select2/select2.full.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/dropzonejs/dropzone.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-tags-input/jquery.tagsinput.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-validation/jquery.validate.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-validation/additional-methods.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/masked-inputs/jquery.maskedinput.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/ion-rangeslider/js/ion.rangeSlider.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/magnific-popup/magnific-popup.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/dataTables.buttons.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/jszip.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/pdfmake.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/vfs_fonts.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/buttons.html5.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/buttons.print.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/datatables_ini.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/dataTables.checkboxes.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/datatables/absolute.min.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/highcharts/highcharts.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/highcharts/modules/drilldown.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-blockui/jquery.blockUI.js"></script>
        <script src="<?php echo base_url();?>public/js/plugins/jquery-confirm/jquery-confirm.min.js"></script>
        <script>
            jQuery(function () {
                App.initHelpers(['datepicker','datetimepicker','maxlength', 'select2', 'tags-inputs', 'slimscroll', 'notify', 'table-tools', 'masked-inputs', 'rangeslider', 'magnific-popup']);
            });
            var base_server ='<?php echo (isset($_SERVER['HTTPS']) && $_SERVER['HTTPS'] === 'on' ? "https" : "http") . "://$_SERVER[HTTP_HOST]";?>';
            var base_url ='<?php echo base_url();?>';
            var ajax_timeout ='<?php echo $this->config->item('ajax_timeout');?>';
            var perfil ='<?php echo $this->session->userdata('perfil'); ?>';
            var sucursal ='<?php echo $this->session->userdata('sucursal'); ?>';
            var crear_contrasena = <?php echo ($crear_contrasena ?? 'false'); ?>;
            var select2_enabled = true;
            var blockUI_message = ' Procesando';
        </script>
        <script type="text/javascript">
            /***Funciones generales***/
                var ajaxflagunblock = true;

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
                
                function reiniciarform(idform, formvalidate, url, botonhtml) {
                    jQuery(idform)[0].reset();
                    jQuery(idform).find('.form-group').removeClass('has-error');
                    jQuery(idform).find('.select2').val('').trigger("change");
                    if(formvalidate==''){}else{ formvalidate.resetForm(); }
                    jQuery(idform).attr("action", base_url + url);
                    jQuery(idform+' button[type="submit"]').html(botonhtml);
                }

                function notifytemplate(icon, message, type, delay = 2000, flag = true, z_index = 1051) {
                    ajaxflagunblock = flag;
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
                        z_index: z_index,
                        delay: delay,
                        animate: {
                            enter: 'animated fadeIn',
                            exit: 'animated fadeOutDown'
                        }
                    });
                }

                function datatabletemplate(idtable,lengthChange=true) {
                    var tabletemp =jQuery(idtable).DataTable({
                        buttons: false,
                        columnDefs: [ { orderable: false, targets: [-1]} ],
                        order: [],
                        lengthChange: lengthChange,
                        pageLength: 10,
                        lengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
                        bAutoWidth: false
                    });
                    return tabletemp;
                }

                function formatMembresia(data) {
                    var color = '';
                    var dias_filter = '';
                    var dias = data['dias'];
                    var diasstr = '';

                    if(dias == '') {
                        color = 'info';
                        dias_filter = 'Sin membresía';
                    } else {
                        if(dias > 7) {
                            color = 'success';
                            dias_filter = 'Activa';
                        } else if(dias >= 0) {
                            color = 'warning';
                            dias_filter = 'Por vencer';
                        } else if(dias < 0) {
                            dias = '&lt 0'; //< 0
                            color = 'danger';
                            dias_filter = 'Vencida';
                        }
                        diasstr = '<span class="text-'+color+'">'+dias+'</span>';
                    }
                    
                    return {
                        'dias' : dias,
                        'diasstr' : diasstr,
                        'etiqueta' : '<label class="label label-'+color+'">'+dias_filter+'</label>',
                        'dias_filter' : dias_filter
                    }
                }

                function validarTipoDocumento(tipo_documento, documento) {
                    var flag = false;
                    var message = '';

                    switch (tipo_documento) {
                        case '1': //DNI
                            if(documento.length == 8) flag = true;
                            else message = 'El número de documento debe tener 8 dígitos';
                            break;
                        case '4': //CARNET DE EXTRANJERIA
                            if(documento.length <= 12) flag = true;
                            else message = 'El número de documento debe como máximo 12 caracteres';
                            break;
                        case '6': //RUC
                            if(documento.length == 11) flag = true;
                            else message = 'El número de documento debe tener 11 dígitos';
                            break;
                        default:
                            flag = false;
                            break;
                    }
                    
                    return {
                        'flag' : flag,
                        'message' : message
                    };
                }

            /***Funciones generales***/

            jQuery(function () {
            
                /*****Generales********/
                    var width = $(window).width();

                    /*jQuery('form').on('keyup keypress', function(e) {
                        var keyCode = e.keyCode || e.which;
                        if (keyCode === 13) { 
                            e.preventDefault();
                            return false;
                        }
                    });*/

                    jQuery('body').on('click', '.toTop', function(e) {
                        $('html, body').animate({
                            scrollTop: $("#tabreg").offset().top
                        }, 100);
                    });

                    jQuery('body').on('focusout', '.validarfixed', function() {
                        if(jQuery(this).val()!=''){
                            var numero = parseFloat(jQuery(this).val()) || 0;
                            jQuery(this).val(numero.toFixed(3));
                        }
                    });

                    if(width <769){
                        select2_enabled = false;
                        blockUI_message = '';
                        if (jQuery('select.select2').data('select2')) {
                            jQuery('select.select2').select2("destroy");
                        }
                    }else{
                        jQuery('select.select2').select2();
                        jQuery('body').tooltip({
                            selector: '[data-toggle=tooltip]',
                            trigger: "hover",
                            animation: true,
                            html: true,
                            container: 'body'
                        });
                    }

                    jQuery.fn.modal.Constructor.prototype.enforceFocus = function() {};
                    jQuery.fn.select2.amd.require(["select2/dropdown/attachBody", "select2/utils"], function(AttachBody, Utils){
                        AttachBody.prototype._attachPositioningHandler = function (decorated, container) {
                            var self = this;
                            var scrollEvent = "scroll.select2." + container.id;
                            var resizeEvent = "resize.select2." + container.id;
                            var orientationEvent = "orientationchange.select2." + container.id;
                            var $watchers = this.$container.parents().filter(Utils.hasScroll);
                            $watchers.each(function () {
                                $(this).data("select2-scroll-position", {
                                    x: $(this).scrollLeft(),
                                    y: $(this).scrollTop()
                                });
                            });
                            $watchers.on(scrollEvent, function (ev) {
                                var position = $(this).data("select2-scroll-position");
                                $(self).scrollTop(position.y); // patch: this => self
                            });
                            $(window).on(scrollEvent + " " + resizeEvent + " " + orientationEvent,
                                function (e) {
                                    self._positionDropdown();
                                    self._resizeDropdown();
                                }
                            );
                        };
                    });

                    jQuery('.js-select2-filtro, .select2').on('change', function (evt) {
                        jQuery('.select2-selection__rendered').removeAttr('title');
                    });
                /*****Generales********/

                /***Validate***/
                    jQuery.validator.setDefaults({
                        ignore: "",
                        errorClass: 'help-block text-right animated fadeInDown',
                        errorElement: 'div',
                        errorPlacement: function(error, e) {
                            jQuery(e).parents('.form-group > div').append(error);
                        },
                        highlight: function(e) {
                            var elem = jQuery(e);
                            elem.closest('.form-group').removeClass('has-error').addClass('has-error');
                            elem.closest('.help-block').remove();
                        },
                        success: function(e) {
                            var elem = jQuery(e);
                            elem.closest('.form-group').removeClass('has-error');
                            elem.closest('.help-block').remove();
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
                    jQuery.validator.addClassRules('textoinputcorta', {
                        maxlength: 2
                    });
                    jQuery.validator.addClassRules('passwordinput', {
                        minlength: 8
                    });
                    jQuery.validator.addClassRules('textoareainput', {
                        maxlength: 1000,
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

                    jQuery("select").on("select2:close", function (e) {  
                        if($().data('validator') && $(this).valid()) $(this).parents('.form-group').removeClass('has-error');
                    });
                /***Validate***/

                /***AJAX***/
                    jQuery( document ).ajaxStart(function() {
                        blockpage('<h1><i class="fa fa-cog fa-spin fa-fw"></i>' + blockUI_message + '</h1>');
                    });
                    jQuery( document ).ajaxError(function(event, jqxhr, settings, thrownError) {
                        ajaxflagunblock = true;
                        console.log(jqxhr.status+' - '+jqxhr.statusText+': '+settings.type+' "'+settings.url+'".');
                        jQuery.unblockUI();
                        notifytemplate('fa fa-times', 'Error de la aplicación', 'danger');
                    });
                    jQuery( document ).ajaxSuccess(function() {
                        if(ajaxflagunblock){
                            jQuery.unblockUI();
                        }
                    });
                /***AJAX***/
            });
        </script>
        <?php foreach ((array)$funciones as $item) { ?>
        <script src="<?php echo base_url();?>public/js/pages/<?php echo $item;?>.js<?php echo $this->config->item('file_version');?>"></script>
        <?php }?>
    </body>
</html>