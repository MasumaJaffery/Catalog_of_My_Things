require_relative '../item'
require_relative '../book'

describe Book do
  let(:book) { Book.new('Imam Ali a.s', 'Nahjul-e-Balgah', '2001-01-01', false) }

  describe '#can_be_archived?' do
    context 'when cover_state is "bad"' do
      it 'returns true' do
        book.cover_state = 'bad'
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when test cover state"' do
      it 'should returns expected info' do
        expect(book.cover_state).to eq ('Nahjul-e-Balgah')
      end
    end
  end
end
