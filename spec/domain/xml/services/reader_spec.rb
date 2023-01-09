require 'rails_helper'

describe Xml::Services::Reader do
  subject { described_class.new(io:) }

  context 'when reads xml test 1' do
    let(:io) { Rails.root.join('spec/fixtures/xml_test1.xml') }

    it 'returns correct amount of creatives and placements' do
      subject.call
      expect(subject.creatives.count).to eq(5)
      expect(subject.placements.count).to eq(8)
    end
  end
end
