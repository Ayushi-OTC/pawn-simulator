require 'spec_helper'

describe Compass do
  subject { Compass.new }

  context "#movements should return the new position of the pawn" do
    context "#move command with with 1 step" do
      it "down" do
        expect(subject.direction[:south1]).to eq ({:x=>0, :y=>-1})
      end

      it "up" do
        expect(subject.direction[:north1]).to eq ({:x=>0, :y=>1})
      end

      it "right" do
        expect(subject.direction[:west1]).to eq ({:x=>-1, :y=>0})
      end

      it "left" do
        expect(subject.direction[:east1]).to eq ({:x=>1, :y=>0})
      end
    end

    context "#move command with with 2 steps" do
      it "down" do
        expect(subject.direction[:south2]).to eq ({:x=>0, :y=>-2})
      end

      it "up" do
        expect(subject.direction[:north2]).to eq ({:x=>0, :y=>2})
      end

      it "right" do
        expect(subject.direction[:west2]).to eq ({:x=>-2, :y=>0})
      end

      it "left" do
        expect(subject.direction[:east2]).to eq ({:x=>2, :y=>0})
      end
    end

    context "Rotate right or left" do
      it "move left/right when pointing in one direction" do
        expect(subject.rotate(:left)).to eq(-90)
        expect(subject.rotate(:right)).to eq(90)
      end
    end
  end

  context "#to_quadrant" do
    it "should reduce to < 360 if any grad is greater than 360" do
      expect(subject.to_quadrant(380)).to eq 20
    end
    it "should return the error when the operation can't be done" do
      expect{subject.to_quadrant("passing a string as argument")}.to raise_error ArgumentError
    end
  end

  context "#to_direction" do
    it "should return the direction as per the grad value" do
      expect(subject.grad_to_direction(0)).to eq :north
      expect(subject.grad_to_direction(360)).to eq :north
      expect(subject.grad_to_direction(90)).to eq :east
      expect(subject.grad_to_direction(180)).to eq :south
      expect(subject.grad_to_direction(270)).to eq :west
    end
  end
end
