# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$container = $("[isotope]")

$container.delegate '.project-post', 'mouseenter mouseleave', (e) ->
  $(this).find('.hover-box').toggle(e.type == 'mouseenter')

$container.delegate '.hover-box', 'click', (e) ->
  $(this).find('.zoom, .zoom-image').trigger 'click'