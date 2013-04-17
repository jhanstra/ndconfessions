var CURRENT_PAGE = 1;
jQuery(function() { 
	jQuery("a.icons").on("click", function(event) {
        $(this).toggleClass('icon_clicked');
 		
	})

$(window).scroll(function() {
   if($(".content_container").scrollTop() + $(window).height() == $(document).height() - 200) {
       getNewPage();
   }
});
	// on_scroll = getNewPage()
});

function getNewPage() {
	$.get('/confessions/popular_all_time?page=' + CURRENT_PAGE).complete(function(r) { 
		var newHTML = $(r.responseText).find('#confessions').html();
		$("#confessions_container").replaceWith(newHTML);
		CURRENT_PAGE += 1;
	});
}