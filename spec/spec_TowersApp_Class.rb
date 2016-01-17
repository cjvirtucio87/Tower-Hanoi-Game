require "Towers_Class"
require "TowersApp_Class"


describe TowersApp do
  towers_game = TowersApp.new(Towers.new)

  describe "#player_name_prompt" do
    context "when given a name like with erroneous capitalization" do
      it "returns a corrected version of the name" do
        towers_game.stub(:gets) {"jImmY"}
        expect(towers_game.player_name_prompt).to eq ("Jimmy")
      end
    end
  end

  describe "#difficulty_prompt" do
    context "when given a difficulty setting with erroneous capitalization" do
      it "returns the setting with downcased letters" do
        towers_game.stub(:gets) {"EAsY"}
        expect(towers_game.difficulty_prompt).to eq (:easy)
      end
    end
  end

  describe "#source_tower_choice" do
    it "returns a symbol representing the tower from which a disc will be removed" do
      towers_game.set_difficulty(:easy)
      towers_game.build_towers
      towers_game.stub(:gets) {"first"}
      expect(towers_game.source_tower_choice).to eq (:first)
    end
  end
end
