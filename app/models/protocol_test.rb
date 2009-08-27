class ProtocolTest < ActiveRecord::Base
  validates_presence_of :protocol_id, :data, :result
  validates_numericality_of :protocol_id, :only_integer => true
  belongs_to :protocol
end
