# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
  $(document).on 'keyup', '#client_user_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#client_user_id').val()
    url = "/nuevo_cliente/"+id+".json"
    $.getJSON url, (data) ->
      if data.user.id != null
          $('#client_nombre').val data.user.name
          $('#client_apellido').val data.user.surname
          $('#client_dni').val data.user.dni
          $('#client_user_id').removeClass 'is-invalid'
        else
          $('#client_nombre').val ""
          $('#client_apellido').val ""
          $('#client_dni').val ""
          $('#client_user_id').addClass 'form-control is-invalid'

jQuery ->
  $(document).on 'ready', '#client_user_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#client_user_id').val()
    url = "/nuevo_cliente/"+id+".json"
    $.getJSON url, (data) ->
      if data.user.id != null
          $('#client_nombre').val data.user.name
          $('#client_apellido').val data.user.surname
          $('#client_dni').val data.user.dni
          $('#client_user_id').removeClass 'is-invalid'
        else
          $('#client_nombre').val ""
          $('#client_apellido').val ""
          $('#client_dni').val ""
          $('#client_user_id').addClass 'form-control is-invalid'