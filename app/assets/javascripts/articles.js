# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

var btn = document.getElementById('more-posts');
var bio = document.getElementById('recent-articles');
 
Rails.ajax({
	url: 'articles/load_articles',
	type: "GET",
	success: function(event) {
	}
})
  
btn.addEventListener('onclick', function(event) {
	event.preventDefault();
	console.log("More posts clicked!")
});