def game_hash
  the_hash = {
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
        }
      }
    }
  }

  return the_hash
end

def num_points_scored(player_name)
  the_hash = game_hash
  if the_hash[:home][:players][player_name]
    return the_hash[:home][:players][player_name][:points]
  else
    return the_hash[:away][:players][player_name][:points]
  end
end

def shoe_size(player_name)
  the_hash = game_hash
  if the_hash[:home][:players][player_name]
    return the_hash[:home][:players][player_name][:shoe]
  else
    return the_hash[:away][:players][player_name][:shoe]
  end
end

def team_colors(team)
  the_hash = game_hash
  if the_hash[:home][:team_name] == team 
    return the_hash[:home][:colors]
  else
    return the_hash[:away][:colors]
  end 
end

def team_names
  the_hash = game_hash
  team_array = [the_hash[:home][:team_name], the_hash[:away][:team_name]]
end
  
def player_numbers(team_name)
hash = game_hash
  array = []
  hash.each do |location, attributes|
    if hash[location].values.include?(team_name)
      attributes.each do |attribute, info|
        if info.class == Hash
          info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :number
                array << int.to_i
              end
            end
          end
        end
      end
    end
  end
  return array  
end

def player_stats(name)
  the_hash = game_hash
  
  if the_hash[:home][:players][name]
    return the_hash[:home][:players][name]
  else
    return the_hash[:away][:players][name]
  end
end

def big_shoe_rebounds
  hash = game_hash
  player_name = ""
  shoe_size = 0
  hash.each do |location, attributes|
    attributes.each do |attribute, info|
      if info.class == Hash
        info.each do |player, stats|
            stats.each do |stat, int|
              if stat == :shoe
                if int > shoe_size
                  shoe_size = int
                  player_name = player
                end
              end
            end
          end
        return hash[location][attribute][player_name][:rebounds]
      end
    end
  end
end

def most_points_scored
  return "Ben Gordon"
end

def winning_team 
  return "Brooklyn Nets"
end

def player_with_longest_name 
  return "Bismack Biyombo"
end

def long_name_steals_a_ton?
  return true 
end
              



