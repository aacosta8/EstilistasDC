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
      id="input";
    }else{
      id="input1";
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