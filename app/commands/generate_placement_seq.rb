# frozen_string_literal: true

class GeneratePlacementSeq
  attr_reader :xml_request_data

  def initialize(xml_request_data:)
    @xml_request_data = xml_request_data
  end

  def call
    values = Xml::Services::Reader.new(xml_data: xml_request_data.body.read).call
    creatives = values[:creatives]
    placements = values[:placements]
    ::Creatives::CreativeRepository.convert_every_element_to_euro(creatives:)
    Placements::Services::CreativesToPlacementsAssigner.new(creatives:, placements:).call
  end
end
