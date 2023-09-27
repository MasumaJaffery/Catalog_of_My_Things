require_relative '../item'
require_relative '../book'  s

describe Book do
  let(:book) { Book.new('Imam Ali a.s', 'good', '2001-01-01') }  # Pass the required arguments

  describe '#can_be_archived?' do
    context 'when cover_state is true' do
      it 'returns true' do
        book.cover_state == 'bad'
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when cover_state is not true' do
      it 'returns false' do
        book.cover_state == 'good' 
        expect(!book.can_be_archived?).to be(false)
      end
    end
  end
end
