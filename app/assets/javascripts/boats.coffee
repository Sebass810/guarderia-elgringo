# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/


jQuery ->
  $(document).on 'keyup', '#client_id', ->
    id = $('#client_id').val()
    url = "/reservation_cliente/" + id + ".json"
    $.getJSON url, (data) ->
      if data.client.id != null
          $('#client_id').removeClass 'is-invalid'
          $('#boat_client_id').val data.client.id
          $('#boat_client_name').val data.client.apellido + ', '+ data.client.nombre
      else
          $('#enable_person_client_name').val ""
          $('#client_id').addClass 'is-invalid'
          $('#enable_person_client_id').val ""

jQuery ->
  $(document).on 'change', '#client_id', ->
    id = $('#client_id').val()
    url = "/reservation_cliente/" + id + ".json"
    $.getJSON url, (data) ->
      if data.client.id != null
      	  $('#client_id').removeClass 'is-invalid'
      	  $('#client_id').val data.client.dni	
      else
          $('#client_id').addClass 'is-invalid'
          $('#client_id').val ""