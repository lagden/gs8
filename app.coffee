axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
jeet         = require 'jeet'

dados        = require './dados.json'

module.exports =
  ignores: [
    'readme.md'
    '**/layout.*'
    '**/_*'
    '.gitignore'
    'ship.*conf'
    '*.log'
    '.keep'
    'bin/*'
  ]

  dump_dirs: [
    'views'
    'assets'
    'bin'
  ]

  extensions: [
    js_pipeline(files: [
      'assets/js/lib/jquery.js'
      'assets/js/lib/gsap/plugins/ScrollToPlugin.js'
      'assets/js/lib/gsap/plugins/CSSPlugin.js'
      'assets/js/lib/gsap/TweenMax.js'
      'assets/js/lib/bootstrap/scrollspy.js'
      'assets/js/lib/desandro/imagesloaded.js'
      'assets/js/lib/desandro/masonry/masonry.pkgd.js'
      'assets/js/lib/desandro/flickity/flickity.pkgd.js'
      'assets/js/*.coffee'
    ]),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [
      axis()
      rupture()
      jeet()
      autoprefixer()
    ]
    sourcemap: true

  'coffee-script':
    sourcemap: true

  jade:
    pretty: true

  server:
    clean_urls: true
    gzip: true

  locals:
    menu: dados.menu
