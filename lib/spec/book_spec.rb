require_relative '../item'
require_relative '../book'

describe Book do
  let(:book) { Book.new('Imam Ali a.s', 'good', '2001-01-01') }

  describe '#initialize' do
    it 'initializes' do
      publisher = 'Imam Ali a.s'
      cover_state = 'good'
      publish_date = '2001-01-01'

      # Create a new Book object with the specified attributes
      book = Book.new(publisher, cover_state, publish_date)

      # Check that the instance variables are correctly initialized
      expect(book.cover_state).to eq(cover_state)
    end
  end

  describe '#can_be_archived?' do
    context 'when cover_state is "bad"' do
      it 'returns true' do
        book = Book.new('Imam Ali a.s', 'bad', '2001-01-01')
        expect(book.can_be_archived?).to be(true)
      end
    end

    context 'when cover_state is "good"' do
      it 'returns false' do
        book = Book.new('Imam Ali a.s', 'good', '2001-01-01')
        expect(book.can_be_archived?).to be(false)
      end
    end
  end
end
