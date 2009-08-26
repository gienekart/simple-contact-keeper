class Contact < ActiveRecord::Base
  belongs_to :person

  def self.my_find(id)
    begin
      @contact = Person.find(id)
    rescue
      @contact = nil
    end
    @contact
  end
end
