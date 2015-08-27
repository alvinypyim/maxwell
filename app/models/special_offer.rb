class SpecialOffer

  def initialize(offering_price, sku_list)

    @offering_price = offering_price
    @sku_list = sku_list
  end

  def saving(sku_list)

    # This offer doesn't apply because not all the sku(s) are found
    return BigDecimal.new(0) unless subtract_once(@sku_list, sku_list).empty?
    
    manager = ProductManager.new

    original_price = @sku_list.inject(BigDecimal.new(0)) do |sum, sku|
      sum + manager.get(sku).price
    end

    original_price - @offering_price
  end

  def apply(sku_list)

    # This offer doesn't apply because not all the sku(s) are found
    return BigDecimal.new(0) unless subtract_once(@sku_list, sku_list).empty?
    
    subtract_once! sku_list, @sku_list

    @offering_price
  end

  def subtract_once(original_list, delete_list)

    list_copy = original_list.clone

    delete_list.each do |target|

      index = list_copy.index(target)
      list_copy.delete_at index if index
    end

    list_copy
  end

  def subtract_once!(original_list, delete_list)

    delete_list.each do |target|

      index = original_list.index(target)
      original_list.delete_at index if index
    end

    original_list
  end
end
