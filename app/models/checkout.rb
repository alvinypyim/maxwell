class Checkout

  def initialize(special_offer_list)
    @total = BigDecimal.new(0)
    @sku_list = [ ]
    @special_offer_list = special_offer_list
  end

  def scan(sku)
    @sku_list << sku
  end

  def total
    @manager = SpecialOfferManager.new
    sku_list = @sku_list.clone
    offer_sum = BigDecimal.new(0)

    while best_offer = @manager.best_offer(@special_offer_list, sku_list)
      offer_sum += best_offer.apply(sku_list)
    end

    offer_sum += sku_list.inject(BigDecimal.new(0)) do |sum, sku|
      sum + ProductManager.new.get(sku).price
    end
  end
end
