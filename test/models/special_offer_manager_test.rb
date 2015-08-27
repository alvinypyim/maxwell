require 'test_helper'
 
class SpecialOfferManagerTest < ActiveSupport::TestCase

  def setup
    @manager = SpecialOfferManager.new
  end

  test 'has an list of special offers' do

    assert_instance_of Array, @manager.special_offer_list
  end

  test 'determines the best offer' do
    sku_list = [ :atv ] * 3 + [ :mbp, :vga ]
    best_offer = @manager.best_offer(sku_list)

    assert_not_nil best_offer
    assert_equal '109.5', best_offer.saving(sku_list).to_s
    assert_equal BigDecimal.new(109.5, 4), best_offer.saving(sku_list)
  end

  test 'reports no offers found' do
    assert_nil @manager.best_offer([ :ipd ])
  end
end
