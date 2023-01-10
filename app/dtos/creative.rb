# frozen_string_literal: true

class Creative
  attr_accessor :id, :price, :currency

  def initialize(id:, price:, currency:)
    @id = id
    @price = price
    @currency = currency
  end
end
