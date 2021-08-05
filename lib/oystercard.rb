DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1
MINIMUM_FARE = 5

class Oystercard 
  attr_reader :balance, :entry_station, :list_of_journeys, :exit_station

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
    @list_of_journeys = []
  end

  def top_up(amount)
    raise "You've exceeded the Maximum amount of #{MAXIMUM_BALANCE}" unless maximum_balance(amount)

    @balance += amount
  end

  def in_journey?
    ! @entry_station.nil?
  end

  def touch_in(entry_station)
    raise "You do not have enough funds, you need atleast #{MINIMUM_BALANCE}" unless minimum_balance

    @entry_station = entry_station
  end
  
  def touch_out(exit_station)
    deduct MINIMUM_FARE
    @exit_station = exit_station
    @entry_station = nil
  end
  
  private

  def deduct(amount)
    @balance -= amount
  end

  def maximum_balance(amount)
    @balance + amount <= MAXIMUM_BALANCE
  end

  def minimum_balance
    @balance >= MINIMUM_BALANCE
  end

end


card = Oystercard.new
puts card
puts card.balance
#puts card.status
# puts card.touch_in
# puts card.status
# puts card.touch_out
# puts card.status
# puts card.in_journey?