// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require hermitage
//= require jquery_ujs
//= require handlebars.runtime
//= require_tree ./templates
//= require_tree .
//= require bootstrap
//= require jquery_nested_form
//= require tinymce
//= require select2
//= require underscore-min
//= require gmaps/google
//= require knockout
//= require jquery.mb.YTPlayer
//= require owl.carousel.min

$(document).ready(function() {
    $('select').select2({
      width: 200
    });

    clearNotification();
    $(".player").mb_YTPlayer();
});

function clearNotification() {
  setTimeout(function() {
      $('#notification').children().fadeOut(6000, function() {
          $('#notification').empty();
      });
  });
}
