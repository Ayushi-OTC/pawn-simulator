require_relative "../lib/pawn.rb"

puts "Welcome to Pawn Movement"

puts "\n GIVE COMMAND TO RUN PAWN ==> RIGHT, LEFT, MOVE, REPORT, PLACE \n\n"

player = Play.new

count = 0
first_move_command = true

loop do
  puts "\n => Give a new command:"

  val = gets.chomp
  cmd = val.split

  unless cmd.empty?
    validations = Validations::CheckMovement.new(cmd, first_move_command, count)
    validations.check_validations

    aa = player.get_position(val)
    first_move_command = false if cmd[0].downcase == 'move'
    print "REPORT #{aa}"
    count += 1
  else
    raise 'Please enter a valid command'
  end
end
