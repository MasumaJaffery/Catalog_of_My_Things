require_relative '../movie'

describe Movie do
  context 'When testing the movie class' do
    it 'should return the expected values' do
      movie = Movie.new('RCA', 'Elvis', 'Rock', '2012-05-23', true)
      expect(movie.label).to eq 'RCA'
      expect(movie.author).to eq 'Elvis'
      expect(movie.genre).to eq 'Rock'
      expect(movie.publish_date.to_s).to eq '2012-05-23'
    end
  end

  context 'when testing can_be_archived function' do
    it 'shour return ture' do
      movie = Movie.new('RCA', 'Elvis', 'Rock', '2012-05-23', true)
      expect(movie.can_be_archived?).to eq true
    end
  end
end
