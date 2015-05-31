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
