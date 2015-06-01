axis         = require 'axis'
rupture      = require 'rupture'
autoprefixer = require 'autoprefixer-stylus'
js_pipeline  = require 'js-pipeline'
css_pipeline = require 'css-pipeline'

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
    js_pipeline(files: 'assets/js/*.coffee'),
    css_pipeline(files: 'assets/css/*.styl')
  ]

  stylus:
    use: [
      axis()
      rupture()
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