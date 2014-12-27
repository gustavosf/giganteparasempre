# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$container = $("[isotope]")

if $container.attr('infinitescroll') != undefined
  $container.infinitescroll
    loading:
      finished: () ->
      finishedMsg: 'Vocẽ chegou ao fim'
      msg: null
      msgText: 'Carregando...'
      img: 'data:image/gif;base64,R0lGODlhAQABAHAAACH5BAUAAAAALAAAAAABAAEAAAICRAEAOw=='
      speed: 'fast',
      start: undefined
    navSelector: '#page_nav'
    nextSelector: '#page_nav a'
    dataType: 'json'
    appendCallback: false
  , (json, opts) ->
    items = []
    $(json).each (i, item) ->
      items.push $($.templates("#" + $container.data('is-template')).render item)[0]
      return

    $(items).hide()
    $('[isotope]').append items
    $(items).imagesLoaded () ->
      $('#infscr-loading').fadeOut('fast');
      $(items).show()
      $('[isotope]').isotope 'insert', items

    return