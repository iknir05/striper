$(document).ready(function(){
	
	
	
	$(".closebtn-icon").click(function(){
		$(".sidebtn").fadeOut("slow");
	});	
	
	
/* menu script */
	$(function(){
		$('ul li:has(ul)').addClass('has-submenu');
	});
/* menu script */
	
	$('#owl-one').owlCarousel({
		loop:true,
		margin:10,
		nav:true,
		autoPlay:true,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:1
			}
		}
	})
	$('#owl-two').owlCarousel({
		loop:true,
		margin:30,
		nav:false,
		autoPlay:true,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:2
			},
			1000:{
				items:3
			}
		}
	})
				$('#owl-three').owlCarousel({
		loop:true,
		margin:80,
		nav:true,
		autoPlay:true,
		responsive:{
			0:{
				items:1
			},
			600:{
				items:1
			},
			1000:{
				items:2,
				margin:40,
			},
			1200:{
				items:2,
			}
		}
	})

	

		
		
		
		
});
