# $menu = $ '#navbar'

# $win = $ window
# wh = $win.height()


# $win.on 'resize', ->
#   wh = $win.height()
#   return

# class Scroller
#   constructor: ->
#     @latestKnownScrollY = 0
#     @ticking = false

#   init: ->
#     window.addEventListener 'scroll', @onScroll.bind(this), false
#     return

#   onScroll: ->
#     @latestKnownScrollY = window.scrollY
#     @requestTick()
#     return

#   requestTick: ->
#     if !@ticking
#       window.requestAnimationFrame @update.bind @
#     @ticking = true
#     return

#   update: ->
#     currentScrollY = @latestKnownScrollY
#     @ticking = false
#     if currentScrollY > 19
#       $menu
#         .removeClass('navbar--abs')
#         .addClass('navbar--fix')
#     else
#       $menu
#         .removeClass('navbar--fix')
#         .addClass('navbar--abs')
#     return

# scroller = new Scroller
# scroller.init()
