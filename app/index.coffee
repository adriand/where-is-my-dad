require('lib/setup')

Spine = require('spine')
Person = require('models/person')
Me = require('models/me')

class App extends Spine.Controller
  events:
    "click #myCanvas":  "click"

  constructor: ->
    super
    @canvas = document.getElementById('myCanvas')
    @context = @canvas.getContext('2d')
    @me = new Me(context: @context)
    @people = []

  draw: ->
    count = 200
    @people = while count -= 1
      person = new Person(context: @context)
      [x,y] = @randomLocation()
      person.draw(x, y)
      person
    [x,y] = @randomLocation()
    @me.draw(x, y)

  randomLocation: ->
    x = Math.floor(Math.random() * @canvas.width)
    y = Math.floor(Math.random() * @canvas.height)
    [x, y]

  click: (e) =>
    [x, y] = @getClickLocation(e)
    if @me.pointIsInSelf(x, y)
      alert("Found me!")

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
