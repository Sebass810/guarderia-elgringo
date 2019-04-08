# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

jQuery ->
	$(document).on 'keyup', '#descent_client_client_id', ->
		id = $('#descent_client_client_id').val()
		url = "/cliente/"+id+".json"
		$.getJSON url, (data) ->
			if data.cliente.id != null
  				$('#descent_client_client_nombre').val data.cliente.apellido + ', ' + data.cliente.nombre
  				$('#descent_client_client_dni').val data.cliente.dni
  				$('#descent_client_client_id').removeClass 'is-invalid'
  			else
  				$('#descent_client_client_nombre').val ""
  				$('#descent_client_client_dni').val ""
  				$('#descent_client_client_id').addClass 'form-control is-invalid'

jQuery ->
	$(document).on 'ready', '#descent_client_client_id', ->
		id = $('#descent_client_client_id').val()
		url = "/cliente/"+id+".json"
		$.getJSON url, (data) ->
			if data.cliente.id != null
  				$('#descent_client_client_nombre').val data.cliente.apellido + ', ' + data.cliente.nombre
  				$('#descent_client_client_dni').val data.cliente.dni
  				$('#descent_client_client_id').removeClass 'is-invalid'
  			else
  				$('#descent_client_client_nombre').val ""
  				$('#descent_client_client_dni').val ""
  				$('#descent_client_client_id').addClass 'form-control is-invalid'


jQuery ->
  $(document).on 'keyup', '#descent_client_enable_person_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#descent_client_enable_person_id').val()
    url = "/cliente/"+client_id+"/enable_person/"+id+".json"
    $.getJSON url, (data) ->
      if data.enable_person.id != null
          $('#descent_client_enable_person_nombre').val data.enable_person.apellido + ', ' + data.enable_person.nombre
          $('#descent_client_enable_person_dni').val data.enable_person.dni
          $('#descent_client_enable_person_id').removeClass 'is-invalid'
        else
          $('#descent_client_enable_person_nombre').val ""
          $('#descent_client_enable_person_dni').val ""
          $('#descent_client_enable_person_id').addClass 'form-control is-invalid'

jQuery ->
  $(document).on 'ready', '#descent_client_enable_person_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#descent_client_enable_person_id').val()
    url = "/cliente/"+client_id+"/enable_person/"+id+".json"
    $.getJSON url, (data) ->
      if data.enable_person.id != null
          $('#descent_client_enable_person_nombre').val data.enable_person.apellido + ', ' + data.enable_person.nombre
          $('#descent_client_enable_person_dni').val data.enable_person.dni
          $('#descent_client_enable_person_id').removeClass 'is-invalid'
        else
          $('#descent_client_enable_person_nombre').val ""
          $('#descent_client_enable_person_dni').val ""
          $('#descent_client_enable_person_id').addClass 'form-control is-invalid'


jQuery ->
  $(document).on 'keyup', '#descent_client_boat_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#descent_client_boat_id').val()
    url = "/cliente/"+client_id+"/boat/"+id+".json"
    $.getJSON url, (data) ->
      if data.boat.id != null
          $('#descent_client_boat_nombre').val data.boat.nombre
          $('#descent_client_boat_matricula').val data.boat.matricula
          $('#descent_client_boat_motor').val data.boat.motor
          $('#descent_client_boat_id').removeClass 'is-invalid'
        else
          $('#descent_client_boat_nombre').val ""
          $('#descent_client_boat_matricula').val ""
          $('#descent_client_boat_motor').val ""
          $('#descent_client_boat_id').addClass 'form-control is-invalid'

jQuery ->
  $(document).on 'ready', '#descent_client_boat_id', ->
    client_id = $('#descent_client_client_id').val()
    id = $('#descent_client_boat_id').val()
    url = "/cliente/"+client_id+"/boat/"+id+".json"
    $.getJSON url, (data) ->
      if data.boat.id != null
          $('#descent_client_boat_nombre').val data.boat.nombre
          $('#descent_client_boat_matricula').val data.boat.matricula
          $('#descent_client_boat_motor').val data.boat.motor
          $('#descent_client_boat_id').removeClass 'is-invalid'
        else
          $('#descent_client_boat_nombre').val ""
          $('#descent_client_boat_matricula').val ""
          $('#descent_client_boat_motor').val ""
          $('#descent_client_boat_id').addClass 'form-control is-invalid'

