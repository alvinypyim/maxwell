class ProductManager
  def product_list
    {
      ipd: ProductInformation.new('Super iPad', BigDecimal.new(549.99, 5)),
      mbp: ProductInformation.new('MacBook Pro', BigDecimal.new(1399.99, 6)),
      atv: ProductInformation.new('Apple TV', BigDecimal.new(109.5, 4)),
      vga: ProductInformation.new('VGA adapter', BigDecimal.new(30)),
    }
  end

  def get(sku)
    product_list[sku]
  end
end
