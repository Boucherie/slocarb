require 'date'
# track your weight and manual body fat index measurements here - the calculator will always select the last measured values to track your progress. 

@today = Date.today
@start_date = Date.new(2018, 2, 20) #add start date here
@wrist_circ_inches = []
@forearm_circ_inches = []
@waist_in_inches = []
@hip_in_inches = []

weight_in_kilos = []
weight_in_lbs = weight_in_kilos.map {|kilo| kilo * 2.2}
weight_in_lbs.map { |weight| (weight * 0.732) + 8.987}

@initial_weight = weight_in_lbs.first.to_f
@recent_weight = weight_in_lbs.last.to_f


def get_initial_measurements
  @recent_wrist = @wrist_circ_inches.first.to_f
  @recent_forearm = @forearm_circ_inches.first.to_f
  @recent_waist = @waist_in_inches.first.to_f
  @recent_hip = @hip_in_inches.first.to_f
end

def get_recent_measurements
  @recent_wrist = @wrist_circ_inches.last.to_f
  @recent_forearm = @forearm_circ_inches.last.to_f
  @recent_waist = @waist_in_inches.last.to_f
  @recent_hip = @hip_in_inches.last.to_f
end

def weight_goal
  weight_loss = (@initial_weight.to_f - @recent_weight.to_f)
  puts  "Since #{@start_date}, you have lost #{ weight_loss.round(2)} lbs."
end

def recent_body_fat_percentage
  get_recent_measurements
  weight_adj = (@recent_weight * 0.732) + 8.987
  wrist_adj = @recent_wrist / 3.14
  waist_adj = @recent_waist * 0.157
  hip_adj = @recent_hip * 0.249
  forearm_adj = @recent_forearm * 0.434
  lean_mass = (((weight_adj + wrist_adj) - waist_adj) - hip_adj) + forearm_adj
  fat_mass = @recent_weight - lean_mass
  fat_percentage = (fat_mass / @recent_weight) * 100
  puts "Lean mass is #{lean_mass.round(2)} lbs"
  puts "Most recent body fat measurement for #{@start_date} was #{fat_percentage.round(2)}%."
end

recent_body_fat_percentage
weight_goal
