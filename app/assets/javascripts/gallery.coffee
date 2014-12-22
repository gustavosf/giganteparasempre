# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
	$container = $(".portfolio-box")

	$.getJSON "https://googledrive.com/host/0B4MkiRPnlC9uMFlTMmo2anJkSTQ/abr-14.json", (resp) ->
		host = "https://googledrive.com/host/0B4MkiRPnlC9uN20tTzRmNXNjeTQ/"
		$(resp.items).each (i, item) ->
			return	if i > 15
			item.host = host + item.download_link.match(/\/([^\/]*\.jpg)/)[1]
			img = $.templates("#gallery-image-tmpl").render item
			$container.append img

			$('.project-post').each () ->
				$(this).hoverdir

			return

		isotope_start $container
		return

	return