require 'spec_helper'

RSpec.describe Play do

  let!(:movement) { Movement.new }
  let!(:play) { Play.new({movement: movement}) }
  let!(:valid_commands) { %w(PLACE REPORT LEFT RIGHT) }
  let!(:not_valid_commands) { %w(repo placeee rig leftthj moveeasd) }

  context "#get_position with valid commands" do

    it "places the pawn on the board on given position" do
      play.get_position('PLACE 2,3,NORTH,WHITE')
      expect(play.movement.report).to eq [2, 3, "NORTH", "WHITE"]
    end

    it "converts input of RIGHT command to right" do
      play.get_position('PLACE 2,3,NORTH,WHITE')
      play.get_position('RIGHT')
      expect(play.movement.report).to eq [2, 3, "EAST", "WHITE"]
    end

    it "converts input of LEFT command to left" do
      play.get_position('PLACE 4,6,EAST,WHITE')
      play.get_position('LEFT')
      expect(play.movement.report).to eq [4, 6, "NORTH", "WHITE"]
    end

    it "displays the current position of pawn" do
      expect(play.get_position('report')).to eq [0, 0, "NORTH", "WHITE"]
    end    

    it "moves the pawn on the board" do
      play.get_position('PLACE 0,0,NORTH,WHITE')
      play.get_position('MOVE')
      expect(play.movement.report).to eq [0, 1, "NORTH", "BLACK"]
    end
  end

  context "#get_position with invalid commands" do
    it "should return false" do
      not_valid_commands.each do |c|
        expect(play.get_position(c)).to include "doesn't know how to perform"
      end
    end
  end

  context "Do the demo set of commands from Specs" do
    it "example one" do
      play.get_position('PLACE 0,0,NORTH,WHITE')
      play.get_position('MOVE')
      expect(play.movement.report).to eq [0, 1, "NORTH", "BLACK"]
    end

    it "example two" do
      play.get_position('PLACE 0,0,EAST,WHITE')
      play.get_position('LEFT')
      expect(play.movement.report).to eq [0, 0, "NORTH", "WHITE"]
    end

    it "example three" do
      play.get_position('PLACE 1,2,EAST,BLACK')
      play.get_position('MOVE 2')
      play.get_position('MOVE')
      play.get_position('LEFT')
      play.get_position('MOVE')
      expect(play.movement.report).to eq [4, 3, "NORTH", "BLACK"]
    end
  end
end
