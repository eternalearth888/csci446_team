require 'test_helper'

class ItemTest < ActiveSupport::TestCase
	fixtures :items

  test "item title must not be empty" do 
  	item = Item.new
  	assert item.invalid?
  	assert item.errors[:title].any?
  end

  test "item length must be less than 100 characters" do
  	item = Item.new(title: "this is a very long item title and should fail this test because it is so very wrong unicorn and puppies and toads and princesses")
  	assert item.invalid?
  end

  test "valid new item" do 
  	item = items(:calc)
  	assert item.valid?
  end
end
