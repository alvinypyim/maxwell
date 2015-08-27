class SpecialOfferManager
  def special_offer_list
    [
      SpecialOffer.new(BigDecimal.new(219), [ :atv ] * 3),
      BulkSpecialOffer.new(BigDecimal.new(499.99, 5), 5, :ipd),
      SpecialOffer.new(BigDecimal.new(1399.99, 6), [ :mbp, :vga ]),
    ]
  end

  def best_offer(offers, sku_list)

    sorted_offers = offers.sort_by { |offer| offer.saving(sku_list) }

    return nil if sorted_offers.empty?
    return nil if sorted_offers.last.saving(sku_list) == BigDecimal.new(0)

    sorted_offers.last
  end
end
