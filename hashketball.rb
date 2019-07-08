require 'pry'

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          :number => 0,
          :shoe => 16,
          :points => 22,
          :rebounds => 12,
          :assists => 12,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe => 14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        },
        "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        },
        "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        },
        "Jason Terry" => {
          :number => 31,
          :shoe => 15,
          :points => 19,
          :rebounds => 2,
          :assists => 2,
          :steals => 4,
          :blocks => 11,
          :slam_dunks => 1
        }
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          :number => 4,
          :shoe => 18,
          :points => 10,
          :rebounds => 1,
          :assists => 1,
          :steals => 2,
          :blocks => 7,
          :slam_dunks => 2
        },
        "Bismak Biyombo" => {
          :number => 0,
          :shoe => 16,
          :points => 12,
          :rebounds => 4,
          :assists => 7,
          :steals => 7,
          :blocks => 15,
          :slam_dunks => 10
        },
        "DeSagna Diop" => {
          :number => 2,
          :shoe => 14,
          :points => 24,
          :rebounds => 12,
          :assists => 12,
          :steals => 4,
          :blocks => 5,
          :slam_dunks => 5
        },
        "Ben Gordon" => {
          :number => 8,
          :shoe => 15,
          :points => 33,
          :rebounds => 3,
          :assists => 2,
          :steals => 1,
          :blocks => 1,
          :slam_dunks => 0
        },
        "Brendan Haywood" => {
          :number => 33,
          :shoe => 15,
          :points => 6,
          :rebounds => 12,
          :assists => 12,
          :steals => 22,
          :blocks => 5,
          :slam_dunks => 12
        }
      }
    }
  }
end

def num_points_scored(players_name)
  if game_hash[:home][:players].include?(players_name)
    player = game_hash[:home][:players][players_name][:points]
  else
    player = game_hash[:away][:players][players_name][:points]
  end
  player.to_i
end

def shoe_size(players_name)
  if game_hash[:home][:players].include?(players_name)
    player = game_hash[:home][:players][players_name][:shoe].to_i
  else
    player = game_hash[:away][:players][players_name][:shoe].to_i
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name].include?(team_name)
    player = game_hash[:home][:colors]
  else
    player = game_hash[:away][:colors]
  end
end

def team_names
  team_names = []
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
  team_names
end


#takes in argument of team_name
#returns player_numbers for that team
def player_numbers(team)
if team == "Brooklyn Nets"
  brooklyn_numbers = []
  game_hash[:home][:players].each do |key, value|
    value.each do |key, value|
      if key == :number
        brooklyn_numbers << value.to_i
      end
    end
  end
  brooklyn_numbers
else
  charlotte_numbers = []
  game_hash[:away][:players].each do |key, value|
    value.each do |key, value|
      if key == :number
        charlotte_numbers << value.to_i
      end
    end
  end
  charlotte_numbers
end
end

def player_stats(name)
  if game_hash[:home][:players].include?(name)
    return game_hash[:home][:players][name]
  else
    game_hash[:away][:players][name]
  end
end

def all_players
all = game_hash[:home][:players]
	game_hash[:away][:players].each do |key, value|
		all[key] = value
	end
all
end


def player_biggest_shoe_size
  (all_players).max_by{|player, stats| stats.fetch(:shoe)}[1]
end


#find the player with the biggest shoe size
#return that player's number of rebounds
def big_shoe_rebounds
player_biggest_shoe_size[:rebounds]
end
