# ScrollTo
scrollWindowTo = (to, duration = 1) ->
  TweenMax.to window, duration,
    scrollTo:
      y: to
      ease: Cubic.easeInOut
      autoKill: true
  return

# Menu
$body = $ 'body'
$navbar = $ '#navbar'

# Menu scrollTo
$navbar.on 'click', 'ul > li > a', (event) ->
  event.preventDefault()
  $el = $ @hash
  scrollWindowTo $el.offset().top, 2
  return

# Menu spy
$body.scrollspy
  target: '#navbar'

# Masonry
$grid = $ '.grid'
$grid.masonry
  itemSelector: '.grid__item'
  columnWidth: '.grid__sizer'
  isFitWidth: true

$grid
  .imagesLoaded()
  .progress ->
    $grid.masonry()


# Lightbox
$indica = null
$closeBtn = null
$overlay = null

activityIndicatorOn = ->
  str = '<div class="imagelightbox-loading"><div></div></div>'
  $indica = $(str).appendTo 'body'
  return

activityIndicatorOff = ->
  $indica.remove()
  return

closeButtonOn = (instance) ->
  str = '<button type="button" class="imagelightbox-close"></button>'
  $closeBtn = $(str).appendTo('body').on 'click touchend', ->
    closeButtonOff()
    instance.quitImageLightbox()
    false
  return

closeButtonOff = ->
  $closeBtn.remove()
  return

overlayOn = ->
  srt = '<div class="imagelightbox-overlay"></div>'
  $overlay = $(srt).appendTo 'body'
  return

overlayOff = ->
  $overlay.remove()
  return

$lightbox = $('.picWorks').imageLightbox
  quitOnDocClick: false
  onStart: ->
    overlayOn()
    closeButtonOn $lightbox
    return
  onEnd: ->
    overlayOff()
    closeButtonOff()
    activityIndicatorOff()
    return
  onLoadStart: ->
    activityIndicatorOn()
    return
  onLoadEnd: ->
    activityIndicatorOff()
    return

# Burguer
$burger = $ '#burger'

burgerClick = (contain)->
  m = ['addClass', 'removeClass']
  contain = contain || $burger.hasClass('open')
  a = if contain then 1 else 0
  b = a^1

  $burger[m[a]] 'open'
  $burger[m[b]] 'close'
  return

$main = $ 'main'
$header = $ '.header-bg'

closeMenu = ->
  els = [$body, $navbar, $header]
  $el.removeClass 'open' for $el in els
  burgerClick(true)
  return

toggleMenu = ->
  els = [$body, $navbar, $header]
  $el.toggleClass 'open' for $el in els
  burgerClick()
  return

$main.on 'click', closeMenu
$burger.on 'click.anima', toggleMenu

# Color
cc = 0
lastcc = 0
colorInterval = setInterval ->
  $body.removeClass 'color' + lastcc
  if cc < 17
    cc++
  else
    cc = 0
  lastcc = cc
  $body.addClass 'color' + cc
  return
, 3000

# Form
$contatoForm = $ '#contatoForm'
$btnSubmit = $ '#btnSubmit'

enviaForm = (event) ->
  event.preventDefault()
  $.ajax
    type: 'POST'
    url: $contatoForm[0].action
    data: $contatoForm.serializeArray()
    xhrFields:
      withCredentials: true
    dataType: 'json'
    beforeSend: (xhr) ->
      xhr.setRequestHeader 'X-Requested-With', 'XMLHttpRequestGS8'
      return
  .done (res) ->
    console.log 'ok', res
    if res.success
      $contatoForm[0].reset()
    alert res.message
    return
  .fail ->
    console.log 'fail'
    alert 'Falha ao enviar'
    return
  return

$btnSubmit.on 'click', enviaForm
