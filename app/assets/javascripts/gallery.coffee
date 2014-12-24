# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$container = $("[isotope]")

# $('.project-post').each () ->
#   $(this).hoverdir

$container.infinitescroll
  navSelector: '#page_nav'
  nextSelector: '#page_nav a'
  dataType: 'json'
  appendCallback: false
, (json, opts) ->
  items = []
  $(json).each (i, item) ->
    item.host = $container.data('host') + '/' + item.basename
    items.push $($.templates("#gallery-image-tmpl").render item)[0]
    return
  
  $('[isotope]').append items
  $(items).imagesLoaded () ->
    $('[isotope]').isotope 'insert', items
  return