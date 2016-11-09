function myAlert1() {
	swal("Bien", "Su cita se ha guardado con éxito!", "success");
}
function myAlert2() {
	swal({   
		title: "Está seguro?",   
		text: "Deseas cancelar la cita?",   
		type: "warning",   
		showCancelButton: true,   
		confirmButtonColor: "#DD6B55",   
		confirmButtonText: "Aceptar",   
		closeOnConfirm: false }, 
		function(){   
			swal("Cancelada", "Su cita ha sido cancelada con éxito.", "success"); 
		});
}
function login() {
	swal("Error", "Faltan datos!", "warning");
}