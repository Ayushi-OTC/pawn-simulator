require 'spec_helper'

describe Movement do
  let!(:movement) { Movement.new }
  let!(:compass) { Compass.new }

  context "#initialize" do
    it "is expected to be initialized with the position 0,0 by default" do
      expect(movement.report).to eq [0, 0, "NORTH", "WHITE"]
    end

    it "is expected to set to the default size of board" do
      expect(movement.board).to_not be nil
    end
  end

  context "#set position" do
    it "should set the value of pawn based on the (x, y) coordinates" do
      expect(movement.place(2,2,'white',0)).to eq([2, 2, "NORTH", "WHITE"])
    end

    it "should set the new position of the pawn and return the current position" do
      movement.place(2,2,'black',0)
      expect(movement.report).to eq [2, 2, "NORTH", "BLACK"]
    end

    it "returns nil if trying to pass invalid coordinates to the PLACE command" do
      expect(movement.place(345345,44, "right")).to eq("Pawn cannot move to invalid position")
    end
  end

  context "#current x and current y" do
    it "returns the value of current x coordinate" do
      expect(movement.current_x).to be(0)
    end

    it "returns the value of current y coordinate" do
      expect(movement.current_y).to be(0)
    end
  end

  context "#move right" do
    it "rotates the pawn 90 degrees in the specified direction without changing the position" do
      movement.right
      expect(movement.report).to eq([0, 0, "EAST", "WHITE"])
    end
  end

  context "#move left" do
    it "rotates the pawn 90 degrees in the specified direction without changing the position" do
      movement.left
      expect(movement.report).to eq([0, 0, "WEST", "WHITE"])
    end
  end

  context "#move" do
    it "should return true" do
      movement.place(0,0,'BLACK',0)
      expect(movement.move(1)).to eq([0, 1, "NORTH", "WHITE"])
    end

    it "should move the pawn one position further in the direction it is currently" do
      movement.place(0,0,'WHITE',0)
      movement.move(2)
      expect(movement.report).to eq [0, 2, "NORTH", "WHITE"]
    end

    it "should not move the pawn if the movement make it fall from the table" do
      movement.place(0,0,'WHITE',180)
      expect(movement.move(1)).to eq("Pawn cannot move to invalid position")
    end
  end

  context "#report" do
    it "should show the position of the pawn" do
      dir = compass.grad_to_direction(270)
      movement.place(3, 4, 'white', 270)
      expect(movement.report).to eq [3, 4, dir.upcase.to_s, 'white'.upcase]
    end
  end

  describe ".method_missing" do
    it "should always tell that the pawn can't perform the action required" do
      expect( movement.send("pawn_action_#{srand}".to_sym) ).to include "doesn't know how to perform"
    end
  end
end
