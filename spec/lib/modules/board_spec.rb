require 'spec_helper'

describe Board do
  let!(:board) { Board.new }

  context "#initialize" do
    it "has width and height set by default size" do
      default_size = 7
      expect(board.width).to be default_size
      expect(board.height).to be default_size
    end
  end
end
