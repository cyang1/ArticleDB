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
  $(document).on 'keydown', '#user_typeahead', (e) ->
    if (e.keyCode == 13) 
      $('#users_list').append("<li>#{$('#user_typeahead').val()}</li>")
      e.preventDefault()
      return false;
  $('#collaboration_form').on 'submit', (e) ->
    serializedStr = ''
    $('#users_list li').each (l) ->
      serializedStr += encodeURIComponent("users_list[]") + "=" + encodeURIComponent($(this).text()) + "&"
    serializedStr += $(this).serialize()
    console.log(serializedStr)
    $.post '/collab', serializedStr, (data) ->
      window.location = data
    e.preventDefault()
    return false
