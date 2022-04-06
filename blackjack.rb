# class Human
#     attr_accessor :player_name, :player_bankroll, :player_hand
#     def initialize(:name, :bankroll, :hand)
#         @player_name = name
#         @player_bankroll = 100
#         @player_hand = []
#     end

# end

# class 

#     The_house
#     attr_accessor :name, :bankroll, :hand
#     def initialize(:name, :bankroll, :hand)
#         @house_name = name
#         @house_bankroll = 1000
#         @house_hand = []
#     end
# end

# class Card
#     attr_reader :value
#     def initialize(value:)
#         @value = value
#         ranks = ["a", "2", "3", "4", "5"]
#         @deck = []
#         ranks.each do |rank|
#         card = card.new rank
#         @deck << card
#     end
# end


class Player
    attr_accessor :name, :bankroll
    def initialize name, bankroll
        @name = name
        @bankroll = bankroll

    end
end

class Card
    attr_reader :value, :face, :suit
    def initialize value, face, suit
        @value = value
        @face = face
        @suit = suit
    end
end



$player1 = Player.new("", 100)

$player2 = Player.new("computer", 10000)
$deck = []
$suits = ["heart", "spade", "diamonds", "clubs"]
$face = [ 2, 3, 4, 5, 6, 7, 8, 9, 10, "J", "Q", "K", "A"]

$suits.each do |s|
    $face.each do |i|
        if i == "J" ||  i == "Q" || i == "K"
            $deck << Card.new(value = 10, face = i, suit = s)
        elsif i == "A"
            $deck << Card.new(value = 11, face = i, suit = s)
        else
            $deck << Card.new(value = i, face = i, suit = s)
        end
    end
end

    def game
    $deck.shuffle!


    $p_hand = "#{$deck[0].value} and #{$deck[1].value}"
    $c_hand = "#{$deck[8].value} and #{$deck[9].value}"
    $p_total = $deck[0].value + $deck[1].value
    $c_total = $deck[8].value + $deck[9].value

    # p $c_hand

    p "Your hand is #{$p_hand}, which is = to #{$p_total}"
    p "My hand is #{$c_hand}, which is = to #{$c_total}"

    
if $player1.bankroll == 0
    p "You don't have enough money to play."
elsif $p_total == $c_total
    p "Its a tie"
elsif $p_total > 21 && $c_total < 21
    $player1.bankroll -= 10
    $player2.bankroll += 10
    p "#{$player2.name} wins! #{$player1.name} now has #{$player1.bankroll}"
elsif $c_total > 21 && $p_total < 21
    $player1.bankroll += 10
    $player2.bankroll -= 10
    p "#{$player1.name} wins! #{$player1.name} now has #{$player1.bankroll}"


elsif $p_total > $c_total
    $player1.bankroll += 10
    $player2.bankroll -= 10
    p "#{$player1.name} wins! and now has #{$player1.bankroll}"
elsif $c_total > $p_total
    $player1.bankroll -= 10
    $player2.bankroll += 10
    p "#{$player2.name} wins! #{$player1.name} now has #{$player1.bankroll}"
    end

    p "Would you like to deal or quit? press (d) for deal or (q) for quit "
    answer = gets.chomp
    if answer == "d"
        game
    else
        p "Bye"
    end


end

p "What is your name?"

$player1.name = gets.chomp
p "hello #{$player1.name}"
p "Lets play BlackJack!"
game
