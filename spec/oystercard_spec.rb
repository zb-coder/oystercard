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
end