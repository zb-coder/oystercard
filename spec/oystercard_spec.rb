require 'oystercard'

describe Oystercard do
  it 'should have a new balance' do
    expect(subject.balance).to eq(DEFAULT_BALANCE)
  end

  describe '#top_up' do
    #expect(card.top_up) to increase()
    it { is_expected.to respond_to(:top_up).with(1).argument }
  
    it 'is expected to increase balance' do
      opening_balance = subject.balance
      subject.top_up(20)
      expect(subject.balance).to eq(opening_balance + 20)
    end

    it 'is expected to not exceed £90' do
      message = "You've exceeded the Maximum amount of #{MAXIMUM_BALANCE}"
      expect { subject.top_up(91) }.to raise_error message
    end
  end

  describe '#deduct' do
    it 'is expected to deduct amount from the balance' do
      subject.top_up(50)
      expect { subject.deduct(20) }.to change{ subject.balance }.by(-20)
    #if deduct(amount) from card then balance reduced by that amount
    end
  end
    
  describe '#touch_in' do
    
    #touch_in
    # it should return
    # return error message when false
    it 'is expected to have a minimum balance of £1' do
      message = "You do not have enough funds, you need atleast #{MINIMUM_BALANCE}"
      expect { subject.touch_in }.to raise_error message
    end

    #touch_in
    # return true when scan card
    #return true
    it 'is expected to return true when touched_in' do
      subject.top_up(10)
      expect(subject.touch_in).to eq(true)
    end
  end

  describe '#touch_out' do
    it 'is expected to return false when you touch out' do
      expect(subject.touch_out).to eq(false)
    end
  end

  describe '#in_journey?' do
    it 'is expected to return false by default' do
      expect(subject.in_journey?).to eq(false)
    end

    it 'is expected to return true when status is true' do
      subject.top_up(10)
      subject.touch_in
      expect(subject.in_journey?).to eq(true)
    end

  end

    #Method
    #What it should do?
    #What is should return?

    #in_journey?
    # returns true or false
    #return true 

    #touch_out
    # it changes value to false
    # return false

    #touch_in
    # it should return
    # return error message when false

    #touch_in
    # don't raise an error
    # set the status to true

    #Minimum_amount
    # it should return
    # balance >= 1
end