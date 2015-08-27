require 'test_helper'
 
class SpecialOfferTest < ActiveSupport::TestCase

  test 'calculates the saving for a single product' do
    offer = SpecialOffer.new(BigDecimal.new(539.98, 5), [ :ipd ])

    assert_equal BigDecimal.new(10.01, 4), offer.saving([ :ipd ])
  end

  test 'calculates the saving for 2 of the same product' do
    offer = SpecialOffer.new(BigDecimal.new(1079.96, 6), [ :ipd, :ipd ])

    assert_equal BigDecimal.new(20.02, 4), offer.saving([ :ipd, :ipd ])
  end

  test 'calculates the saving for 2 products' do
    offer = SpecialOffer.new(BigDecimal.new(1399.99, 6), [ :mbp, :vga])

    assert_equal BigDecimal.new(30), offer.saving([ :mbp, :vga, :ipd ])
  end

  test "no saving when the offer doesn't apply" do
    offer = SpecialOffer.new(BigDecimal.new(999), [ :ipd ])

    assert_equal BigDecimal.new(0), offer.saving([ :atv ])
  end
end
