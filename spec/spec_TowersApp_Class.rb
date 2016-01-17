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

  describe "#destination_tower_choice" do
    it "returns a symbol representing the tower from which a disc will be removed" do
      towers_game.set_difficulty(:easy)
      towers_game.build_towers
      towers_game.stub(:gets) {"first"}
      expect(towers_game.source_tower_choice).to eq (:first)
    end
  end

  #Both source_tower_choice and destination_tower_choice use this method
  #to test for errors in player input.
  describe "#tower_choice_error" do
    it "raises an error when the tower name is incorrectly spelled" do
      towers_game.set_difficulty(:easy)
      towers_game.build_towers
      expect{towers_game.tower_choice_error(:segundo, true)}.to raise_error
    end
    it "raises an error when the source tower choice is empty" do
      towers_game.set_difficulty(:easy)
      towers_game.build_towers
      expect{towers_game.tower_choice_error(:second, true)}.to raise_error
    end
    it "raises an error when the topmost disc on the destination tower choice"\
      "is lesser than the topmost disc on the source tower choice" do
      towers_game.set_difficulty(:easy)
      towers_game.build_towers
      towers_game.towers[:first] = [3, 2]
      towers_game.towers[:third] = [1]
      towers_game.source_tower = :first
      expect{towers_game.tower_choice_error(:third, false)}.to raise_error
    end
  end
end
