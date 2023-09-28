require_relative '../source'
describe Source do
  context 'When testing the source class' do
    it 'should return the expected values' do
      source = Source.new(1, 'Baqir')
      expect(movie.id).to eq 1
      expect(movie.name).to eq 'Baqir'
    end
  end
end