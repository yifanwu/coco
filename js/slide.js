
$(document).ready(function(){
    
	for (var i = 0; i < 4; i++) {
		var img = document.getElementById('slide');
		img.src = "img/slide" + i + ".png";
		setInterval(function(){
			$("#slide").slideDown();
		},1000);		
		setInterval(function(){},1000)
		$("#slide").hide()
	}
});