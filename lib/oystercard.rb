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
    message = "You've exceeded the Maximum amount of #{MAXIMUM_BALANCE}"
    (maximum_balance(amount)) ? (@balance = @balance + amount) : (raise message)
  end

  def deduct(deduction)
    @balance = @balance - deduction
  end

  def in_journey?
    @status
  end

  def touch_in
    message = "You do not have enough funds, you need atleast #{MINIMUM_BALANCE}"
    (minimum_balance) ? (@status = true) : (raise message)
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