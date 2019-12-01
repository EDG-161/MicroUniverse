$(document).ready(function(){
    $("#formulario").submit(function(e){
      e.preventDefault();

      $.ajax({
          url: $(this).attr('action'),
          type: $(this).attr('method'),
          
          // This is the important part
        xhrFields: {
            withCredentials: true
        },
        // This is the important part
        data: $(this).serialize(),
        success: function (response) {
            console.log(response)
        },
        error: function (xhr, status) {
            console.log(status)
        }
        
      })

    })
})

function loadDoc() {
  var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange=function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML = this.responseText;
    }
  };
  xhttp.open("GET", "demo_get.asp?t=" + Math.random(), true);
  xhttp.send();
}
