var recognition;
var id="";
var recognizing = false;
if (!('webkitSpeechRecognition' in window)) {
  alert("¡API no soportada!");
} else {

  recognition = new webkitSpeechRecognition();
  recognition.lang = "es-VE";
  recognition.continuous = true;
  recognition.interimResults = true;

  recognition.onstart = function() {
    recognizing = true;
    console.log("empezando a eschucar");
  }
  recognition.onresult = function(event) {

   for (var i = event.resultIndex; i < event.results.length; i++) {
    if(event.results[i].isFinal)
      document.getElementById(id).value += event.results[i][0].transcript + " ";
  }

      //texto
    }
    recognition.onerror = function(event) {
    }
    recognition.onend = function() {
      recognizing = false;
      console.log("terminó de escuchar, llegó a su fin");

    }

  }

  function procesar(idp) {
    if (idp==0) {
      id="inputContacto0";
    }else if(idp==1){
      id="inputContacto1";
    }else if(idp==2){
      id="inputContacto2";
    }else if(idp==3){
      id="inputContacto3";
    }else if(idp==4){
      id="inputContacto4";
    }else if(idp==5){
      id="inputContacto5";
    }else if(idp==6){
      id="inputContacto6";
    }else if(idp==7){
      id="inputContacto7";
    }else if(idp==8){
      id="inputContacto8";
    }else if(idp==9){
      id="inputContacto9";
    }else if(idp==10){
      id="inputPerfilCliente10";
    }else if(idp==11){
      id="inputPerfilCliente11";
    }else if(idp==12){
      id="inputPerfilCliente12";
    }else if(idp==13){
      id="inputPerfilCliente13";
    }else if(idp==14){
      id="inputPerfilCliente14";
    }else if(idp==15){
      id="inputPerfilCliente15";
    }else if(idp==16){
      id="inputPerfilCliente16";
    }else if(idp==17){
      id="inputContacto17";
    }else if(idp==18){
      id="inputContacto18";
    }else if(idp==19){
      id="inputContacto19";
    }else if(idp==20){
      id="inputContacto20";
    }else if(idp==21){
      id="inputContacto21";
    }else if(idp==22){
      id="inputContacto22";
    }else if(idp==23){
      id="inputExperiencia23";
    }else if(idp==24){
      id="inputRegCliente24";
    }else if(idp==25){
      id="inputRegCliente25";
    }else if(idp==26){
      id="inputRegCliente26";
    }else if(idp==27){
      id="inputRegCliente27";
    }else if(idp==28){
      id="inputRegCliente28";
    }else if(idp==29){
      id="inputRegCliente29";
    }else if(idp==30){
      id="inputRegCliente30";
    }
    if (recognizing == false) {
      recognition.start();
      recognizing = true;

    } else {
      recognition.stop();
      recognizing = false;

    }
  }