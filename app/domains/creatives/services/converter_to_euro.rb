# frozen_string_literal: true

module Creatives
  module Services
    class ConverterToEuro
      attr_reader :currency, :value

      EXCHANGE = {
        EUR: 1.00,
        USD: 1.13,
        TYR: 3.31,
        SEK: 11.13
      }.freeze

      def initialize(currency:, value:)
        @currency = currency
        @value = value
      end

      def call
        (value * EXCHANGE[currency.to_sym]).round(2)
      end
    end
  end
end
