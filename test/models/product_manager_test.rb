require 'test_helper'
 
class ProductManagerTest < ActiveSupport::TestCase

  test 'get an individual product' do
    manager = ProductManager.new

    assert_instance_of ProductInformation, manager.get(:ipd)
  end
end
