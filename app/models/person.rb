class Person < ActiveRecord::Base
  has_many :contacts
  validates_presence_of :name, :user_id
  validates_numericality_of :user_id, :only_integer => true


  def self.my_find(id)
    begin
      @person = Person.find(id)
    rescue
      @person = nil
    end
    @person
  end
end
