class CreateContacts < ActiveRecord::Migration
  def self.up
    create_table :contacts do |t|
      t.integer :person_id
      t.string :data
    end
  end

  def self.down
    drop_table :contacts
  end
end
