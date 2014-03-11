require 'pry'
# CREATE TALLY METHOD TO KEEP TRACK TO TOTALS
# a hand would currently look like this:
# [["3", "Diamonds"], ["5", "Clubs"], ["3", "Hearts"], ["J", "Spades"], ["2", "Hearts"]]

def tally(hand)
  arr = hand.map{|e| e[0]}  #gets the second element of the nested array (cos arrays are zero indexed)
  running_total = 0  #initialise this at the beginning & then iterate through each value to get the total from our new hand_total array
  
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
    running_total -= 10 if running_total > 21
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

# ORDER CARDS RANDOMLY by using the handy shuffle method :)
deck.shuffle!

# WELCOME THE PLAYER & KICK THINGS OFF

puts "Welcome to my fantabulous Black Jack game!"
puts "Please enter your name: "
name = gets.chomp.capitalize
puts ""
print "Hi " +name, ", your dealers name is Bubba! Let\'s play us some Black Jack!"
puts "" #empty line for readability

# DEAL 2 CARDS EACH TO THE PLAYER AND DEALER

players_hand = []
dealers_hand = []

players_hand << deck.pop
dealers_hand << deck.pop
players_hand << deck.pop
dealers_hand << deck.pop

player_total = tally(players_hand)
dealer_total = tally(dealers_hand)

puts "So, I just dealt your initial hand and here it is:"
puts "Player\'s hand is:  #{players_hand[0]} and #{players_hand[1]}, for a total of #{player_total}"
# puts "Dealer\'s hand is:  #{dealers_hand[0]} and #{dealers_hand[1]}, for a total of #{dealer_total}"
puts "" #empty line for readability

# ASK PLAYER WHAT THEY WANT TO DO NEXT
# first check to see if the initial hand was, infact 21
if player_total == 21
  puts "Woot! you hit blackjack. You won!"
  exit #ends the whole program
end

while player_total < 21
  print "So, " +name, ", at this point you can twist or stick. What would you like to do?"
  puts ""
  puts "Enter T for Twist or S for Stick"
  puts "" #empty line for readability
  response = gets.chomp.upcase

  if !['T', 'S'].include?(response)
    puts "Ops! Plese enter T for Twist or S for Stick"
    next # this breaks out of this if and takes them back to the beginning of the while loop becuase they did it wrong - nifty, ,eh?!
  end

  if response == 'S'
    puts "Your hand is currently  #{players_hand[0]} and #{players_hand[1]}, for a total of #{player_total}"
    puts "Let\'s see what the dealer has"
    puts "Dealer\'s hand is:  #{dealers_hand[0]} and #{dealers_hand[1]}, for a total of #{dealer_total}"
    break # gets out of the while loop completely
end

  # twist
  new_card = deck.pop
  puts "You\'re new card is #{new_card}"
  players_hand << new_card
  player_total = tally(players_hand)
  puts "Your hand currently totals #{player_total}"

  # now we need to do the are you busted check for the loop we're in
  if player_total == 21
    puts "Woot! you hit blackjack. You won!"
    exit #ends the whole program
  elsif player_total > 21
    puts "Oh No! Looks like you busted!"
    exit
  end
end

# NOW IT'S THE DEALER'S TURN!
# first check to see if the initial hand was, infact 21
if dealer_total == 21
  puts "Woot! Dealer hit blackjack. You lose!"
  exit #ends the whole program
end

while dealer_total < 17
  new_card = deck.pop
  puts "Rules say that a dealer cannot stick with < 17, so..."
  puts "The Dealer\'s' new card is #{new_card}"
  dealers_hand << new_card
  dealer_total = tally(dealers_hand)
  puts "Dealer\'s hand currently totals #{dealer_total}"

# now we need to do the are you busted check for the loop we're in
  if dealer_total == 21
    puts "Woot! Dealer hit blackjack. You lose!"
    exit #ends the whole program
  elsif dealer_total > 21
    puts "Congrats! Dealer busted. You win!"
    exit
  end
end

# COMPARE HANDS

puts "The Dealer\'s Cards are: "
dealers_hand.each do |card|
  puts "=> #{card}"
end
puts ""

puts "Your Cards are: "
players_hand.each do |card|
  puts "=> #{card}"
end
puts ""

if dealer_total > player_total
  puts "Sorry, the Dealer won"
elsif dealer_total < player_total
  puts "Woot! Looks like you won!"
else
  puts "It's a tie!"
end

exit
  





