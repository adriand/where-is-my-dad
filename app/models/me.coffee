Spine = require('spine')

class Me extends Spine.Model
  @configure 'Me'

  draw: (x, y) ->
    @image = new Image()
    @image.src = '/images/me.png'
    @image.onload = =>
      @context.drawImage(@image, x, y, window.IMAGE_WIDTH, (window.IMAGE_WIDTH / (@image.width / @image.height)) )
  
module.exports = Me
