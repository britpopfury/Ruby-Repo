require 'pry'
# CREATE TALLY METHOD TO KEEP TRACK TO TOTALS
# the hand would currently look like this:
# [["3", "Diamonds"], ["5", "Clubs"], ["3", "Hearts"], ["J", "Spades"], ["2", "Hearts"]]

def tally(hand)
  arr = hand.map{|e| e[0]}  #gets the second element of the nexted array (cos arrays are zero indexed)
  running_total = 0  #initialise this at the beginning
 # need to iterate through each value to get the total from our new hand_total array
  
  arr.each do |value|
   if value == 'A'
      running_total += 11
   elsif value == 'J' || value == 'Q' || value == 'K' #could also say value.to_i ==0 because it would fail and return a 0
     running_total += 10
   else
      running_total += value.to_i
   end
 end

 # correct for Aces
 arr.select{|e| e == "A"}.count.times do
    running_total += 10 if running_total > 21
  end
 
 running_total
end

# CREATE DECK 
# first create the ranks of cards
ranks = %w{A 2 3 4 5 6 7 8 9 10 J Q K}
# now create the suits
suits = %w{Spades Hearts Diamonds Clubs}
# now we want to combine these into a new array with all the possible combinations
deck = []
ranks.each do |suit|
	suits.each do |rank|
		deck << [suit, rank]
	end
end
# btw - another really neat way of doing this is by using deck = ranks.product(suits)

# ORDER CARDS RANDOMLY
# use the handy shuffle method :)
deck.shuffle!
# print deck
#

# WELCOME THE PLAYER & KICK THINGS OFF
puts "Welcome to my fantabulous Black Jack game!"
puts "Please enter your name: "
name = gets.chomp.capitalize
print "Hi " +name, ", your dealers name is Bubba! Let\'s play us some Black Jack!"
puts "" #empty line for readability
#
# DEAL 2 CARDS EACH TO THE PLAYER AND DEALER
players_hand = []
dealers_hand = []

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop
players_hand << ["A", "C"]

player_total = tally(players_hand)
dealer_total = tally(dealers_hand)

puts "So, I just dealt your initial hand and here it is:"
puts "Player\'s hand is:  #{players_hand[0]} and #{players_hand[1]}, for a total of #{player_total}"
puts "Dealer\'s hand is:  #{dealers_hand[0]} and #{dealers_hand[1]}, for a total of #{dealer_total}"
puts "" #empty line for readability
# ASK PLAYER WHAT THEY WANT TO DO NEXT
print "So, " +name, ", at this point you can twist or stick. What would you like to do?"
puts ""
puts "Enter T for Twist or S for Stick"
puts "" #empty line for readability
response = gets.chomp.upcase
# make sure they don't enter something stupid
while response != 'T' && response != 'S'
	puts "Plese enter T for Twist or S for Stick"
	response = gets.chomp.upcase
end

if response == 'S'
  puts "Your hand is currently  #{players_hand[0]} and #{players_hand[1]}, for a total of #{player_total}"
  puts "Let\'s see what the deal has"
  puts "Dealer\'s hand is:  #{dealers_hand[0]} and #{dealers_hand[1]}, for a total of #{dealer_total}"
end



