Spine = require('spine')

class Person extends Spine.Model
  @configure 'Person'

  draw: (x, y) ->
    @image = new Image()
    randomNum = Math.floor(Math.random() * 7)
    @image.src = "/images/faces/face_#{randomNum}.png"
    @image.onload = =>
      @newHeight = (window.IMAGE_WIDTH / (@image.width / @image.height))
      @context.drawImage(@image, x, y, window.IMAGE_WIDTH, @newHeight )
  
module.exports = Person
