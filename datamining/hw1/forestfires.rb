# Christopher McClaskey
# CSCI 4502 
# Homework 1
# Question 3 parts (a) and (b)

require 'csv'

wind = Array.new
headers = true
CSV.foreach("forestfires.csv") do |row|
	#skip the column name row
	if headers
		headers = false
		next
	end
	#add the wind value to my array
	wind.push(row[10].to_f)
end

#Calculating Mean
mean = wind.inject { |sum, i| sum + i } / wind.size

#Calculating Standard Devation
std_dev =  Math.sqrt( wind.inject { |sum, i| sum + (i-mean)**2 } / wind.size )

#Calculating median and quartiles
wind = wind.sort
median_id = wind.size/2
lower = wind[0..median_id-1]
upper = wind[median_id+1..wind.size-1]
q1 = lower[lower.size/2]
median = wind[median_id]
q3 = upper[upper.size/2]
iqr = q3-q1

puts "Min:        #{wind.min}" 
puts "Max:        #{wind.max}"
puts "Mean:       #{mean}"
puts "Std Dev:    #{std_dev}"
puts "Q1:         #{q1}"
puts "Median:     #{median}"
puts "Q3:         #{q3}"
puts "IQR:        #{iqr}"

# -OUTPUT-
# Min:        0.4
# Max:        9.4
# Mean:       4.017601547388782
# Std Dev:    1.789651406176351
# Q1:         2.7
# Median:     4.0
# Q3:         4.9
# IQR:        2.2


