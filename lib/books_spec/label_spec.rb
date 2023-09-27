require_relative '../label'
require 'date'

describe Label do
  let(:label) { Label.new('Rainbow', 'blue', [], '2023-09-27') }
  
  describe '#add_item' do
    it 'appends an item to the items array and sets the label' do
      item = double('item')

      # Expect the label= method to be called with label as an argument
      expect(item).to receive(:label=).with(label)

      label.add_item(item)

      # Check that the item was added to the items array
      expect(label.items).to include(item)
    end
  end
end
