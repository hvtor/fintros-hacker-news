document.addEventListener("DOMContentLoaded", function() {

	var btn = document.getElementById('more-posts');

	var next_article = document.getElementById('next-article');
	var button = document.getElementById("more-posts");

	btn.addEventListener('click', function(event) {
		Rails.ajax({
			url: 'articles/load_articles',
			type: "GET",
			data: "next_article=" + next_article.value,

			success: function(document) {  

				var newArticles = document.createElement("ul");
				newArticles.className = "new-articles";
				button.parentNode.removeChild(button);
				var pN = next_article.parentNode;
				newArticles.innerHTML = document.documentElement.innerHTML;

				next_article.parentNode.removeChild(next_article);
				pN.appendChild(newArticles, next_article);
			}, 
			error: function () {
				console.log("error");
			}
		});
	});
});