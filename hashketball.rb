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
          :slam_dunks =>1
        },
        "Reggie Evans" => {
          :number => 30,
          :shoe =>  14,
          :points => 12,
          :rebounds => 12,
          :assists => 12,
          :steals => 12,
          :blocks => 12,
          :slam_dunks => 7
        }, "Brook Lopez" => {
          :number => 11,
          :shoe => 17,
          :points => 17,
          :rebounds => 19,
          :assists => 10,
          :steals => 3,
          :blocks => 1,
          :slam_dunks => 15
        }, "Mason Plumlee" => {
          :number => 1,
          :shoe => 19,
          :points => 26,
          :rebounds => 12,
          :assists => 6,
          :steals => 3,
          :blocks => 8,
          :slam_dunks => 5
        }, "Jason Terry" => {
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
    :away => { :team_name => "Charlotte Hornets",
                    :colors => ["Turquoise", "Purple"],
                    :players => {
                       "Jeff Adrien"=> {
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
                      "DeSagna Diop"=> {
                      :number => 2,
                      :shoe => 14,
                      :points => 24,
                      :rebounds => 12,
                      :assists => 12,
                      :steals => 4,
                      :blocks => 5,
                      :slam_dunks => 5
                      },
                       "Ben Gordon"=> {
                      :number => 8,
                      :shoe => 15,
                      :points => 33,
                      :rebounds => 3,
                      :assists => 2,
                      :steals => 1,
                      :blocks => 1,
                      :slam_dunks => 0
                      },
                     "Brendan Haywood"=> {
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

def num_points_scored(player)
  game_hash.each do |location, team|
    #binding.pry
    team[:players].each do |name, stats|
      if name == player
        return stats[:points]
      end
    end
  end
end

def shoe_size(player_name)
  game_hash.each do |location, team|
    team[:players].each do |name, stats|
      if name == player_name
        return stats[:shoe]
      end
    end
  end
end

def team_colors(team_name)
  game_hash.each do |location, teams|
     if teams[:team_name] == team_name
       return teams[:colors]
    end
  end
end

def team_names
  new_team_array = []
  game_hash.collect do  |location, team_info|
    new_team_array << team_info[:team_name]
  #binding.pry
  end
  new_team_array
end

def player_numbers(team_name)
  all_team_players_numbers = []
  game_hash.each do |location, all_team_info|
    if all_team_info[:team_name] == team_name
      all_team_info[:players].each do | name, stats|
        all_team_players_numbers << stats[:number]
      end
    end
  end
  return all_team_players_numbers
end

def player_stats(player_name)
  game_hash.each do |location, all_team_info|
     all_team_info[:players].each do |name, stats|
       #binding.pry
       if name == player_name
          return stats
       end
     end
  end
end

def big_shoe_rebounds
  number_rebounds = nil
  biggest_shoe = 0
  game_hash.each do |location, all_team_info|
    all_team_info[:players].each do |name, stats|
      if biggest_shoe < stats[:shoe]
        biggest_shoe = stats[:shoe]
        number_rebounds = stats[:rebounds]
      end
    end
  end
  return number_rebounds
end

def most_points_scored
  most_points_player = ""
  most_number_points = 0
  game_hash.each do |location, all_team_info|
    all_team_info[:players].each do |name, stats|
      if most_number_points < stats[:points]
        most_number_points = stats[:points]
        most_points_player = name
      end
    end
  end
  return most_points_player
end

def winning_team
  winning_team = ""
  home_team_points = 0
  away_team_points = 0
  game_hash[:home][:players].each do |name, stats|
    home_team_points = home_team_points + stats[:points]
  end
  game_hash[:away][:players].each do |name, stats|
    away_team_points = away_team_points + stats[:points]
  end
  if home_team_points > away_team_points
    winning_team = game_hash[:home][:team_name]
  else
    winning_team = game_hash[:away][:team_name]
  end
  return winning_team
end

def player_with_longest_name
  longest_name = ""
  most_letters = 0
  game_hash.each do |location, all_team_info|
    all_team_info[:players].each do |name, stats|
      if name.length > most_letters
        most_letters = name.length
        longest_name = name
      end
    end
  end
  return longest_name
end

def long_name_steals_a_ton?
  most_number_steals = -1
  most_steals_player = nil
  game_hash.each do |location, all_team_info|
    all_team_info[:players].each do |name, stats|
      if stats[:steals] > most_number_steals
        most_number_steals = stats[:steals]
        most_steals_player = name
      end
    end
  end
  return most_steals_player == player_with_longest_name
end
