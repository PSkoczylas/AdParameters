# frozen_string_literal: true

# Generated by the protocol buffer compiler.  DO NOT EDIT!
# source: placement_seq.proto

require 'google/protobuf'

require '/app/proto/placement_message_pb'

Google::Protobuf::DescriptorPool.generated_pool.build do
  add_file('placement_seq.proto', syntax: :proto2) do
    add_message 'proto.PlacementSeq' do
      repeated :placement, :message, 1, 'proto.PlacementMessage'
    end
  end
end

module Proto
  PlacementSeq = ::Google::Protobuf::DescriptorPool.generated_pool.lookup('proto.PlacementSeq').msgclass
end