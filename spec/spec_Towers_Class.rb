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

  describe "#get_disc_sizes" do
    context "given the selected difficulty of :easy'" do
      it "returns an array of disc sizes, each of which is equivalent\n \
                to (n-i) + ((n-i)-1), where \n \
                n = length of the array, and i = current index." do
        towers_game.set_difficulty(:easy)
        towers_game.build_towers
        expect(towers_game.get_disc_sizes).to eq([5, 3, 1])
      end
    end
  end

  describe "#get_space_count" do
    context "given the selected difficulty of :easy" do
      it "returns an array of number of spaces per level,\n \
          each of which is equivalent to (n-1) - i, where \n \
          n = length of the array, and i = current index." do
        towers_game.set_difficulty(:easy)
        expect(towers_game.get_space_count(:first)).to eq([2,1,0])
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
