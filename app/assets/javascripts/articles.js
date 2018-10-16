document.addEventListener("DOMContentLoaded", function() {

	var btn = document.getElementById('more-posts');
	var bio = document.getElementById('recent-articles');


	btn.addEventListener('onclick', function(event) {
		Rails.ajax({
			url: 'articles/load_articles',
			type: "GET",
			success: function(event) {
				event.preventDefault();
			}
		});
	});
});