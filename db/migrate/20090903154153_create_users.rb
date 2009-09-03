class CreateUsers < ActiveRecord::Migration
  def self.up
    create_table :users do |t|
      t.string :name
      t.string :surname
      t.string :password
      t.boolean :is_admin
    end
  end

  def self.down
    drop_table :users
  end
end
