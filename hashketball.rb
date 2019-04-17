require "pry"

def game_hash
  game_hash = {
    :home => {
      :team_name => "Brooklyn Nets",
      :colors => ["Black", "White"],
      :players => {
        "Alan Anderson" => {
          number: 0,
          shoe: 16,
          points: 22,
          rebounds: 12,
          assists: 12,
          steals: 3,
          blocks: 1,
          slam_dunks: 1},
        "Reggie Evans" => {
          number: 30,
          shoe: 14,
          points: 12,
          rebounds: 12,
          assists: 12,
          steals: 12,
          blocks: 12,
          slam_dunks: 7},
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15},
        "Mason Plumlee" => {
          number: 1,
          shoe: 19,
          points: 26,
          rebounds: 12,
          assists: 6,
          steals: 3,
          blocks: 8,
          slam_dunks: 5},
        "Jason Terry" => {
          number: 31,
          shoe: 15,
          points: 19,
          rebounds: 2,
          assists: 2,
          steals: 4,
          blocks: 11,
          slam_dunks: 1}
      }
    },
    :away => {
      :team_name => "Charlotte Hornets",
      :colors => ["Turquoise", "Purple"],
      :players => {
        "Jeff Adrien" => {
          number: 4,
          shoe: 18,
          points: 10,
          rebounds: 1,
          assists: 1,
          steals: 2,
          blocks: 7,
          slam_dunks: 2},
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10},
        "DeSagna Diop" => {
          number: 2,
          shoe: 14,
          points: 24,
          rebounds: 12,
          assists: 12,
          steals: 4,
          blocks: 5,
          slam_dunks: 5},
        "Ben Gordon" => {
          number: 8,
          shoe: 15,
          points: 33,
          rebounds: 3,
          assists: 2,
          steals: 1,
          blocks: 1,
          slam_dunks: 0},
        "Brendan Haywood" => {
          number: 33,
          shoe: 15,
          points: 6,
          rebounds: 12,
          assists: 12,
          steals: 22,
          blocks: 5,
          slam_dunks: 12},
      }
    }
  }
end

def both_teams
   home_players = game_hash[:home][:players]
   away_players = game_hash[:away][:players]
   home_players.merge(away_players)
end

def num_points_scored(players_name)
  # both_teams[players_name][:points]
  both_teams.each do |players, stats|
    if players == players_name
      stats.each do |label, num|
        if label == :points
          return num
        end
      end
    end
  end
end

def shoe_size(players_name)
  # both_teams[players_name][:shoe]
  both_teams.each do |players, stats|
  if players == players_name
    stats.each do |label, num|
      if label == :shoe
        return num
        end
      end
    end
  end
end

def team_colors(team_name)
  if game_hash[:home][:team_name] == team_name
    return game_hash[:home][:colors]
  else
    return game_hash[:away][:colors]
  end
end

def team_names
  a = game_hash[:home][:team_name]
  b = game_hash[:away][:team_name]
  return a, b
end

def player_numbers(team_name)
  new_array = []
  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |players, stats|
      stats.each do |label, num|
        if label == :number
        new_array << num
        end
      end
    end
  else
    game_hash[:away][:team_name] == team_name
      game_hash[:away][:players].each do |players, stats|
        stats.each do |label, num|
          if label == :number
          new_array << num
        end
      end
    end
  end
  new_array
end

def player_stats(players_name)
  both_teams.each do |player, stats|
    if player == players_name
      return stats
    end
  end
end

def big_shoe_rebounds
  both_teams.each do |players, stats|
    if players == "Mason Plumlee"
      stats.each do |label, num|
        if label == :rebounds
      return num
      end
    end
  end
  # shoe_sizes = []
  # both_teams.each do |players, stats|
  #   shoe_sizes << stats[:shoe]
  # both_teams.each do |players, stats|
  #   if stats[:shoe] == shoe_sizes.max
  #     return stats[:rebounds]
  end
end
