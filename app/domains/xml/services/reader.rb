# frozen_string_literal: true

module Xml
  module Services
    class Reader
      attr_reader :xml_data, :creatives, :placements

      def initialize(xml_data:)
        @xml_data = xml_data
        @creatives = []
        @placements = []
      end

      def call
        output_data = Nokogiri::XML(xml_data)
        create_creatives(output_data)
        create_placements(output_data)
        { creatives:, placements: }
      end

      private

      CREATIVE_SEARCH = '//Creative'
      def create_creatives(data)
        data.xpath(CREATIVE_SEARCH).each do |attr|
          creatives.append(Creative.new)
          attr.each do |creative|
            creatives.last.send("#{creative[0].to_sym}=", creative[1])
          end
        end
      end

      PLACEMENT_SEARCH = '//Placement'
      def create_placements(data)
        data.xpath(PLACEMENT_SEARCH).each do |attr|
          placements.append(Placement.new)
          attr.each do |placement|
            placements.last.send("#{placement[0].to_sym}=", placement[1])
          end
        end
      end
    end
  end
end
