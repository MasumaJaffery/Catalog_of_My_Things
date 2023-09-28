require_relative '../game'
require 'json'

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

  describe '#.json_create' do
    let(:valid_json) do
      <<-END
    {
      "title": "Super Mario",
      "last_played_at": "2021-10-10",
      "publish_date": "1985-09-13",
      "multiplayer": true,
      "author": {
        "first_name": "Shigeru",
        "last_name": "Miyamoto",
        "items": []
      }
    }
    END
    end
    context 'with valid Json input' do 
      it 'return a Game object with correct attributes' do
        hash = JSON.parse(valid_json)
        game = Game.json_create(hash)
        expect(game).to be_an_instance_of(Game)
        expect(game.title).to eq('Super Mario')
        expect(game.last_played_at).to eq(Date.parse('2021-10-10'))
        expect(game.publish_date).to eq(Date.parse('1985-09-13'))
        expect(game.multiplayer).to be_truthy
        expect(game.author).to be_an_instance_of(Author)
        expect(game.author.first_name).to eq('Shigeru')
        expect(game.author.last_name).to eq('Miyamoto')
        expect(game.author.items).to be_empty
      end
    end
  end
end
