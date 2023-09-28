# label_spec.rb

require_relative '../label'

describe Label do
  let(:label) { Label.new('Rainbow', 'blue', [], '2023-09-27') }

  describe '#initialize' do
    it 'initializes' do
      title = 'Rainbow'
      color = 'blue'
      publish_date = '2023-09-27'

      # Create a new Label object with the specified attributes
      label = Label.new(title, color, [], publish_date)

      # Check that the instance variables are correctly initialized
      expect(label.title).to eq(title)
    end
  end

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
