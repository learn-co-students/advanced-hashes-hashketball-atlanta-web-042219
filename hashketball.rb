require 'pry'

def game_hash	
  {	
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
            },	
    :home => { :team_name => "Brooklyn Nets",	
                :colors => ["Black", "White"],	
                :players => {	
                   "Alan Anderson" =>	{
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
            }	
  }	
end


def num_points_scored(player_name)
  game_hash.each do |h_or_a, all_team_info|
    all_team_info[:players].each do |player, stats|
      if player == player_name
        return stats[:points]
      end
    end 
  end 
end 

def shoe_size(player_name)
  game_hash.each do |h_or_a, all_team_info|
    all_team_info[:players].each do |player, stats|
      if player == player_name
        return stats[:shoe]
      end
    end
  end
end 

def team_colors(team_name)
  game_hash.each do |h_or_a, all_team_info|
    if all_team_info[:team_name] == team_name
      return all_team_info[:colors]
    end 
  end 
end 

def team_names
team_name_array = []
  game_hash.each do |h_or_a, all_team_info|
    team_name_array << all_team_info[:team_name]
  end 
  return team_name_array
end 
  
def player_numbers(team_name)
  all_jersey_numbers = []
  game_hash.each do |h_or_a, all_team_info|
    if all_team_info[:team_name] == team_name
      all_team_info[:players].each do |players, stats|
        all_jersey_numbers << stats[:number]
      end 
    end 
  end
  return all_jersey_numbers
end 

def player_stats(player_name)
  game_hash.each do |h_or_a, all_team_info|
      all_team_info[:players].each do |player, stats|
        if player == player_name
          return stats
        end 
      end 
  end 
end 


def big_shoe_rebounds
  shoe_size = -1 
  rebounds = nil 
  game_hash.each do |h_or_a, all_team_info|
    all_team_info[:players].each do |player, stats|
      if shoe_size < stats[:shoe]
        shoe_size = stats[:shoe]
        rebounds = stats[:rebounds]
      end
    end
  end 
  return rebounds
end 
      
def most_points_scored
   most_points_player = -1
   player_name = nil 
   game_hash.each do |h_or_a, all_team_info|
     all_team_info[:players].each do |player, stats|
        if most_points_player < stats[:points]
          most_points_player = stats[:points]
          player_name = player
        end 
     end
    end 
    
    player_name     
     
end 

def winning_team
  winner = nil 
  total_team_points1 = 0
  total_team_points2 = 0
  game_hash[:home][:players].each do |player, stats|
    total_team_points1 = total_team_points1 + stats[:points]
  end 
  game_hash[:away][:players].each do |player, stats|
    total_team_points2 =total_team_points2 + stats[:points]
  end 
    if total_team_points1 < total_team_points2
      winner  = game_hash[:away][:team_name]
    else
      winner = game_hash[:home][:team_name]
    end 
  winner
end 
      






















  