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
      document.getElementById("procesar").innerHTML = "";
      console.log("terminó de eschucar, llegó a su fin");

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
    }
    if (recognizing == false) {
      recognition.start();
      recognizing = true;
      document.getElementById("procesar").innerHTML = "";
    } else {
      recognition.stop();
      recognizing = false;
      document.getElementById("procesar").innerHTML = "";
    }
  }