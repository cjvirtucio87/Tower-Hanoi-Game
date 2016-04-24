#!/usr/bin/ruby

require '../lib/Towers_Class'
require '../lib/TowersApp_Class'

towers_game = TowersApp.new(Towers.new)

towers_game.player_name_prompt
towers_game.difficulty_prompt
towers_game.build_towers

while true
  puts "TOWER STATUS:\n"
  puts towers_game.render
  sleep 1.5
  towers_game.source_tower_choice
  sleep 1.5
  towers_game.destination_tower_choice
  sleep 1.5
  towers_game.move_disc(towers_game.source_tower,towers_game.destination_tower)
  break if towers_game.win?
end

puts "You win! Congratulations!"\
    "\nPlay again next time!"
