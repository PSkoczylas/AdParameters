# frozen_string_literal: true

require 'rails_helper'

describe Xml::Services::Reader do
  subject { described_class.new(xml_data:) }

  context 'when reads xml test 1' do
    let(:io) { Rails.root.join('spec/fixtures/xml_test1.xml') }
    let(:xml_data) do
      '<root>
      <Creatives>
            <Creative id="Video-1" price="6.4567" currency="EUR"/>
            <Creative id="Video-4" price="1.1234" currency="USD"/>
            <Creative id="Video-7" price="55.123" currency="SEK"/>
            <Creative id="Video-12" price="16.4567" currency="EUR"/>
            <Creative id="Video-25" price="9.4567" currency="USD"/>
      </Creatives>
      <Placements>
                  <Placement id="plc-1" floor="1.3456" currency="EUR"/>
                  <Placement id="plc-2" floor="90.234" currency="SEK"/>
                  <Placement id="plc-3" floor="8.343" currency="TYR"/>
                  <Placement id="plc-4" floor="20.56" currency="USD"/>
                  <Placement id="plc-5" floor="27.9856" currency="EUR"/>
                  <Placement id="plc-6" floor="22.5656" currency="SEK"/>
                  <Placement id="plc-7" floor="0" currency="EUR"/>
                  <Placement id="plc-8" floor="1.3456" currency="USD"/>
      </Placements>
      </root>'
    end

    it 'returns correct amount of creatives and placements' do
      subject.call
      expect(subject.creatives.count).to eq(5)
      expect(subject.placements.count).to eq(8)
    end
  end
end
