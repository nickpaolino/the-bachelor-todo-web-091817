require 'pry'
require 'json'

def get_first_name_of_season_winner(data, season)
  season_winner = ''
  data["#{season}"].each do |contestant|
    if contestant["status"] == "Winner"
      season_winner = contestant["name"].split(" ")[0]
    else
    end
  end
  season_winner
end

def get_contestant_name(data, occupation)
  contestant_name = ""
  for season in data.keys
    data[season].each do |contestant|
      if contestant["occupation"] == occupation
        contestant_name = contestant["name"]
      else
      end
    end
  end
  contestant_name
end

def count_contestants_by_hometown(data, hometown)
  hometown_count = 0
  for season in data.keys
    data[season].each do |contestant|
      if contestant["hometown"] == hometown
        hometown_count += 1
      end
    end
  end
  hometown_count
end

def get_occupation(data, hometown)
  for season in data.keys
    data[season].each do |contestant|
      if contestant["hometown"] == hometown
        return contestant["occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  contestant_ages = []
  sum = 0
  data["#{season}"].each do |contestant|
    contestant_ages << contestant["age"]
  end
  contestant_ages.collect! {|x| x.to_f}
  contestant_ages.each do |age|
    sum += age
  end
  float_average = sum / contestant_ages.count
  average = float_average.round
  average
end
