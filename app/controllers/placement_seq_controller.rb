# frozen_string_literal: true

class PlacementSeqController < ApplicationController
  def to_proto
    placements = GeneratePlacementSeq.new(xml_request_data: request).call
    send_data Placement.serialize_all(placements:)
  end
end
