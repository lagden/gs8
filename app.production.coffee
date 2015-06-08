axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'
jeet         = require 'jeet'

dados        = require './assets/dados.json'

module.exports =
  ignores: [
    'readme.md'
    '**/layout.*'
    '**/_*'
    '**/dados.json'
    '.gitignore'
    '.editorconfig'
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
    js_pipeline(
      files: [
        'assets/js/lib/jquery.js'
        'assets/js/lib/gsap/plugins/ScrollToPlugin.js'
        'assets/js/lib/gsap/plugins/CSSPlugin.js'
        'assets/js/lib/gsap/TweenMax.js'
        'assets/js/lib/bootstrap/scrollspy.js'
        'assets/js/lib/desandro/imagesloaded.js'
        'assets/js/lib/desandro/masonry/masonry.pkgd.js'
        'assets/js/lib/desandro/flickity/flickity.pkgd.js'
        'assets/js/lib/osvaldas/imagelightbox.js'
        'assets/js/*.coffee'
      ]
      out: 'js/build.js'
      minify: true
      hash: true
    )
    css_pipeline(
      files: 'assets/css/*.styl'
      out: 'css/build.css'
      minify: true
      hash: true
    )
  ]

  stylus:
    use: [
      axis()
      rupture()
      jeet()
      autoprefixer()
    ]

  locals:
    menu: dados.menu
    banner: dados.banner
    galeria: dados.galeria
