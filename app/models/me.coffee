Spine = require('spine')

class Me extends Spine.Model
  @configure 'Me'

  myX = 0
  myY = 0
  newHeight = 0

  constructor: ->
    super

  draw: (x, y) ->
    myX = x
    myY = y
    @image = new Image()
    @image.src = '/images/me.png'
    @image.onload = =>
      newHeight = (window.IMAGE_WIDTH / (@image.width / @image.height))
      @context.drawImage(@image, myX, myY, window.IMAGE_WIDTH, newHeight)
  
  pointIsInSelf: (x, y) ->
    inSelf = true
    if x < myX or x > myX + window.IMAGE_WIDTH
      inSelf = false
    if y < myY or y > myY + newHeight
      inSelf = false
    inSelf

module.exports = Me
