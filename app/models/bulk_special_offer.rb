class BulkSpecialOffer < SpecialOffer

  def initialize(offering_price, minimum_count, sku)

    @offering_price = offering_price
    @minimum_count = minimum_count
    @sku = sku
  end

  def applicable?(sku_list)

    # The sku is found and there are at least the minimum amount of the item
    sku_list.index(@sku) and @minimum_count <= sku_list.count(@sku)
  end

  def saving(sku_list)

    return BigDecimal.new(0) unless applicable? sku_list
    
    (ProductManager.new.get(@sku).price - @offering_price) * sku_list.count(@sku)
  end

  def apply(sku_list)

    return BigDecimal.new(0) unless applicable? sku_list
    
    count = sku_list.count(@sku)
    sku_list.reject! { |sku| sku == @sku }

    @offering_price * count
  end
end
