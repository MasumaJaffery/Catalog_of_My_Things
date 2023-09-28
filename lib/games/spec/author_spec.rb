require_relative '../author'
require_relative '../../item'
require 'json'

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

  describe '#json_create' do 
    let(:valid_json) do
      <<-END
      {
        "first_name": "George",
        "last_name": "Orwell",
        "items": [
          {
            "title": "Fifa 12",
            "publish_date": "1949-06-08"
          },
          {
            "title": "Animal Farm",
            "publish_date": "1945-08-17"
          }
        ]
      }
      END
  end

  context 'with valid data' do
    it 'return an author object with correct attribute' do
      hash = JSON.parse(valid_json)
      author = Author.json_create(hash)
      expect(author).to be_an_instance_of(Author)
      expect(author.first_name).to eq('George')
      expect(author.last_name).to eq('Orwell')
      # Expect the author object to have an items attribute that is an array of hashes
      expect(author.items).to be_an(Array)
      expect(author.items).to all(be_a(Hash))
      expect(author.items[0]['title']).to eq('Fifa 12')
    end
  end
end
end
