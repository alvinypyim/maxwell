require 'test_helper'
 
class CheckoutTest < ActiveSupport::TestCase

  def setup
    @checkout = Checkout.new
    @product_information = ProductInformation.new(nil, BigDecimal.new(549.99, 5))
  end

  test 'can calculate the total of 0' do
    assert_equal BigDecimal.new(0), @checkout.total
  end

  test 'can calculate the total after scanning a single product' do
    @checkout.scan @product_information

    assert_equal BigDecimal.new(549.99, 5), @checkout.total
  end

  test 'can calculate the total after scanning 2 products' do
    @checkout.scan @product_information
    @checkout.scan @product_information

    assert_equal BigDecimal.new(1099.98, 6), @checkout.total
  end
end
