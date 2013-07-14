# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

$(document).ready ->
  $('#user_typeahead').mention
    delimiter: ''
    queryBy: ['name', 'username']
    users: (query, process) ->
      $.get '/users/typeahead', { query : query }, (data) ->
        console.log(data.options)
        process(data.options)
  $('#add_user_btn').on 'click', (e) ->
    $('#users_list').append("<li>#{$('#user_typeahead').val()}</li>")
    $('#users_list').append("<input id='users[]' name='users[]' type='hidden' value='#{$('#user_typeahead').val()}' />")
    e.preventDefault()
    return false;