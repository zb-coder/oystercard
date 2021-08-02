require 'oystercard'

describe Oystercard do
  card = Oystercard.new
  it 'should have a new balance' do
  expect(card.balance).to eq(0)
  end

  describe '#top_up' do
    #expect(card.top_up) to increase()
    it { is_expected.to respond_to(:top_up).with(1).argument }

    it 'is expected to increase balance' do
      expect(card.balance).to increase(:top_up)
    end
  end
end