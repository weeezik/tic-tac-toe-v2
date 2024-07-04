require_relative '../lib/game-check'

describe "Game Check method: " do
  context "when a player presses enter" do
    it "returns true or false" do
      expect game_result_check([pos_two, pos_five], 0).to eq(true || false)
    end
  end
end

