class Challenge < ActiveRecord::Base

  validates_presence_of :protocol_id, :data
  validates_numericality_of :protocol_id, :only_integer => true
  belongs_to :protocol

  def self.my_find(id)
    begin
      @challenge = Challenge.find(id)
    rescue
      @challenge = nil
    end
    @challenge
  end

  def is_valid?
    expression = Regexp.new(self.protocol.valid_exp)
    if self.data[expression]
      return true
    else
      return false
    end
  end
end
