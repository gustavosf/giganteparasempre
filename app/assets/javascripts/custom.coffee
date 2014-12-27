
$container = $('[isotope]')

$container.imagesLoaded () ->
	$container.show
	$container.isotope
		itemSelector: '[isotope] > div'
		layoutMode: 'packery'
		animationOptions:
			duration: 750
			easing: 'linear'
	return

$(window).bind 'resize', () ->
	$container.isotope
		animationOptions:
			duration: 750
			easing: 'linear'
			queue: false
	return false

# Inclui o popup para quando o usuário clica numa imagem
$container.magnificPopup
	type: 'image'
	delegate: '.zoom, .zoom-image'

$('[tooltip]').qtip
  position:
    my: 'left center'
    at: 'right center'
  style:
    tip:
      corner: true
    classes: 'qtip-dark'