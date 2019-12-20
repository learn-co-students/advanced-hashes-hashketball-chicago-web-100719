require "pry"

def game_hash
  {
    home: {
      team_name:"Brooklyn Nets",
      colors: ["Black", "White"],
      players: [
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
          :shoe =>19,
          :points => 26,
          :rebounds => 11,
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
        }]
    }, 
    away: {
      team_name: "Charlotte Hornets",
      colors: ["Turquoise", "Purple"],
      players: [
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
        "Bismack Biyombo" => {
          :number => 0, 
          :shoe => 16,
          :points => 12,
          :rebounds => 4, 
          :assists => 7, 
          :steals => 22,
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
        "Kemba Walker" => {
          :number => 33, 
          :shoe => 15, 
          :points => 6, 
          :rebounds => 12, 
          :assists => 12, 
          :steals => 7, 
          :blocks => 5,   
          :slam_dunks => 12
        }]
    }
  }
end


def good_practices
  game_hash.each do |location, team_data|
    #are you ABSOLUTELY SURE what 'location' and 'team data' are? use binding.pry to find out!
   
    team_data.each do |attribute, data|
      #are you ABSOLUTELY SURE what 'attribute' and 'team data' are? use binding.pry to find out!
      
 
      #what is 'data' at each loop throughout .each block? when will the following line of code work and when will it break?
      data.each do |data_item|
          binding.pry
      end
    end
  end
end



def num_points_scored(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
       if player_name == player
         return stats[:points]
       end
      end
    end
  end
end


def shoe_size(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
       if player_name == player
         return stats[:shoe]
       end
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
  number_array = []
  game_hash.each do |location, team_data|
    if team_data[:team_name] == team
      team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
       number_array.push(stats[:number])
      end
      end
    end
  end
  number_array
end

def player_stats(player)
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if player_name == player 
          return stats
        end
      end
    end
  end
end
  
def big_shoe_rebounds
  biggest_shoe = nil
  biggest_shoe_size = 0
    game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
          if stats[:shoe] > biggest_shoe_size
          
           biggest_shoe = player_name
           biggest_shoe_size = stats[:shoe]
          
          end
      end
    end
    game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
       if player_name == biggest_shoe
         return stats[:rebounds]
       end
      end
    end
  end
end
end


def most_points_scored
  high_score_player = nil
  high_score = 0
    game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
          if stats[:points] > high_score
          
           high_score_player = player_name
           high_score = stats[:points]
          
          end
      end
    end
  end
  return high_score_player
end


def winning_team
  home_score = 0
  away_score = 0
  game_hash[:home][:players].each do |player_hash|
    player_hash.each do |player_name, stats|
      home_score = home_score + stats[:points]
    end
  end
    game_hash[:away][:players].each do |player_hash|
    player_hash.each do |player_name, stats|
      away_score = away_score + stats[:points]
    end
  end
  if home_score > away_score
    return game_hash[:home][:team_name]
  else
    return game_hash[:away][:team_name]
  end
end

def player_with_longest_name
  long_name = nil
  game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if "#{player_name}".length > "#{long_name}".length
          long_name = player_name
        end
        end
      end
    end
    long_name
  end
    
  
  def long_name_steals_a_ton?
    player_with_longest_name
    most_steals = 0
    player_most_steals = nil
    game_hash.each do |location, team_data|
    team_data[:players].each do |player_hash|
      player_hash.each do |player_name, stats|
        if stats[:steals] > most_steals
          most_steals = stats[:steals]
          player_most_steals = player_name
        end
        end
      end
    end
    if player_most_steals == player_with_longest_name
      return true 
    end
  end
    

