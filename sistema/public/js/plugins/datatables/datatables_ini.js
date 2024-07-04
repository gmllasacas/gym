/*
 *  Document   : base_tables_datatables.js
 *  Author     : pixelcave
 *  Description: Custom JS code used in Tables Datatables Page
 */

var BaseTableDatatables = function() {
	
	// Init full DataTable, for more examples you can check out https://www.datatables.net/
	var initDataTableFull = function() {
		jQuery('.js-dataTable-full').dataTable({
			columnDefs: [ { orderable: false, targets: [ -1 ] } ],
			/*dom: 'Bfrtip',
			buttons: [
				{
					extend: 'copy',
					text: 'Copiar'
				},
				{
					extend: 'csv',
					title: 'Reporte de Ingresos - Mercado Modelo Nro. 1',
					filename: 'Reporte de Ingresos - Mercado Modelo Nro. 1'
				},
				{
					extend: 'excel',
					text: 'Excel 2010',
					title: 'Reporte de Ingresos - Mercado Modelo Nro. 1',
					filename: 'Reporte de Ingresos - Mercado Modelo Nro. 1',
				},
				{
					extend: 'pdf',
					title: 'Reporte de Ingresos - Mercado Modelo Nro. 1',
					filename: 'Reporte de Ingresos - Mercado Modelo Nro. 1'
				},
				{
					extend: 'print',
					text: 'Imprimir',
					title: 'Reporte de Ingresos - Mercado Modelo Nro. 1'
				},
			],*/
			pageLength: 10,
			lengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
			bAutoWidth: false,
			language: {
				"emptyTable":     "No existen registros",
				"info":           "_TOTAL_ registros (Página _PAGE_ de _PAGES_)",
				"infoEmpty":      "No hay registros a mostrar",
				"infoFiltered": "<br>Filtrado de _MAX_ registros",
				"infoPostFix":    "",
				"thousands":      ",",
				"lengthMenu":     "Registros: _MENU_",
				"loadingRecords": "Cargando...",
				"processing":     "Procesando...",
				"search":         "Filtrar:",
				"zeroRecords": "No hay resultados.",
				"paginate": {
					"first":      "Primero",
					"last":       "Último",
					"next":       "Siguiente",
					"previous":   "Anterior"
				},
				"aria": {
					"sortAscending":  ":  Ordernar la columna de forma ascendente",
					"sortDescending": ": Ordernar la columna de forma descendente"
				}            
			}
		});
		jQuery('.js-dataTable-full-2').dataTable({
			columnDefs: [ { orderable: false, targets: [ -1 ] } ],			
			pageLength: 10,
			lengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
			bAutoWidth: true,
			order: [[ 0, "desc" ]],
			language: {
				"emptyTable":     "No existen registros",
				"info":           "_TOTAL_ registros (Página _PAGE_ de _PAGES_)",
				"infoEmpty":      "No hay registros a mostrar",
				"infoFiltered": "<br>Filtrado de _MAX_ registros",
				"infoPostFix":    "",
				"thousands":      ",",
				"lengthMenu":     "Registros: _MENU_",
				"loadingRecords": "Cargando...",
				"processing":     "Procesando...",
				"search":         "Filtrar:",
				"zeroRecords": "No hay resultados.",
				"paginate": {
					"first":      "Primero",
					"last":       "Último",
					"next":       "Siguiente",
					"previous":   "Anterior"
				},
				"aria": {
					"sortAscending":  ":  Ordernar la columna de forma ascendente",
					"sortDescending": ": Ordernar la columna de forma descendente"
				}            
			}
		});
	};


	// DataTables Bootstrap integration
	var bsDataTables = function() {
		var $DataTable = jQuery.fn.dataTable;

		// Set the defaults for DataTables init
		/*dom:
				"<'row'<'col-sm-6'l><'col-sm-6'f>>" +
				"<'row'<'col-sm-12'tr>>" +
				"<'row'<'col-sm-6'i><'col-sm-6'p>>",*/
		jQuery.extend( true, $DataTable.defaults, {			
			dom:
				"<'row'<'col-xs-5 col-sm-6'l><'col-xs-7 col-sm-6'f>>" +
				"<'row'<'col-sm-12'<'table-responsive-mode'tr>>>" +
				"<'row'<'col-sm-6'i><'col-sm-6'p>>",
			renderer: 'bootstrap',
			oLanguage: {
				sLengthMenu: "_MENU_",
				sInfo: "Showing <strong>_START_</strong>-<strong>_END_</strong> of <strong>_TOTAL_</strong>",
				oPaginate: {
					sPrevious: '<i class="fa fa-angle-left"></i>',
					sNext: '<i class="fa fa-angle-right"></i>'
				}
			},
			pageLength: 20,
			lengthMenu: [[5, 10, 15, 20], [5, 10, 15, 20]],
			bAutoWidth: false,
			language: {
                "emptyTable":     "No existen registros",
                "info":           "_TOTAL_ registros (Página _PAGE_ de _PAGES_)",
                "infoEmpty":      "No existen registros a mostrar",
                "infoFiltered": "<br>Filtrado de _MAX_ registros",
                "infoPostFix":    "",
                "thousands":      ",",
                "lengthMenu":     "Registros: _MENU_",
                "loadingRecords": "Cargando...",
                "processing":     "Procesando...",
                "search":         "Filtro: ",
                "zeroRecords": "No existen resultados.",
                "paginate": {
                    "first":      "Primero",
                    "last":       "Último",
                    "next":       "Siguiente",
                    "previous":   "Anterior"
                },
                "aria": {
                    "sortAscending":  ":  Ordernar la columna de forma ascendente",
                    "sortDescending": ": Ordernar la columna de forma descendente"
                } 
            }
		});

		// Default class modification
		jQuery.extend($DataTable.ext.classes, {
			sWrapper: "dataTables_wrapper form-inline dt-bootstrap",
			sFilterInput: "form-control",
			sLengthSelect: "form-control"
		});

		// Bootstrap paging button renderer
		$DataTable.ext.renderer.pageButton.bootstrap = function (settings, host, idx, buttons, page, pages) {
			var api     = new $DataTable.Api(settings);
			var classes = settings.oClasses;
			var lang    = settings.oLanguage.oPaginate;
			var btnDisplay, btnClass;

			var attach = function (container, buttons) {
				var i, ien, node, button;
				var clickHandler = function (e) {
					e.preventDefault();
					if (!jQuery(e.currentTarget).hasClass('disabled')) {
						api.page(e.data.action).draw(false);
					}
				};

				for (i = 0, ien = buttons.length; i < ien; i++) {
					button = buttons[i];

					if (jQuery.isArray(button)) {
						attach(container, button);
					}
					else {
						btnDisplay = '';
						btnClass = '';

						switch (button) {
							case 'ellipsis':
								btnDisplay = '&hellip;';
								btnClass = 'disabled';
								break;

							case 'first':
								btnDisplay = lang.sFirst;
								btnClass = button + (page > 0 ? '' : ' disabled');
								break;

							case 'previous':
								btnDisplay = lang.sPrevious;
								btnClass = button + (page > 0 ? '' : ' disabled');
								break;

							case 'next':
								btnDisplay = lang.sNext;
								btnClass = button + (page < pages - 1 ? '' : ' disabled');
								break;

							case 'last':
								btnDisplay = lang.sLast;
								btnClass = button + (page < pages - 1 ? '' : ' disabled');
								break;

							default:
								btnDisplay = button + 1;
								btnClass = page === button ?
										'active' : '';
								break;
						}

						if (btnDisplay) {
							node = jQuery('<li>', {
								'class': classes.sPageButton + ' ' + btnClass,
								'aria-controls': settings.sTableId,
								'tabindex': settings.iTabIndex,
								'id': idx === 0 && typeof button === 'string' ?
										settings.sTableId + '_' + button :
										null
							})
							.append(jQuery('<a>', {
									'href': '#'
								})
								.html(btnDisplay)
							)
							.appendTo(container);

							settings.oApi._fnBindAction(
								node, {action: button}, clickHandler
							);
						}
					}
				}
			};

			attach(
				jQuery(host).empty().html('<ul class="pagination"/>').children('ul'),
				buttons
			);
		};

		// TableTools Bootstrap compatibility - Required TableTools 2.1+
		if ($DataTable.TableTools) {
			// Set the classes that TableTools uses to something suitable for Bootstrap
			jQuery.extend(true, $DataTable.TableTools.classes, {
				"container": "DTTT btn-group",
				"buttons": {
					"normal": "btn btn-default",
					"disabled": "disabled"
				},
				"collection": {
					"container": "DTTT_dropdown dropdown-menu",
					"buttons": {
						"normal": "",
						"disabled": "disabled"
					}
				},
				"print": {
					"info": "DTTT_print_info"
				},
				"select": {
					"row": "active"
				}
			});

			// Have the collection use a bootstrap compatible drop down
			jQuery.extend(true, $DataTable.TableTools.DEFAULTS.oTags, {
				"collection": {
					"container": "ul",
					"button": "li",
					"liner": "a"
				}
			});
		}
	};

	return {
		init: function() {
			// Init Datatables
			bsDataTables();
			initDataTableFull();
		}
	};
}();

// Initialize when page loads
jQuery(function(){ BaseTableDatatables.init(); });