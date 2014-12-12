class Player
  def initialize(window)
    @image = Gosu::Image.new(window, "img/apache.png", false)
    @x = @y = @vel_x = @vel_y = @angle = 0.0
    @score = 0
  end

  def warp(x, y)
    @x, @y = x, y
  end

  def turn_left
    @angle -= 4.5
  end

  def turn_right
    @angle += 4.5
  end

  def accelerate
    @vel_x += Gosu::offset_x(@angle, 0.5)
    @vel_y += Gosu::offset_y(@angle, 0.5)
  end

  def move
    @x += @vel_x
    @y += @vel_y
    @x %= 1000
    @y %= 600

    @vel_x *= 0.70
    @vel_y *= 0.90
  end

  def draw
    @image.draw_rot(@x, @y, 1, @angle)
  end
end
