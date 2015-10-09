// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require turbolinks
//= require sweet-alert.min
//= require bootstrap-select.min
//= require bootstrap-datepicker
//= require Chart.min
//= require_tree .

$(document).ready(function(){

$(':radio').click(function(){

   var elems = $(this).parents('tr').find(':checkbox');
   elems.not($(this)).attr('disabled',$(this).is(':checked'));
});

});

function prepareHomeEasterEgg(){
  var easterEggCounter = 0;
  var original_source = $('.intro-message img').attr('src');
  $('.intro-message img').click(function(){
    if(++easterEggCounter >= 10){
      easterEggCounter=0;
      $(this).addClass('animated hinge').one('webkitAnimationEnd mozAnimationEnd MSAnimationEnd oanimationend animationend', function(){
        $(this).attr('src', '/assets/doge.jpg').load(function(){
          $(this).addClass('tada').removeClass('hinge');
        });
      });
    }
  });
}
