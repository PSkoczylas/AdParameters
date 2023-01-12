# frozen_string_literal: true

require 'rails_helper'

describe Creatives::Services::ConverterToEuro do
  subject { described_class.new(currency:, value:).call }

  context 'from Euro' do
    let(:currency) { 'EUR' }
    let(:value) { 5.11 }

    it 'returns the same value' do
      expect(subject).to eq(5.11)
    end
  end

  context 'from USD' do
    let(:currency) { 'USD' }
    let(:value) { 5.11 }

    it 'returns converted value' do
      expect(subject).to eq(5.77)
    end
  end

  context 'from SEK' do
    let(:currency) { 'SEK' }
    let(:value) { 5.11 }

    it 'returns converted value' do
      expect(subject).to eq(56.87)
    end
  end

  context 'from TYR' do
    let(:currency) { 'TYR' }
    let(:value) { 5.11 }

    it 'returns converted value' do
      expect(subject).to eq(16.91)
    end
  end
end
