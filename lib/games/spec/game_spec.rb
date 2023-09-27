require_relative '../game'

describe Game do
  subject { Game.new(true, '2021-01-01', '2011-01-01') }

  describe '#initialize' do
    it 'has a multiplayer attribute' do
      expect(subject.multiplayer).to be(true)
    end

    it 'has a last_played_at attribute that is a date object' do
      expect(subject.last_played_at).to be_a(Date)
      expect(subject.last_played_at).to eq(Date.parse('2021-01-01'))
    end
  end


  describe '#can_be_archived?' do
    it 'returns true if the parent method returns true and the last_played_at is older than two years' do
      expect(subject.can_be_archived?).to be(true)
    end

    it 'returns false if the parent method returns false or the last_played_at is less than two years old' do
      subject2 = Game.new(true, '2021-01-01', '2021-01-01')
      expect(subject2.can_be_archived?).to be(false)
    end
  end
end
