document.addEventListener("DOMContentLoaded", function() {

	var btn = document.getElementById('more-posts');
	var ul = document.getElementById('recent-articles');

	var next_article = document.getElementById('next-article');
	
	btn.addEventListener('click', function(event) {
		Rails.ajax({
			url: 'articles/load_articles',
			type: "GET",
			data: "next_article=" + next_article.value,

			success: function(document) {  
				# ul.innerHTML = document.documentElement.innerHTML;
				# alert(document.documentElement.innerHTML);
			}, 
			error: function () {
				console.log("error");
			}
		});
	});
});