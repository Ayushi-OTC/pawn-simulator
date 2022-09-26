module Validations
  class CheckMovement
    def initialize(cmd, first_move_command, count)
      @command = cmd
      @count = count
      @first_move_command = first_move_command

    end

    def check_validations
      if @count == 0
        if !['place'].include?(@command[0].downcase)
          raise 'Please provide PLACE command since the first valid command is a PLACE command'
        end
      end

      if @command[0].downcase == 'move'
        steps = @command[1].to_i
        raise "Pawn cannot move more than 2 steps" if steps > 2
        raise "Pawn can move 2 steps only in very first MOVE command" if !@first_move_command && steps > 1
      end
    end
  end
end
