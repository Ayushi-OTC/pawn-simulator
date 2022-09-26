class Parser
  def parse(cmd)
    @to_execute = []
    cmd = cmd.split
    command = cmd[0].to_s

    @to_execute << command

    if cmd[0] == 'place'
      set_arguments!(cmd[1])
    end

    if cmd[0] == 'move'
      @to_execute.push(nil, nil, nil, nil)
      cmd[1] = '1' if cmd[1].nil?
      @to_execute.push(cmd[1])
    end

    @to_execute.to_a
  end

  def set_arguments!(args)
    return if args.nil?     # return nil in case there are no arguments
    args = args.split(",")
    x, y, f, colour = args[0].to_i, args[1].to_i, args[2], args[3]
    # using the helper function to convert the string into an angle (i.e. north => 0)
    direction = Compass.new.direction_to_grads(f)
    @to_execute.push(x, y, direction, colour)
  end
end
