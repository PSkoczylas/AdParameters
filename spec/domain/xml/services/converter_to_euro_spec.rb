require 'rails_helper'

describe Xml::Services::ConverterToEuro do
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

    it 'returns the same value' do
      expect(subject).to eq(5.7743)
    end
  end

  context 'from SEK' do
    let(:currency) { 'SEK' }
    let(:value) { 5.11 }

    it 'returns the same value' do
      expect(subject).to eq(56.8743)
    end
  end

  context 'from TYR' do
    let(:currency) { 'TYR' }
    let(:value) { 5.11 }

    it 'returns the same value' do
      expect(subject).to eq(16.9141)
    end
  end
end