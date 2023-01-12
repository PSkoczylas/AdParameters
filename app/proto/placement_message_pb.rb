# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: placement_message.proto

require 'google/protobuf'

require '/app/proto/creative_message_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file('placement_message.proto', syntax: :proto2) do
    add_message 'proto.PlacementMessage' do
      required :id, :string, 1
      repeated :creatives, :message, 2, 'proto.CreativeMessage'
    end
  end
end

module Proto
  PlacementMessage = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('proto.PlacementMessage').msgclass
end