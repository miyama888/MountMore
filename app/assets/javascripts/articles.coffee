# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).on 'change', '#article_area_id', ->
  $.ajax(
    type: 'GET'
    url: '/articles/select_prefecture'
    data: {
      area_id: $(this).val()
    }
  ).done (data) ->
    $('.prefecture').html(data)
