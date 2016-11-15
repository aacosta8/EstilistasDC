function alertas(x) {
  
    switch(x) {
    case 0:
        swal("Te amo mi amor");
        break;
    case 1:
        sweetAlert("Oops...", "Something went wrong!", "error");
        break;
    case 2:
        swal("Good job!", "You clicked the button!", "success");
        break;
      case 3: 
        swal({   title: "Are you sure?",   text: "Your will not be able to recover this imaginary file!",   type: "warning",   showCancelButton: true,   confirmButtonColor: "#DD6B55",   confirmButtonText: "Yes, delete it!",   cancelButtonText: "No, cancel plx!",   closeOnConfirm: false,   closeOnCancel: false }, function(isConfirm){   if (isConfirm) {     swal("Deleted!", "Your imaginary file has been deleted.", "success");   } else {     swal("Cancelled", "Your imaginary file is safe :)", "error");   } });
        break;
  }
}