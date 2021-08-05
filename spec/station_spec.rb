require 'station'

describe Station do

#whitechapel = Station.new('Whitechapel')
let(:station) { described_class.new("Whitechapel", 1)}

  describe '#initialize' do
    it 'should return the name of the station' do
      expect(station.name).to eq('Whitechapel')
    end

    it'should return the zone of the station' do
      expect(station.zone).to eq(1)
    end
  end
end