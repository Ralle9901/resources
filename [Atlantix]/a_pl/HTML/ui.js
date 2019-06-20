$(document).ready(function(){
    window.addEventListener('message', function(event) {
        var data = event.data;
        $(".filauno").css("display",data.show? "none":"block");
        $("#policias").text(data.policias);
        $("#taxistas").text(data.taxistas);
        $("#mecanicos").text(data.mecanicos);
		$("#staffs").text(data.staffs);
		$("#kriminelle").text(data.kriminelle);
		

    });
});
