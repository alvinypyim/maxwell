class Checkout

  def initialize
    @total = BigDecimal.new(0)
    @product_information_list = [ ]
  end

  def scan(product)
    @product_information_list << product
  end

  def total
    @product_information_list.inject(BigDecimal.new(0)) do |sum, product_information|
      sum + product_information.price
    end
  end
end
