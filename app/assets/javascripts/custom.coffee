###############################################################################
###   Configurações do isotope e do infinite scroll   #########################
###############################################################################

$container = $('[isotope]')

if $container.length

  # Esconde qualquer item que possa ainda estar carregando
  $container.hide()
  # E mostra apenas depois de carregar as imagens
  $container.imagesLoaded () ->
    $container.show()
    $('[isotope]').isotope 'layout'

  # Configuração inicial do isotope
  $container.isotope
  	itemSelector: '[isotope] > div'
  	layoutMode: 'packery'
  	animationOptions:
  		duration: 750
  		easing: 'linear'

  # Reconfiguração do isotope para redimencionamentos de tela
  $(window).bind 'resize', () ->
  	$container.isotope
  		animationOptions:
  			duration: 750
  			easing: 'linear'
  			queue: false
  	return false

  if $container.attr('infinitescroll') != undefined
    # Configura o infinite scroll para buscar novos items conforme o usuário chega
    # no final da págin
    $container.infinitescroll
      loading:
        finished: () -> # não faz nada
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
      # No retorno dos ítens, busca o template, e adiciona um-a-um na tela
      items = []
      $(json).each (i, item) ->
        items.push $($.templates("#" + $container.data('is-template')).render item)[0]
        return

      # Esconde os novos items para eles só aparecerem qdo estiverem totalmente
      # carregados
      $(items).hide()

      # Adiciona no isotope
      $('[isotope]').append items

      # Roda o lazy youtube para caso tenha vídeos carregados
      $('.lazyYT').lazyYT()

      # Espera carregar as imagens, esconde o loading, mostra os items e taca
      # o trigger no isotope
      $(items).imagesLoaded () ->
        $('#infscr-loading').fadeOut('fast');
        $(items).show()
        $('[isotope]').isotope 'insert', items

      return

    # Ativa o infinite scroll para buscar a primeira leva de infos
    $container.infinitescroll 'retrieve'

  # Inclui o popup para quando o usuário clica numa imagem
  $container.magnificPopup
  	type: 'image'
  	delegate: '.zoom, .zoom-image'


###############################################################################
###   Tooltip   ###############################################################
###############################################################################

$('[tooltip]').qtip
  position:
    my: 'left center'
    at: 'right center'
  style:
    tip:
      corner: true
    classes: 'qtip-dark'