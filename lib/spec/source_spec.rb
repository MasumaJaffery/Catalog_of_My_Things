require_relative '../source'
describe Source do
  context 'When testing the source class' do
    it 'should return the expected values' do
      source = Source.new('Baqir', 1)
      expect(source.id).to eq 1
      expect(source.name).to eq 'Baqir'
    end
  end

  context 'When testing the add_item method' do
    it 'should add an item to the source' do
      source = Source.new('Source Name')
      item = Item.new('label', 'author', 'genre', '2000-1-1')
      source.add_item(item)
      expect(source.items).to include(item)
      expect(item.source).to eq(source)
    end
  end
end
