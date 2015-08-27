class SpecialOffer

  def initialize(offering_price, sku_list)

    @offering_price = offering_price
    @sku_list = sku_list
  end

  def saving(sku_list)

    # This offer doesn't apply because not all the sku(s) are found
    return BigDecimal.new(0) unless (@sku_list - sku_list).empty?
    
    manager = ProductManager.new

    original_price = @sku_list.inject(BigDecimal.new(0)) do |sum, sku|
      sum + manager.get(sku).price
    end

    original_price - @offering_price
  end
end
