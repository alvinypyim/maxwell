require 'test_helper'
 
class CheckoutTest < ActiveSupport::TestCase

  def setup
    special_offer_manager = SpecialOfferManager.new
    @checkout = Checkout.new(special_offer_manager.special_offer_list)
  end

  test 'can calculate the total of 0' do
    assert_equal BigDecimal.new(0), @checkout.total
  end

  test 'can calculate the total after scanning a single product' do
    @checkout.scan :ipd

    assert_equal BigDecimal.new(549.99, 5), @checkout.total
  end

  test 'can calculate the total after scanning 2 products' do
    ([ :ipd ] * 2).each { |sku| @checkout.scan sku }

    assert_equal BigDecimal.new(1099.98, 6), @checkout.total
  end

  test 'calculate the total with an offer applied' do
    ([ :atv ] * 3 + [ :vga ]).each { |sku| @checkout.scan sku }

    assert_equal BigDecimal.new(249).to_s, @checkout.total.to_s
  end

  test 'calculate the total with another offer applied' do
    ([ :mbp, :vga, :ipd ]).each { |sku| @checkout.scan sku }

    assert_equal BigDecimal.new(1949.98, 6).to_s, @checkout.total.to_s
  end
end
