
jQuery(function () {

    var date = new Date();
    var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
    var lastDay = new Date(date.getFullYear(), date.getMonth() + 1, 0);
    jQuery('[name=fechainicio]').datepicker("setDate", firstDay);
    jQuery('[name=fechafin]').datepicker("setDate", lastDay);

    var busquedaform = '#busqueda-form';
    var bgPrimary = '#4a89dc',
        bgPrimaryL = '#5d9cec',
        bgPrimaryLr = '#83aee7',
        bgPrimaryD = '#2e76d6',
        bgPrimaryDr = '#2567bd',
        bgSuccess = '#70ca63',
        bgSuccessL = '#87d37c',
        bgSuccessLr = '#9edc95',
        bgSuccessD = '#58c249',
        bgSuccessDr = '#49ae3b',
        bgInfo = '#3bafda',
        bgInfoL = '#4fc1e9',
        bgInfoLr = '#74c6e5',
        bgInfoD = '#27a0cc',
        bgInfoDr = '#2189b0',
        bgWarning = '#f6bb42',
        bgWarningL = '#ffce54',
        bgWarningLr = '#f9d283',
        bgWarningD = '#f4af22',
        bgWarningDr = '#d9950a',
        bgDanger = '#e9573f',
        bgDangerL = '#fc6e51',
        bgDangerLr = '#f08c7c',
        bgDangerD = '#e63c21',
        bgDangerDr = '#cd3117',
        bgAlert = '#967adc',
        bgAlertL = '#ac92ec',
        bgAlertLr = '#c0b0ea',
        bgAlertD = '#815fd5',
        bgAlertDr = '#6c44ce',
        bgSystem = '#37bc9b',
        bgSystemL = '#48cfad',
        bgSystemLr = '#65d2b7',
        bgSystemD = '#2fa285',
        bgSystemDr = '#288770',
        bgLight = '#f3f6f7',
        bgLightL = '#fdfefe',
        bgLightLr = '#ffffff',
        bgLightD = '#e9eef0',
        bgLightDr = '#dfe6e9',
        bgDark = '#3b3f4f',
        bgDarkL = '#424759',
        bgDarkLr = '#51566c',
        bgDarkD = '#2c2f3c',
        bgDarkDr = '#1e2028',
        bgBlack = '#283946',
        bgBlackL = '#2e4251',
        bgBlackLr = '#354a5b',
        bgBlackD = '#1c2730',
        bgBlackDr = '#0f161b';

    var highColors = [bgWarning, bgPrimary, bgInfo, bgAlert, bgDanger, bgSuccess, bgSystem, bgDark];

    var graph1 = $('#graph1');
    var graph2 = $('#graph2');
    var graph3 = $('#graph3');
    var graph4 = $('#graph4');
    var graph5 = $('#graph5');
    var pie1 = $('#high-pie1');

    if (graph1.length) {
        graph1.highcharts({
            credits: false,
            chart: {
                type: 'line'
            },
            title: {
                text: null
            },
            xAxis: {
                categories: ['En', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            },
            yAxis: {
                title: {
                    text: 'Ventas acumuladas'
                },
                labels: {
                    format: 'S/ {value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
            },
            legend: { enabled: false },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true,
                        style: {
                            textOutline: 'none'
                        },
                        formatter: function () {
                            return "S/ " + Highcharts.numberFormat(this.y, 2);
                        }
                    },
                    enableMouseTracking: false
                }
            },
            series: [
                {
                    name: 'Ventas por mes del 2021',
                    data: data_graph_ventas,
                    //color: '#f72b2b',
                }
            ],
        });
    }

    if (graph2.length) {
        graph2.highcharts({
            credits: false,
            chart: {
                type: 'line'
            },
            title: {
                text: null
            },
            xAxis: {
                categories: ['En', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            },
            yAxis: {
                title: {
                    text: 'Pagos acumuladas'
                },
                labels: {
                    format: 'S/ {value}',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
            },
            legend: { enabled: false },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true,
                        style: {
                            textOutline: 'none'
                        },
                        formatter: function () {
                            return "S/ " + Highcharts.numberFormat(this.y, 2);
                        }
                    },
                    enableMouseTracking: false
                }
            },
            series: [
                {
                    name: 'Pagos por mes del 2021',
                    data: data_graph_pagos,
                    //color: '#f72b2b',
                }, /*{
                    name: 'Ventas por mes del 2020',
                    data: data_graph_ventas_2,
                    data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
                }*/
            ],
        });
    }

    if (graph3.length) {
        graph3.highcharts({
            credits: false,
            chart: {
                type: 'line'
            },
            title: {
                text: null
            },
            xAxis: {
                categories: ['En', 'Feb', 'Mar', 'Abr', 'May', 'Jun', 'Jul', 'Ago', 'Sep', 'Oct', 'Nov', 'Dic'],
            },
            yAxis: {
                title: {
                    text: 'Ingresos acumulados'
                },
                labels: {
                    format: '{value} unid.',
                    style: {
                        color: Highcharts.getOptions().colors[1]
                    }
                },
            },
            legend: { enabled: false },
            plotOptions: {
                line: {
                    dataLabels: {
                        enabled: true,
                        style: {
                            textOutline: 'none'
                        },
                        formatter: function () {
                            return Highcharts.numberFormat(this.y, 2) + " unid.";
                        }
                    },
                    enableMouseTracking: false
                }
            },
            series: [
                {
                    name: 'Ingresos por mes del 2021',
                    data: data_graph_ingresos,
                    //color: '#f72b2b',
                }, /*{
                    name: 'Ventas por mes del 2020',
                    data: data_graph_ventas_2,
                    data: [24916, 24064, 29742, 29851, 32490, 30282, 38121, 40434]
                }*/
            ],
        });
    }

    if (pie1.length) {
        pie1.highcharts({
            credits: false,
            chart: {
                plotBackgroundColor: null,
                plotBorderWidth: null,
                plotShadow: false,
                type: 'pie'
            },
            title: {
                text: null
            },
            tooltip: {
                pointFormat: '<br>Porcentaje: {point.percentage:.2f} %<br>Ventas: S/ {point.y:.2f}'
            },
            plotOptions: {
                pie: {
                    center: ['25%', '50%'],
                    dataLabels: {
                        enabled: true,
                        style: {
                            textOutline: 'none'
                        },
                        format: '<b>{point.name}</b><br>Porcentaje: {point.percentage:.2f} %<br>Ventas: S/ {point.y:.2f}',
                    },
                    showInLegend: true
                }
            },
            legend: {
                x: 320,
                floating: true,
                verticalAlign: "middle",
                layout: "vertical",
                itemMarginTop: 2
            },
            series: [{
                colorByPoint: true,
                name: 'Marca',
                data: data_pie_clientes,
            }]
        });
    }

    var busquedavalidate = jQuery(busquedaform).validate({
        submitHandler: function (form) {
            jQuery.ajax({
                url: base_url + 'generico/busqueda/',
                type: form.method,
                data: $(form).serialize(),
                dataType: 'json',
                timeout: 30000,
                success: function (response) {
                    if (response.status == '500') {
                        notifytemplate('fa fa-times', response.message, 'danger');
                        jQuery('#tabla').collapse('hide');
                    }
                    if (response.status == '200') {

                        var data = [], count = 0;
                        jQuery.each(response.data.graph1, function (index, item) {
                            data[count] = [index, item]; count++;
                        });
                        var graph1_ = graph1.highcharts();
                        graph1_.series[0].update({ data: data }, false);
                        graph1_.redraw();

                        var data = [], count = 0;
                        jQuery.each(response.data.graph2, function (index, item) {
                            data[count] = [index, item]; count++;
                        });
                        var graph2_ = graph2.highcharts();
                        graph2_.series[0].update({ data: data }, false);
                        graph2_.redraw();

                        var data = [], count = 0;
                        jQuery.each(response.data.graph3, function (index, item) {
                            data[count] = [index, item]; count++;
                        });
                        var graph3_ = graph3.highcharts();
                        graph3_.series[0].update({ data: data }, false);
                        graph3_.redraw();

                        jQuery('#cpe_1').text(parseInt(response.data.aceptado + response.data.observado + response.data.rechazado));
                        jQuery('#cpe_2').text(response.data.aceptado);
                        jQuery('#cpe_3').text(response.data.observado);
                        jQuery('#cpe_4').text(response.data.rechazado);
                        jQuery('#tabla').collapse('show');
                    }
                }
            });
        }
    });

});