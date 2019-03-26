def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
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
        slam_dunks: 1,
        },
      "Reggie Evans" => {
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7,
        },
        "Brook Lopez" => {
          number: 11,
          shoe: 17,
          points: 17,
          rebounds: 19,
          assists: 10,
          steals: 3,
          blocks: 1,
          slam_dunks: 15,
          },
          "Mason Plumlee" => {
            number: 1,
            shoe: 19,
            points: 26,
            rebounds: 12,
            assists: 6,
            steals: 3,
            blocks: 8,
            slam_dunks: 5,
            },
            "Jason Terry" => {
              number: 31,
              shoe: 15,
              points: 19,
              rebounds: 2,
              assists: 2,
              steals: 4,
              blocks: 11,
              slam_dunks: 1,
              }
            }
  },
    away: {
      team_name: "Charlotte Hornets",
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
          slam_dunks: 2,
          },
        "Bismak Biyombo" => {
          number: 0,
          shoe: 16,
          points: 12,
          rebounds: 4,
          assists: 7,
          steals: 7,
          blocks: 15,
          slam_dunks: 10,
          },
          "DeSagna Diop" => {
            number: 2,
            shoe: 14,
            points: 24,
            rebounds: 12,
            assists: 12,
            steals: 4,
            blocks: 5,
            slam_dunks: 5,
            },
            "Ben Gordon" => {
              number: 8,
              shoe: 15,
              points: 33,
              rebounds: 3,
              assists: 2,
              steals: 1,
              blocks: 1,
              slam_dunks: 0,
              },
              "Brendan Haywood" => {
                number: 33,
                shoe: 15,
                points: 6,
                rebounds: 12,
                assists: 12,
                steals: 22,
                blocks: 5,
                slam_dunks: 12,
                }
              }
      }
    }
end



def num_points_scored(name)
  game_hash.each do |team_position, team_data|
    game_hash[team_position][:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:points]
      end
    end
  end
end



def shoe_size(name)
  game_hash.each do |team_position, team_data|
    game_hash[team_position][:players].each do |player_name, player_data|
      if name == player_name
        return player_data[:shoe]
      end
    end
  end
end



def team_colors(team_name)
  game_hash.each do |team_position, team_data|
    game_hash[team_position].each do |name, data|
      if team_name == data
        return game_hash[team_position][:colors]
      end
    end
  end
end



def team_names
  teams = []
  game_hash.each do |team_position, team_data|
    teams.push(game_hash[team_position][:team_name])
  end
  return teams
end



def player_numbers(name_of_team)
  numbers = []
  game_hash.each do |team_position, team_data|
    if name_of_team == game_hash[team_position][:team_name]
      game_hash[team_position][:players].each do |name, data|
        numbers.push(data[:number])
      end
    end
  end
  return numbers
end


# def player_stats(name_of_player)
#   game_hash.each do |team_position, team_data|
#     game_hash[team_position][:players].each do |name, data|
#       if name == name_of_player
#         player_stats = data
#       end
#     end
#   end
#   player_stats(name_of_player)
# end

def player_stats(name)
  player_stats = nil
  game_hash.each do |team_position, team_data|
    team_data.each do |name_of_data, data|
      if name_of_data == :players
        data.each do |player_name, stats|
          if player_name == name
            player_stats = stats
          end
        end
      end
    end
  end
  player_stats
end


def big_shoe_rebounds
  maxShoeSize = -1
  resultRebound = -1

  game_hash.each do |team_position, team_data|
    game_hash[team_position][:players].each do |player_name, data|
      if data[:shoe] > maxShoeSize
        maxShoeSize = data[:shoe]
        resultRebound = data[:rebounds]
      end
    end

  end
  return resultRebound
end
