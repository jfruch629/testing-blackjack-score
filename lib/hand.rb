require_relative 'deck'

class Hand
  attr_reader :cards

  def initialize(cards)
    @cards = cards
  end

  def calculate_hand
    sum = 0
    ace_array = []
    @cards.each do |card|
      if ['J', 'Q', 'K'].include?(card.value)
        sum += 10
      elsif ['A'].include?(card.value)
        ace_array << card
      else
        sum += card.value
      end
    end
    ace_array.each do |ace_card|
      if sum <= 10
        sum += 11
      else
        sum += 1
      end
    end
    sum
  end
end

deck = Deck.new
cards = deck.deal(2)
hand = Hand.new(cards)
hand.calculate_hand
