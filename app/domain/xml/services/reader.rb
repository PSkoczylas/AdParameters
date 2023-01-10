# frozen_string_literal: true

module Xml
  module Services
    class Reader
      attr_reader :io, :creatives, :placements

      def initialize(io:)
        @io = io
        @creatives = []
        @placements = []
      end

      def call
        # data = Nokogiri::XML(File.open("../files/#{file_name}"))
        data = Nokogiri::XML(io)
        create_creatives(data)
        create_placements(data)
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
