# frozen_string_literal: true

require 'rails_helper'

describe Creatives::CreativeRepository do
  describe '#convert_every_element_to_euro' do
    before do
      described_class.convert_every_element_to_euro(creatives:)
    end

    let(:creatives) { [creative1, creative2] }

    context 'from Euro' do
      let(:creative1) { Creative.new(id: 'Video1', price: 3.21, currency: 'EUR') }
      let(:creative2) { Creative.new(id: 'Video2', price: 5.21, currency: 'EUR') }

      it 'saves the same value' do
        expect(creative1.price).to eq(3.21)
        expect(creative2.price).to eq(5.21)
      end
    end

    context 'from USD' do
      let(:creative1) { Creative.new(id: 'Video1', price: 3.21, currency: 'USD') }
      let(:creative2) { Creative.new(id: 'Video2', price: 5.21, currency: 'USD') }

      it 'saves converted values' do
        expect(creative1.price).to eq(3.63)
        expect(creative2.price).to eq(5.89)
      end
    end

    context 'from SEK' do
      let(:creative1) { Creative.new(id: 'Video1', price: 3.21, currency: 'SEK') }
      let(:creative2) { Creative.new(id: 'Video2', price: 5.21, currency: 'SEK') }

      it 'saves converted values' do
        expect(creative1.price).to eq(35.73)
        expect(creative2.price).to eq(57.99)
      end
    end

    context 'from TYR' do
      let(:creative1) { Creative.new(id: 'Video1', price: 3.21, currency: 'TYR') }
      let(:creative2) { Creative.new(id: 'Video2', price: 5.21, currency: 'TYR') }

      it 'saves converted values' do
        expect(creative1.price).to eq(10.63)
        expect(creative2.price).to eq(17.25)
      end
    end
  end
end
