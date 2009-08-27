class Protocol < ActiveRecord::Base
  validates_presence_of :valid_exp, :name
  has_many :protocol_tests

  def self.my_find(id)
    begin
      @protocol = Protocol.find(id)
    rescue
      @protocol = nil
    end
    @protocol
  end
end
