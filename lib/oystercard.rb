DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90
MINIMUM_BALANCE = 1

class Oystercard 
  attr_reader :balance, :status

  def initialize(balance = DEFAULT_BALANCE, status = false)
    @balance = balance
    @status = status
  end

  def top_up(amount)
    raise "You've exceeded the Maximum amount of #{MAXIMUM_BALANCE}" unless maximum_balance(amount)

    @balance += amount
  end

  def deduct(amount)
    @balance -= amount
  end

  def in_journey?
    @status
  end

  def touch_in
    raise "You do not have enough funds, you need atleast #{MINIMUM_BALANCE}" unless minimum_balance

    @status = true
  end
  
  def touch_out
    @status = false
  end
  private

  def maximum_balance(amount)
    @balance + amount <= MAXIMUM_BALANCE
  end

  def minimum_balance
    @balance >= MINIMUM_BALANCE
  end

end

# card = Oystercard.new
# puts card.status
# puts card.touch_in
# puts card.status
# puts card.touch_out
# puts card.status
# puts card.in_journey?