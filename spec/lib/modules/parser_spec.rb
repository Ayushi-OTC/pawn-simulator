require 'spec_helper'

describe Parser do
  subject { Parser.new }

  context "#parse" do
    context "returns the valid command with the params for:" do
      it "move" do 
        expect(subject.parse("MOVE")).to eq ["MOVE"]
      end

      it "right" do
        expect(subject.parse("RIGHT")).to eq ["RIGHT"]
      end

      it "left" do
        expect(subject.parse("LEFT")).to eq ["LEFT"]
      end

      it "report" do
        expect(subject.parse("REPORT")).to eq ["REPORT"]
      end

      it "place" do
        expect(subject.parse("PLACE 1,1,NORTH")).to eq ["PLACE"]
      end
    end
  end
end
