# require the game class
require_relative '../game'

# use RSpec to describe the behavior of the game class
describe Game do
  # create a subject instance of the game class with some attributes
  subject { Game.new(true, '2021-01-01') }

  # test the initialization of the game instance
  describe '#initialize' do
    # check if the subject has a multiplayer attribute
    it 'has a multiplayer attribute' do
      expect(subject.multiplayer).to be(true)
    end

    # check if the subject has a last_played_at attribute that is a date object
    it 'has a last_played_at attribute that is a date object' do
      expect(subject.last_played_at).to be_a(Date)
      expect(subject.last_played_at).to eq(Date.parse('2021-01-01'))
    end
  end

  # test the can_be_archived? method of the game instance
  describe '#can_be_archived?' do
    # check if the subject can be archived if the parent method returns true and the last_played_at is older than two years
    it 'returns true if the parent method returns true and the last_played_at is older than two years' do
      # stub the parent method to return true
      allow(subject).to receive(:super).and_return(true)
      # set the last_played_at to more than two years ago
      subject.last_played_at = Date.parse('2019-12-31')
      expect(subject.can_be_archived?).to be(true)
    end

    # check if the subject cannot be archived if the parent method returns false or the last_played_at is less than two years old
    it 'returns false if the parent method returns false or the last_played_at is less than two years old' do
      # stub the parent method to return false
      allow(subject).to receive(:super).and_return(false)
      
      # set the last_played_at to less than two years ago
      subject.last_played_at = Date.parse('2021-02-01')
      expect(subject.can_be_archived?).to be(false)
    end
  end
end
