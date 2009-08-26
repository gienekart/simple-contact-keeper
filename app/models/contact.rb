class Contact < ActiveRecord::Base
  validates_presence_of :person_id, :data
  validates_numericality_of :person_id, :only_integer => true

  #belongs_to :person

  def self.my_find(id)
    begin
      @contact = Contact.find(id)
    rescue
      @contact = nil
    end
    @contact
  end
end
