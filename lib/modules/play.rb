class Play
  attr_reader :movement, :parser
  attr_accessor :command_x, :command_y, :command_f, :command_c

  def initialize(options={})
    @movement   =  Movement.new(options)
    @parser     =  Parser.new
    @command, @command_x, @command_y, @command_f, @command_c = :report, 0, 0, 0, 'white'
  end

  def get_position(cmd)
    @command, @command_x, @command_y, @command_f, @command_c, @step = parser.parse(cmd.downcase)

    if @command == 'place'
      has_arguments? || valid_colour?
    end
    movement.send(@command, @command_x.to_i, @command_y.to_i, @command_c, @command_f, @step )
  end

  private

  # This will check if PLACE command is valid or not
  def has_arguments?
    if (command_x == nil || command_y == nil || command_f == nil || command_c == nil)
      raise "Please pass coordinates, direction and colour with PLACE command"
    end
  end

  # This will check if passed values of colour is valid or not
  def valid_colour?
    unless ['white', 'black'].include?(command_c.downcase)
      raise 'Please input valid colour - WHITE or BLACK'
    end
  end
end
