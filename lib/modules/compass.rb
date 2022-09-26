class Compass

  # This will add or remove 90 deg depending on the type of rotation
  def rotate(side)
    send(side)
  end

  # Translate the given coordinates into a direction
  def grad_to_direction(grads)
    angle = to_quadrant(grads)
    case angle
    when 0, 360   then :north
    when 90       then :east
    when 180      then :south
    when 270      then :west
    else raise "Wrong direction, the angle provided was: #{angle}"
    end
  end

  # This will translate the direction into grads
  def direction_to_grads(direction)
    case direction.to_s.downcase.to_sym
    when :north     then 0
    when :east      then 90
    when :south     then 180
    when :west      then 270
    else raise "Pawn can't move in #{direction}"
    end
  end

  # Translate an Integer into an angle in a 360° quadrant
  def to_quadrant(grads)
    Integer(grads) % 360     # Converting grads(integer) into an angle
  end

  def left
    -90
  end

  def right
    +90
  end

  def direction
    directions_list
  end

  # The Compass will complain if it doesn't know the direction
  def method_missing(undefined_meth_yet,*args,&block)
    raise "direction #{undefined_meth_yet} not implemented yet, define it in #{__FILE__}"
  end

  private

  def directions_list
    {
      :south1 => {
        :x => 0,
        :y => -1,
      }.freeze,
      :south2 => {
        :x => 0,
        :y => -2,
      }.freeze,
      :north1 => {
        :x => 0,
        :y => 1,
      }.freeze,
      :north2 => {
        :x => 0,
        :y => 2,
      }.freeze,
      :east1 => {
        :x => 1,
        :y => 0,
      }.freeze,
      :east2 => {
        :x => 2,
        :y => 0,
      }.freeze,
      :west1 => {
        :x => -1,
        :y => 0,
      }.freeze,
      :west2 => {
        :x => -2,
        :y => 0,
      }.freeze,
    }.freeze
  end
end
