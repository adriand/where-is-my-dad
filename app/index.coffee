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

  draw: ->
    count = 10
    @people = while count -= 1
      person = new Person(context: @context)
      [x,y] = @randomLocation()
      person.draw(x, y)
      person
    @me = new Me(context: @context)
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
    # from http://answers.oreilly.com/topic/1929-how-to-use-the-canvas-and-draw-elements-in-html5/
    # http://stackoverflow.com/questions/55677/how-do-i-get-the-coordinates-of-a-mouse-click-on-a-canvas-element
    if (e.pageX || e.pageY)
      x = e.pageX
      y = e.pageY
    else
      x = e.clientX + document.body.scrollLeft + document.documentElement.scrollLeft
      y = e.clientY + document.body.scrollTop + document.documentElement.scrollTop
    x -= @canvas.offsetLeft;
    y -= @canvas.offsetTop;
    [x, y]

module.exports = App
window.IMAGE_WIDTH = 50

$ = jQuery

$ ->
  app = new App
  app.draw()
