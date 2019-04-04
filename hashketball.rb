require "pry"

def game_hash
  g_hash = {
    home: {team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: {
      "Alan Anderson" => {
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
    },
    "Reggie Evans" => {
      number: 30,
      shoe: 14,
      points: 12,
      rebounds: 12,
      assists: 12,
      steals: 12,
      blocks: 12,
      slam_dunks: 7
  },
  "Brook Lopez" => {
    number: 11,
    shoe: 17,
    points: 17,
    rebounds: 19,
    assists: 10,
    steals: 3,
    blocks: 1,
    slam_dunks: 15
},
"Mason Plumlee" => {
  number: 1,
  shoe: 19,
  points: 26,
  rebounds: 12,
  assists: 6,
  steals: 3,
  blocks: 8,
  slam_dunks: 5
},
"Jason Terry" => {
  number: 31,
  shoe: 15,
  points: 19,
  rebounds: 2,
  assists: 2,
  steals: 4,
  blocks: 11,
  slam_dunks: 1
}
    }
    },
    away: {team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: {
      "Jeff Adrien" => {
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
    },
    "Bismak Biyombo" => {
      number: 0,
      shoe: 16,
      points: 12,
      rebounds: 4,
      assists: 7,
      steals: 7,
      blocks: 15,
      slam_dunks: 10
  },
  "DeSagna Diop" => {
    number: 2,
    shoe: 14,
    points: 24,
    rebounds: 12,
    assists: 12,
    steals: 4,
    blocks: 5,
    slam_dunks: 5
},
"Ben Gordon" => {
  number: 8,
  shoe: 15,
  points: 33,
  rebounds: 3,
  assists: 2,
  steals: 1,
  blocks: 1,
  slam_dunks: 0
},
"Brendan Haywood" => {
  number: 33,
  shoe: 15,
  points: 6,
  rebounds: 12,
  assists: 12,
  steals: 22,
  blocks: 5,
  slam_dunks: 12
}
    }
    }
}

end

def num_points_scored(name)
  home_players = game_hash[:home][:players].keys

  if home_players.include?(name)
  game_hash[:home][:players][name][:points]
  else game_hash[:away][:players][name][:points]

  end
end

def shoe_size(name)
  home_players = game_hash[:home][:players].keys

  if home_players.include?(name)
  game_hash[:home][:players][name][:shoe]
  else game_hash[:away][:players][name][:shoe]

  end
end

def team_colors(team)

  if game_hash[:home][:team_name] == team
    game_hash[:home][:colors]
  else game_hash[:away][:colors]

  end
end

def team_names
  team_array = []
  team_array << game_hash[:home][:team_name]
  team_array << game_hash[:away][:team_name]
  team_array
end

def player_numbers(team)

  jersey_numbers = []

  if game_hash[:home][:team_name] == team

    game_hash[:home][:players].each do |player, stats|
      stats.each do |stat, value|
        if stat == :number
          jersey_numbers << value
        end
      end
    end

  else game_hash[:away][:players].each do |player, stats|
    stats.each do |stat, value|
      if stat == :number
        jersey_numbers << value
      end
      end
    end
  end
  jersey_numbers
end

def player_stats(name)
  home_players = game_hash[:home][:players].keys

  if home_players.include?(name)
  game_hash[:home][:players][name]
  else game_hash[:away][:players][name]

  end
end

def big_shoe_rebounds
  result = nil
  rebounds_and_shoes = []
  shoe_sizes = []

  game_hash[:home][:players].each do |player, stats|
    stats.each do |stat, value|
      if stat == :rebounds
        rebounds_and_shoes << value
      elsif stat == :shoe
        rebounds_and_shoes << value
        shoe_sizes << value
      end
    end
  end
  game_hash[:away][:players].each do |player, stats|
    stats.each do |stat, value|
      if stat == :rebounds
        rebounds_and_shoes << value
      elsif stat == :shoe
        rebounds_and_shoes << value
        shoe_sizes << value
      end
    end
  end

rebounds_and_shoes.each do |value|
  if value == shoe_sizes.max
    result = rebounds_and_shoes[shoe_sizes.index(shoe_sizes.max)]
    end
end
result
end
