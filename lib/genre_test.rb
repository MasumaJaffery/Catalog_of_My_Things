require 'minitest/autorun'
require_relative 'genre' # Adjust the path as needed
require_relative 'musicalbum' # Adjust the path as needed
require_relative 'item' # Adjust the path as needed

class TestGenreAndMusicAlbum < Minitest::Test
  def setup
    @genre = Genre.new('Rock')
    @item = Item.new('Label', 'Author', @genre, '2012-05-23')
    @music_album1 = MusicAlbum.new('RCA', 'Elvisr', 'Rock', '2012-05-23', true)
    @music_album2 = MusicAlbum.new('RCA', 'Elvis 4', 'Rock', '2000-05-24', false)
    @music_album3 = MusicAlbum.new('RCA', 'Elvis 5', 'Rock', '2000-05-23', false)
  end

  def test_add_item
    @genre.add_item(@item)
    assert_includes @genre.items, @item, 'Item not added to Genre'
    assert_equal @item.genre, @genre, 'Genre not set as a property of Item'
  end

  def test_can_be_archived_music_album
    assert @music_album1.can_be_archived?, 'MusicAlbum1 should be archived'
    refute @music_album2.can_be_archived?, 'MusicAlbum2 should be archived'
    refute @music_album3.can_be_archived?, 'MusicAlbum3 should not be archived'
  end
end
