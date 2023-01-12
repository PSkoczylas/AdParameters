# frozen_string_literal: true

class Creative
  attr_accessor :id, :currency
  attr_reader :price

  def initialize(id: nil, price: nil, currency: nil)
    @id = id
    @price = price.to_f.round(2)
    @currency = currency
  end

  def serialize
    Proto::CreativeMessage.encode(to_message)
  end

  def to_message
    Proto::CreativeMessage.new(
      id:,
      price:
    )
  end

  def price=(string_price)
    @price = string_price.to_f.round(2)
  end

  def self.serialize_all(creatives:)
    message = CreativeSeq.new(
      creatives: creatives.all.map(&:to_message)
    )

    CreativeSeq.encode(message)
  end
end
