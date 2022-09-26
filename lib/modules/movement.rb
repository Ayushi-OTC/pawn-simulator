class Movement
  attr_reader :board, :compass, :current_x, :current_y, :direction, :colour

  def initialize(options={})
    @board   = Board.new
    @compass = Compass.new
    @current_x, @current_y, @direction, @colour = 0, 0, 0, 'white'   # direction 0 means north
  end

  # This method is assigning new values/coodinates to the pawn and every other method defined here will need to call place to change the position of pawn
  def place(x,y,colour, value = direction, step = nil)
    if can_i_move?(x,y)
      @current_x = x
      @current_y = y
      @direction = value
      @colour = colour

      report
    else
      "Pawn cannot move to invalid position"
    end
  end

  # This will return current coordinates/position of pawn
  def report(*data)
    [current_x, current_y, compass.grad_to_direction(direction).to_s.upcase, colour.to_s.upcase]
  end

  # Through this, pawn can move a step(s) into the current direction
  def move(*data)
    dir       = compass.grad_to_direction(direction)
    dir       = (dir.to_s + data.last.to_s)
    new_value = compass.direction[dir.to_sym]
    new_colour = change_colour(data.last)

    place(current_x + new_value[:x], current_y + new_value[:y], new_colour)
  end

  # This will rotate the pawn to the right side
  def right(*data)
    new_direction = compass.rotate :right
    place(current_x, current_y, colour, direction + new_direction,)
  end

  # This will rotate the pawn to the left side
  def left(*data)
    new_direction = compass.rotate :left
    place(current_x, current_y, colour, direction + new_direction)
  end

  def quit(*data)
    exit! # so you can close the game
  end

  # This will return true if the attemped x,y is in the array of valid coordinates
  def can_i_move?(x, y)
    x, y = x.to_i, y.to_i
    ( x >= 0 && x <= board.width  ) && ( y >= 0 && y <= board.height )
  end

  # This will complain about an action that is not valid
  def method_missing(undefined_meth_yet, *args, &block)
    "#{self.class.to_s} doesn't know how to perform :#{undefined_meth_yet}"
  end

  # This will help in switching the colour value if pawn is moved by 1 position
  def change_colour(step_val)
    if step_val.to_s == "1"
      colour.downcase == 'white' ? 'black' : 'white'
    else
      colour
    end
  end
end
