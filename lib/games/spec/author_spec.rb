# require the author class
require_relative '../author'
require_relative '../../item'

# use RSpec to describe the behavior of the author class
describe Author do
  # create a author instance of the author class with some attributes
  let(:the_author) { Author.new('John', 'Doe') }

  # test the initialization of the author instance
  describe '#initialize' do

    # check if the author has a first_name attribute
    it 'has a first_name' do
      expect(the_author.first_name).to eq('John')
    end

    # check if the author has a last_name attribute
    it 'has a last_name' do
      expect(the_author.last_name).to eq('Doe')
    end

    # check if the author has an items attribute that is an empty array
    it 'has an items attribute that is an empty array' do
      expect(the_author.items).to be_an(Array)
      expect(the_author.items).to be_empty
    end
  end

  # test the add_item method of the author instance
  describe '#add_item' do
 
    let(:item) { Item.new(nil, nil, nil, '12-12-12') }
  
    it 'adds the item to the items array' do
      allow(item).to receive(:author).and_return(the_author)
      the_author.add_item(item)
      expect(the_author.items).to include(item)
    end
  
    it 'sets the author of the item to self' do
      # call the add_item method here as well
      the_author.add_item(item)
      expect(item.author).to eq(the_author)
    end
  end
  
end
