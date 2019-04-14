def game_hash
	game_hash = {
		home: {
			team_name: "Brooklyn Nets",
			colors: ["Black", "White"],
			players: {
				"Alan Anderson" => {
					number:      0,
					shoe:       16,
					points:     22,
					rebounds:   12,
					assists:    12,
					steals:      3,
					blocks:      1,
					slam_dunks:  1
				},
				"Reggie Evans" => {
					number:     30,
					shoe:       14,
					points:     12,
					rebounds:   12,
					assists:    12,
					steals:     12,
					blocks:     12,
					slam_dunks:  7
				},
				"Brook Lopez" => {
					number:     11,
					shoe:       17,
					points:     17,
					rebounds:   19,
					assists:    10,
					steals:      3,
					blocks:      1,
					slam_dunks: 15
				},
				"Mason Plumlee" => {
					number:      1,
					shoe:       19,
					points:     26,
					rebounds:   12,
					assists:     6,
					steals:      3,
					blocks:      8,
					slam_dunks:  5
				},
				"Jason Terry" => {
					number:     31,
					shoe:       15,
					points:     19,
					rebounds:    2,
					assists:     2,
					steals:      4,
					blocks:     11,
					slam_dunks:  1
				}}},
		away: {
			team_name: "Charlotte Hornets",
			colors: ["Turquoise", "Purple"],
			players: {
				"Jeff Adrien" => {
					number:      4,
					shoe:       18,
					points:     10,
					rebounds:    1,
					assists:     1,
					steals:      2,
					blocks:      7,
					slam_dunks:  2
				},
				"Bismak Biyombo" => {
					number:      0,
					shoe:       16,
					points:     12,
					rebounds:    4,
					assists:     7,
					steals:      7,
					blocks:     15,
					slam_dunks: 10
				},
				"DeSagna Diop" => {
					number:      2,
					shoe:       14,
					points:     24,
					rebounds:   12,
					assists:    12,
					steals:      4,
					blocks:      5,
					slam_dunks:  5
				},
				"Ben Gordon" => {
					number:      8,
					shoe:       15,
					points:     33,
					rebounds:    3,
					assists:     2,
					steals:      1,
					blocks:      1,
					slam_dunks:  0
				},
				"Brendan Haywood" => {
					number:     33,
					shoe:       15,
					points:      6,
					rebounds:   12,
					assists:    12,
					steals:     22,
					blocks:      5,
					slam_dunks: 12
				}}}
	}
end

def num_points_scored(name)
	if game_hash[:home][:players].include?(name)
		game_hash[:home][:players][name][:points]
	else
		game_hash[:away][:players][name][:points]
	end
end

def shoe_size(name)
	if game_hash[:home][:players].include?(name)
		game_hash[:home][:players][name][:shoe]
	else
		game_hash[:away][:players][name][:shoe]
	end
end

def team_colors(team)
	if team == "Brooklyn Nets"
		game_hash[:home][:colors]
	else
		game_hash[:away][:colors]
	end
end

def team_names
	[game_hash[:home][:team_name], game_hash[:away][:team_name]]
end

def player_numbers(team)
	jersey_nums=[]

	if team == "Brooklyn Nets"
		team = :home
	else
		team = :away
	end

	game_hash[team][:players].each {|player, stats|
		stats.each {|stat, num|
			jersey_nums << num if stat == :number
		}
	}

	jersey_nums.sort
end

def player_stats(name)
	if game_hash[:home][:players].include?(name)
		game_hash[:home][:players][name]
	else
		game_hash[:away][:players][name]
	end
end

def big_shoe_rebounds
	max_shoe=0
	rebounds=0

	game_hash[:home][:players].each {|player, stats|
		stats.each {|stat, num|
			if stat == :shoe && num > max_shoe
				max_shoe = num
				rebounds = game_hash[:home][:players][player][:rebounds]
			end
		}
	}
	game_hash[:away][:players].each {|player, stats|
		stats.each {|stat, num|
			if stat == :shoe && num > max_shoe
				max_shoe = num
				rebounds = game_hash[:away][:players][player][:rebounds]
			end
		}
	}

	rebounds
end

# I rebuilt this method using only one group of nested enumerators instead of two. (one for each team) 
# The difference in runtime between the two methods (at this volume of code) was negligible on my machine.
# Using two groups of enumerators was more readable for me, so the rest of the methods use two as well.
def big_shoe_rebounds_version_2
	max_shoe=0
	rebounds=0

	game_hash.each {|team, team_hash|
		team_hash.each {|team_info, data|
			if team_info == :players
				data.each {|player, stats|
					stats.each {|stat, num|
						if stat == :shoe && num > max_shoe
							max_shoe = num
							rebounds = game_hash[team][team_info][player][:rebounds]
						end
					}
				}
			end
		}
	}

	rebounds
end

def most_points_scored
	max_points=0
	p_name=""

	game_hash[:home][:players].each {|player, stats|
		stats.each {|stat, num|
			if stat == :points && num > max_points
				max_points = num
				p_name = player
			end
		}
	}
	game_hash[:away][:players].each {|player, stats|
		stats.each {|stat, num|
			if stat == :points && num > max_points
				max_points = num
				p_name = player
			end
		}
	}

	p_name
end

def winning_team
	home_points=0
	away_points=0

	game_hash[:home][:players].each {|player, stats|
		stats.each {|stat, num|
			home_points += num if stat == :points
		}
	}
	game_hash[:away][:players].each {|player, stats|
		stats.each {|stat, num|
			away_points += num if stat == :points
		}
	}

	if home_points > away_points
		game_hash[:home][:team_name]
	elsif home_points == away_points
		"tie"
	else
		game_hash[:away][:team_name]
	end
end

def player_with_longest_name
	name_size=0
	p_name=""

	game_hash[:home][:players].each {|player, stats|
		if player.size > name_size
			p_name=player
			name_size=player.size
		end
	}
	game_hash[:away][:players].each {|player, stats|
		if player.size > name_size
			p_name=player
			name_size=player.size
		end
	}

	p_name
end
