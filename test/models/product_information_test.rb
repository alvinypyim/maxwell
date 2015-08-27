require 'test_helper'
 
class ProductInformationTest < ActiveSupport::TestCase

  def setup
    @product_information = ProductInformation.new('Super iPad', BigDecimal.new(549.99, 5))
  end

  test 'has a price' do
    assert_equal BigDecimal.new(549.99, 5), @product_information.price
  end

  test 'has a name' do
    assert_equal 'Super iPad', @product_information.name
  end
end
