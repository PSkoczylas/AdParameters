# frozen_string_literal: true

class Placement
  attr_accessor :id, :currency, :creatives
  attr_reader :floor

  def initialize(id: nil, floor: nil, currency: nil)
    @id = id
    @floor = floor.to_f.round(2)
    @creatives = []
    @currency = currency
  end

  def serialize
    PlacementMessage.encode(to_message)
  end

  def to_message
    PlacementMessage.new(
      id:,
      creatives: creatives.all.map(&:to_message)
    )
  end

  def floor=(string_price)
    @price = string_price.to_f.round(2)
  end

  def self.serialize_all(placements:)
    message = PlacementSeq.new(
      placements: placements.all.map(&:to_message)
    )

    PlacementSeq.encode(message)
  end
end
