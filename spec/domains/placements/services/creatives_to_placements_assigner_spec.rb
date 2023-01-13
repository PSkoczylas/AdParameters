# frozen_string_literal: true

require 'rails_helper'

describe Placements::Services::CreativesToPlacementsAssigner do
  subject { described_class.new(creatives:, placements:).call }

  context 'for 4 creatives to 5 placements' do
    let(:creative1) { Creative.new(id: 'Video1', price: 3.21, currency: 'EUR') }
    let(:creative2) { Creative.new(id: 'Video2', price: 5.21, currency: 'EUR') }
    let(:creative3) { Creative.new(id: 'Video3', price: 7.21, currency: 'EUR') }
    let(:creative4) { Creative.new(id: 'Video4', price: 9.21, currency: 'EUR') }

    let(:creatives) { [creative1, creative2, creative3, creative4] }

    let(:placement1) { Placement.new(id: 'plc-1', floor: 3.01, currency: 'EUR') }
    let(:placement2) { Placement.new(id: 'plc-1', floor: 5.01, currency: 'EUR') }
    let(:placement3) { Placement.new(id: 'plc-1', floor: 7.01, currency: 'EUR') }
    let(:placement4) { Placement.new(id: 'plc-1', floor: 8.01, currency: 'EUR') }
    let(:placement5) { Placement.new(id: 'plc-1', floor: 9.99, currency: 'EUR') }

    let(:placements) { [placement1, placement2, placement3, placement4, placement5] }

    it 'appends creatives to placements' do
      subject
      expect(placement1.creatives.size).to eq(4)
      expect(placement2.creatives.size).to eq(3)
      expect(placement3.creatives.size).to eq(2)
      expect(placement4.creatives.size).to eq(1)
      expect(placement5.creatives.size).to eq(0)
    end
  end
end
