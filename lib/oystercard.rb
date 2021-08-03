DEFAULT_BALANCE = 0
MAXIMUM_BALANCE = 90

class Oystercard 
  attr_reader :balance

  def initialize(balance = DEFAULT_BALANCE)
    @balance = balance
  end

  def top_up(amount)
    message = "You've exceeded the Maximum amount of #{MAXIMUM_BALANCE}"
    (maximum_balance(amount)) ? (@balance = @balance + amount) : (raise message)
  end

  private

  def maximum_balance(amount)
    @balance + amount <= MAXIMUM_BALANCE
  end

end