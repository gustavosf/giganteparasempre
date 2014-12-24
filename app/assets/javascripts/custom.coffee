
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