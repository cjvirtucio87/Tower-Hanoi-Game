require "Towers_Class"


describe Towers do
  towers_game = Towers.new

  describe "#set_player_name" do
    it "sets the player's name based on the string passed as an argument" do
      expect(towers_game.set_player_name("Jimmy")).to eq("Jimmy")
    end
  end

  #The difficulty setting has to be a symbol for the hash.
  describe "#set_difficulty" do
    it "sets the difficulty for the game" do
      expect(towers_game.set_difficulty(:easy)).to eq(:easy)
    end
  end

  describe "#disc_num" do
    context "given a selected difficulty of :medium" do
      it "returns the number of discs on the first tower as 5" do
        towers_game.set_difficulty(:medium)
        towers_game.build_towers
        expect(towers_game.disc_num).to eq(5)
      end
    end
  end

  describe "#status" do
    context "given the selected difficulty of :easy'" do
      it "returns a list of the towers" do
        towers_game.set_difficulty(:easy)
        towers_game.build_towers
        expect(towers_game.status).to eq("[3, 2, 1]\n[]\n[]")
      end
    end
  end

  describe "#move_disc" do
    context "given :first as the source tower and :third as the destination tower" do
      it "moves the topmost disc in the first tower to the third tower" do
        towers_game.move_disc(:first, :third)
        expect(towers_game.status).to eq("[3, 2]\n[]\n[1]")
      end
    end
  end

  describe "#win?" do
    it "returns true if the all three discs are on the third tower" do
      towers_game.towers[:first] = []
      towers_game.towers[:third] = [3, 2, 1]
      expect(towers_game.win?).to be(true)
    end
  end
end
