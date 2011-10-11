require('lib/setup')

Spine = require('spine')
Person = require('models/person')
Me = require('models/me')

class App extends Spine.Controller
  events:
    "click #myCanvas":  "click"

  constructor: ->
    super
    # I prefer document.getElementById in these instances because jQuery returns arrays.
    # I find this is more precise.
    @canvas = document.getElementById('myCanvas')
    @video = document.getElementById('myVideo')
    @context = @canvas.getContext('2d')
    @me = new Me(context: @context)
    @people = []

  draw: ->
    count = 300
    @people = while count -= 1
      person = new Person(context: @context)
      [x,y] = @randomLocation()
      person.draw(x, y)
      person
    [x,y] = @randomLocation()
    # ensure that I'm not off the page entirely
    x -= window.IMAGE_WIDTH if x + window.IMAGE_WIDTH >= @canvas.width
    y -= 50 if y + 50 >= @canvas.height
    @me.draw(x, y)

  randomLocation: ->
    x = Math.floor(Math.random() * @canvas.width)
    y = Math.floor(Math.random() * @canvas.height)
    [x, y]

  click: (e) =>
    [x, y] = @getClickLocation(e)
    if @me.pointIsInSelf(x, y)
      $(@video).show()
      $(@video).bind "ended", =>
        $(@video).hide()
        @canvas.width = @canvas.width # clears the canvas
        @draw()
      randomNum = Math.floor(Math.random() * 7)
      @video.src = "/vids/#{randomNum}.mp4"
      @video.play()

  getClickLocation: (e) =>
    x = e.offsetX
    y = e.offsetY
    [x, y]

module.exports = App
window.IMAGE_WIDTH = 50

$ = jQuery

$ ->
  app = new App
  app.draw()
