Spine = require('spine')

class Person extends Spine.Model
  @configure 'Person'

  draw: (x, y) ->
    @image = new Image()
    randomNum = Math.floor(Math.random() * 12)
    @image.src = "/images/faces/face_#{randomNum}.png"
    @image.onload = =>
      width = (window.IMAGE_WIDTH - 10) + Math.floor(Math.random() * 20)
      @newHeight = (width / (@image.width / @image.height))
      @context.drawImage(@image, x, y, width, @newHeight )
  
module.exports = Person
