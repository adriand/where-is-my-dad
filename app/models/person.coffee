Spine = require('spine')

class Person extends Spine.Model
  @configure 'Person'

  draw: (x, y) ->
    @image = new Image()
    @myX = x
    @myY = y
    randomNum = Math.floor(Math.random() * 4)
    @image.src = "/images/faces/face_#{randomNum}.png"
    @newHeight = (window.IMAGE_WIDTH / (@image.width / @image.height))
    @image.onload = =>
      @context.drawImage(@image, @myX, @myY, window.IMAGE_WIDTH, @newHeight )

  pointIsInSelf: (x, y) ->
    (@myX >= x >= (@myX + window.IMAGE_WIDTH)) && (@myY >= y >= (@myY + @newHeight))

  
module.exports = Person
