# frozen_string_literal: true

module Placements
  module Services
    class CreativesToPlacementsAssigner
      attr_reader :creatives, :placements

      def initialize(creatives:, placements:)
        @creatives = creatives.sort_by(&:price).reverse
        @placements = placements
      end

      def call
        placements.each do |placement|
          creatives.each do |creative|
            break unless creative.price >= placement.floor

            placement.creatives.append(placement)
          end
        end
      end
    end
  end
end
