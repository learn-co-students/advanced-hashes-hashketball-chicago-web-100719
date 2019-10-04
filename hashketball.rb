require "pry"

def game_hash
  game_hash = {
    home: {
      team_name: "Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
        {player_name: "Alan Anderson",
        number: 0,
        shoe: 16,
        points: 22,
        rebounds: 12,
        assists: 12,
        steals: 3,
        blocks: 1,
        slam_dunks: 1
        },
        {player_name: "Reggie Evans",
        number: 30,
        shoe: 14,
        points: 12,
        rebounds: 12,
        assists: 12,
        steals: 12,
        blocks: 12,
        slam_dunks: 7
        },
        {player_name: "Brook Lopez",
        number: 11,
        shoe: 17,
        points: 17,
        rebounds: 19,
        assists: 10,
        steals: 3,
        blocks: 1,
        slam_dunks: 15
        },
        {player_name: "Mason Plumlee",
        number: 1,
        shoe: 19,
        points: 26,
        rebounds: 11,
        assists: 6,
        steals: 3,
        blocks: 8,
        slam_dunks: 5
        },
        {player_name: "Jason Terry",
        number: 31,
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
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
        {player_name: "Jeff Adrien",
        number: 4,
        shoe: 18,
        points: 10,
        rebounds: 1,
        assists: 1,
        steals: 2,
        blocks: 7,
        slam_dunks: 2
        },
        {player_name: "Bismack Biyombo",
        number: 0,
        shoe: 16,
        points: 12,
        rebounds: 4,
        assists: 7,
        steals: 22,
        blocks: 15,
        slam_dunks: 10
        },
        {player_name: "DeSagna Diop",
        number: 2,
        shoe: 14,
        points: 24,
        rebounds: 12,
        assists: 12,
        steals: 4,
        blocks: 5,
        slam_dunks: 5
        },
        {player_name: "Ben Gordon",
        number: 8,
        shoe: 15,
        points: 33,
        rebounds: 3,
        assists: 2,
        steals: 1,
        blocks: 1,
        slam_dunks: 0
        },
        {player_name: "Kemba Walker",
        number: 33,
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
    if player_hash[:player_name] == name
      return player_hash[:points]
    
end
end
end
end

def shoe_size(name)
  game_hash.each do |location, team_data|
  team_data[:players].each do |player_hash|
    if player_hash[:player_name] == name
      return player_hash[:shoe]
    
end
end
end
end

def team_colors(team)
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      return team_data[:colors]
 end
end
end

def team_names
  game_hash.map do |location, team_data|
    team_data[:team_name]
  end
end

def player_numbers(team)
  numbers = []
  game_hash.each do |location, team_data|
  
    if team_data[:team_name] == team
    team_data[:players].each do |player_hash|
      
      numbers.push(player_hash[:number])
    
    end
  end
end
numbers
end

def player_stats(player)
 stats={}
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      if player_hash[:player_name] == player 
        stats = player_hash.delete_if {|key, value| key == :player_name}
      end
    end
  end
  stats
end

def big_shoe_rebounds
  shoe_size = []
  big_shoe = nil

game_hash.each do |location, team_data|
  team_data[:players].each do |player_hash|
    shoe_size.push(player_hash[:shoe])
    big_shoe = shoe_size.max
  end
end


game_hash.each do |location, team_data|
  team_data[:players].each do |player_hash|
    if player_hash[:shoe] == big_shoe
      return player_hash[:rebounds]
    end
  end
end
end

def most_points_scored
  points_scored = []
  most_points = nil
  
  game_hash.each do |location, team_data|
  team_data[:players].each do |player_hash|
    points_scored.push(player_hash[:points])
    most_points = points_scored.max
end
end

game_hash.each do |location, team_data|
  team_data[:players].each do |player_hash|
    if player_hash[:points] == most_points
      return player_hash[:player_name]
    end
  end
end
end

def winning_team
  home_points = 0
  away_points = 0
  
    game_hash[:home][:players].each do |player_hash|
       home_points += player_hash[:points]
     end

  game_hash[:away][:players].each do |player_hash|
      away_points += player_hash[:points]
  end
  
  
if home_points > away_points
  return game_hash[:home][:team_name]
else return game_hash[:away][:team_name]
  
end
end

def player_with_longest_name
  player_names = []
  longest_name = nil
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_names.push(player_hash[:player_name])
      
    end
  end
  longest_name = player_names.sort_by{|name| name.length}.reverse[0]
end        

def long_name_steals_a_ton?
  player_with_most_steals = nil
  steals = 0
  
  
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|

      if player_hash[:steals] > steals

        steals = player_hash[:steals]
        player_with_most_steals = player_hash[:player_name]
end
end
end


 player_with_longest_name == player_with_most_steals
end


