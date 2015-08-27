require 'test_helper'
 
class SpecialOfferManagerTest < ActiveSupport::TestCase

  def setup
    @manager = SpecialOfferManager.new
    @pricing_rules = @manager.special_offer_list
  end

  test 'has an list of special offers' do

    assert_instance_of Array, @manager.special_offer_list
  end

  test 'determines the best offer' do
    sku_list = [ :atv ] * 3 + [ :mbp, :vga ]
    best_offer = @manager.best_offer(@pricing_rules, sku_list)

    assert_not_nil best_offer
    assert_equal BigDecimal.new(109.5, 4), best_offer.saving(sku_list)
  end

  test 'reports no offers found' do
    assert_nil @manager.best_offer(@pricing_rules, [ :ipd ])
  end
end
