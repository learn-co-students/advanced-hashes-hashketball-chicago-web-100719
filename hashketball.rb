require "pry"

def game_hash
  game_hash = { home: { team_name: "Brooklyn Nets",
                        colors: [ "Black", "White" ],
                        players: [ "Alan Anderson" => { number: 0,
                                                         shoe: 16,
                                                         points: 22,
                                                         rebounds: 12,
                                                         assists: 12,
                                                         steals: 3,
                                                         blocks: 1,
                                                         slam_dunks: 1
                                                      },

                                    "Reggie Evans" => { number: 30,
                                                         shoe: 14,
                                                         points: 12,
                                                         rebounds: 12,
                                                         assists: 12,
                                                         steals: 12,
                                                         blocks: 12,
                                                         slam_dunks: 7
                                                      },

                                    "Brook Lopez" => { number: 11,
                                                        shoe: 17,
                                                        points: 17,
                                                        rebounds:19,
                                                        assists: 10,
                                                        steals: 3,
                                                        blocks: 1,
                                                        slam_dunks: 15
                                                     },

                                    "Mason Plumlee" => { number: 1,
                                                          shoe: 19,
                                                          points: 26,
                                                          rebounds: 11,
                                                          assists: 6,
                                                          steals: 3,
                                                          blocks: 8,
                                                          slam_dunks: 5
                                                       },

                                    "Jason Terry" => { number: 31,
                                                        shoe: 15,
                                                        points: 19,
                                                        rebounds: 2,
                                                        assists: 2,
                                                        steals: 4,
                                                        blocks: 11,
                                                        slam_dunks: 1
                                                      }
                        ]
                      },

  away: { team_name: "Charlotte Hornets",
                        colors: [ "Turquoise", "Purple" ],
                        players: [ "Jeff Adrien" => { number: 4,
                                                      shoe: 18,
                                                      points: 10,
                                                      rebounds: 1,
                                                      assists: 1,
                                                      steals: 2,
                                                      blocks: 7,
                                                      slam_dunks: 2
                                                    },

                                  "Bismack Biyombo" => { number: 0,
                                                         shoe: 16,
                                                         points: 12,
                                                         rebounds: 4,
                                                         assists: 7,
                                                         steals: 22,
                                                         blocks: 15,
                                                         slam_dunks: 10
                                                       },

                                  "DeSagna Diop" => { number: 2,
                                                        shoe: 14,
                                                        points: 24,
                                                        rebounds: 12,
                                                        assists: 12,
                                                        steals: 4,
                                                        blocks: 5,
                                                        slam_dunks: 5
                                                      },

                                  "Ben Gordon" => { number: 8,
                                                      shoe: 15,
                                                      points: 33,
                                                      rebounds: 3,
                                                      assists: 2,
                                                      steals: 1,
                                                      blocks: 1,
                                                      slam_dunks: 0
                                                    },

                                  "Kemba Walker" => { number: 33,
                                                      shoe: 15,
                                                      points: 6,
                                                      rebounds: 12,
                                                      assists: 12,
                                                      steals: 7,
                                                      blocks: 5,
                                                      slam_dunks: 12
                                                    }
                        ]
                      }
                    }
end

def num_points_scored(name)
  game_hash.each do |location, team_data|
      team_data[:players].each do |player_hash|
        player_hash.each do |player_name, player_data|
          return player_data[:points] if player_name == name
        end
    end
  end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        return player_data[:shoe] if player_name == name
      end
    end
  end
end

def team_colors(name)
  game_hash.each do |location, team_data|
    return team_data[:colors] if team_data[:team_name] == name
  end
end

def team_names
  team_names = []
  team_names << game_hash[:home][:team_name]
  team_names << game_hash[:away][:team_name]
end

def player_numbers(team_name)
  player_numbers = []

  if game_hash[:home][:team_name] == team_name
    game_hash[:home][:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        player_numbers << player_data[:number]
      end
    end
  elsif game_hash[:away][:team_name] == team_name
    game_hash[:away][:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        player_numbers << player_data[:number]
      end
    end
  else
    return nil
  end

  player_numbers
end

def player_stats(name)
  player_stats = {}

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        player_data.each do |attribute, data|
          player_stats[attribute] = data if player_name == name
        end
      end
    end
  end

  player_stats
end

def big_shoe_rebounds
  shoe_sizes = []
  big_foot = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        shoe_sizes << player_data[:shoe]
        big_foot = shoe_sizes.max
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        return player_data[:rebounds] if player_data[:shoe] == big_foot
      end
    end
  end
end

def most_points_scored
  all_points = []
  most_points_scored = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        all_points << player_data[:points]
        most_points_scored = all_points.max
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        return player_name if player_data[:points] == most_points_scored
      end
    end
  end
end

def winning_team
  home_points = 0
  away_points = 0

  game_hash[:home][:players].each do |player_hash|
     player_hash.each do |player_name, player_data|
       home_points += player_data[:points]
     end
  end

  game_hash[:away][:players].each do |player_hash|
    player_hash.each do |player_name, player_data|
      away_points += player_data[:points]
    end
  end

  if home_points > away_points
    return game_hash[:home][:team_name]
  elsif away_points > home_points
    return game_hash[:away][:team_name]
  end

end

def player_with_longest_name
  player_names = []
  longest_name = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        player_names << player_name
        longest_name = player_names.max_by { |name| name.length }
      end
    end
  end

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        return player_name if player_name == longest_name
      end
    end
  end
end

def long_name_steals_a_ton?
  all_steals = []
  most_steals = nil
  player_with_most_steals = nil

  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, player_data|
        all_steals << player_data[:steals]
        most_steals = all_steals.max
        player_with_most_steals = player_name if player_data[:steals] == most_steals
      end
    end
  end

  return true if player_with_longest_name == player_with_most_steals
end
