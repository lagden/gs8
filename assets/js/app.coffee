WebFontConfig =
  google:
    families: [
      'Roboto::latin'
    ]

do ->
  ssl = if 'https:' == document.location.protocol then 'https' else 'http'
  wf = document.createElement('script')
  wf.src = "#{ssl}://ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"
  wf.type = 'text/javascript'
  wf.async = 'true'
  s = document.getElementsByTagName('script')[0]
  s.parentNode.insertBefore wf, s
  return

qS = document.querySelector.bind document

scrollWindowTo = (to, duration = 1) ->
  TweenMax.to window, duration,
    scrollTo:
      y: to
      ease: Cubic.easeInOut
      autoKill: true
  return

$menu = $ '#navbar'
$body = $ 'body'

$menu.on 'click', 'ul > li > a', (event) ->
  event.preventDefault()
  $el = $ @hash
  scrollWindowTo $el.offset().top, 2
  return

$body.scrollspy
  target: '#navbar'

# Masonry
$grid = $ '.grid'
$grid.masonry
  itemSelector: '.grid__item'
  columnWidth: '.grid__sizer'
  isFitWidth: true
  # percentPosition: true

$grid
  .imagesLoaded()
  .progress ->
    $grid.masonry()
