# frozen_string_literal: true

module Creatives
  class CreativeRepository
    class << self
      def convert_every_element_to_euro(creatives:)
        creatives.each do |creative|
          creative.price = Creatives::Services::ConverterToEuro.new(currency: creative.currency,
                                                                    value: creative.price).call
        end
      end
    end
  end
end
