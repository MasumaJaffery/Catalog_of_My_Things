require_relative '../source'

describe Source do
  context 'When testing the source class' do
    it 'should add an item to the source' do
      source = Source.new('Baqir', 1)
      item = Item.new('label', 'author', 'genre', '2000-1-1')
      source.add_item(item)
      expect(source.items).to include(item)
      expect(item.source).to eq(source)
    end
  end
end
