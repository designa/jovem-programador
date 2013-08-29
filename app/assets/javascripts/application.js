//= require jquery
//= require jquery_ujs
//= require bootstrap
//= require ckeditor/init
//= require select2
//= require components/dispatcher
//= require components/menu

$(document).ready(function() { 
  $("#post_post_category_ids").select2(); 
});

// facebook comments
(function(d, s, id) {
  var js, fjs = d.getElementsByTagName(s)[0];
  if (d.getElementById(id)) return;
  js = d.createElement(s); js.id = id;
  js.src = "//connect.facebook.net/pt_BR/all.js#xfbml=1&appId=541671835895294";
  fjs.parentNode.insertBefore(js, fjs);
}(document, 'script', 'facebook-jssdk'));

