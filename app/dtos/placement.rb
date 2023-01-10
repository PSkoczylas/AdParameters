# frozen_string_literal: true

class Placement
  attr_accessor :id, :floor, :currency, :creatives

  def initialize(id: nil, floor: nil, currency: nil)
    @id = id
    @floor = floor
    @currency = currency
    @creatives = []
  end
end
