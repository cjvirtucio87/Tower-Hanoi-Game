class TowersApp
  attr_accessor :player_name, :app_difficulty, :source_tower, :destination_tower

  def initialize(target_object)
    @target = target_object
    @messages = []
    puts "Welcome to Towers of Hanoi!"
    sleep 1.5
    puts "Please type in your name!"\
    "\nNo spaces, numbers, or special characters!"
  end

  def player_name_prompt
    begin
      @player_name = gets.chomp.downcase.capitalize
      raise StandardError if /\s+|\W|\d/.match(@player_name)
    rescue
      puts "ERROR: did not correctly enter the player's name."\
          " Please try again."
      retry
    end
    self.set_player_name(@player_name)
  end

  def difficulty_prompt
    puts "\nHello, #{@player_name}. Select a difficulty level!"
    puts "[EASY] [MEDIUM] [HARD]"
    begin
      @app_difficulty = gets.chomp.downcase.to_sym
      raise StandardError if %w{easy medium hard}.none? do |diff|
        diff.to_sym == @app_difficulty
      end
    rescue
      puts "ERROR: did not correctly enter the difficulty."\
          " Please try again."
      retry
    end
    self.set_difficulty(@app_difficulty)
  end


  #Check for whether a valid choice of tower was made.
  def tower_choice_error(tower_choice, option = false)
    raise StandardError if %w{first second third}.none? do |choice|
      choice.to_sym == tower_choice
    end
    if option == true
      raise StandardError if self.towers[@source_tower].empty?
    else
      raise StandardError if (self.towers[@destination_tower][-1] < \
                          self.towers[@source_tower][-1])
    end
  end

  #Picking a source tower.
  def source_tower_choice
    puts "From which tower will you remove a disc?"
    begin
      @source_tower = gets.chomp.downcase.to_sym
      self.tower_choice_error(@source_tower, true)
    rescue
      puts "ERROR: did not correctly enter a tower choice."\
        " Please try again."
      retry
    end
    @source_tower
  end


  def destination_tower_choice
    #Picking a destination tower.
    puts "Where would you like to place the disc?"
    begin
      @destination_tower = gets.chomp.downcase.to_sym
      self.tower_choice_error(@destination_tower)
    rescue
      puts "ERROR: did not correctly enter a tower choice."\
          " Please try again."
      retry
    end
    @destination_tower
  end

  def method_missing(method_name, *args, &block)
    @messages << method_name
    @target.send(method_name, *args, &block)
  end
end
