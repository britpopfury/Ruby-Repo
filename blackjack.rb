=begin
ROUGH PSEUDO CODE THINGY:
Get player name
Get dealer name
	player goes first
 		if value of card 1 + card 2 =21
 			player wins "Hey, player_name, "You win!"
       end
   	elsif value card 1 + card 2 > 21
 			player loses "Sorry", player_name, "you lost!"
			end
   	elsif value of card 1 + card 2 < 21
 			ask player if they wish to stick or twist
 				if twist then deal next card and repeat above until player wants to stick or busts
 					if stick then save player card value
         else move onto dealer
    dealer goes next
 		if value of card 1 + card 2 =21
 			dealer wins "Dealer wins!"
   	elsif value card 1 + card 2 > 21
 			dealer loses "Dealer loses!"
   	elsif value of card 1 + card 2 <17
       deal next card
     		if value of card 1 + card 2 >=17
 					ask dealer if they wish to stick or twist
 						if twist then deal next card and repeat dealer loop above until dealer wants to stick or busts
 						if stick then save dealer card value
         	compare player v dealer result
           highest score wins
           ask if they want to play again
=end

require 'pry'
# OK - let's deal with the cards first (no pun intended!)
#
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
#
# ORDER CARDS RANDOMLY
# use the handy shuffle method :)
deck.shuffle!
print deck
#
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

puts "Player\'s hand is:  #{players_hand[0]} and #{players_hand[1]}"
puts "Dealer\'s hand is:  #{dealers_hand[0]} and #{dealers_hand[1]}"
puts "" #empty line for readability
# ASK PLAYER WHAT THEY WANT TO DO NEXT
print "So, " +name, ", at this point you can twist or stick. What would you like to do?"
puts ""
puts "Enter T for Twist or S for Stick"
puts "" #empty line for readability
response = gets.chomp.upcase

while response != 'T' || 'S'
	puts "Plese enter T for Twist or S for Stick"
	response = gets.chomp.upcase
end





# create tally method that keeps track of each players score

