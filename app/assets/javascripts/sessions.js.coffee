# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).on 'click', '#login-link', (e) ->
  $('#login').slideToggle() unless $('#register').is(':visible')

$(document).on 'click', '#register-link', (e) ->
  $('#login').addClass('animated fadeOutRight')
  setTimeout (->
    $('#login').hide()
    $('#login').removeClass('animated fadeOutRight')
    $('#register').addClass('animated fadeInLeft').show()
  ), 500