require_relative '../author'
require_relative '../../item'

describe Author do
  let(:the_author) { Author.new('John', 'Doe') }
  describe '#initialize' do
    it 'has a first_name' do
      expect(the_author.first_name).to eq('John')
    end
    it 'has a last_name' do
      expect(the_author.last_name).to eq('Doe')
    end
    it 'has an items attribute that is an empty array' do
      expect(the_author.items).to be_an(Array)
      expect(the_author.items).to be_empty
    end
  end
  describe '#add_item' do
    let(:item) { Item.new(nil, nil, nil, '12-12-12') }
    it 'adds the item to the items array' do
      allow(item).to receive(:author).and_return(the_author)
      the_author.add_item(item)
      expect(the_author.items).to include(item)
    end
  
    it 'sets the author of the item to self' do
      the_author.add_item(item)
      expect(item.author).to eq(the_author)
    end
  end
  
end
