class CreateChallenges < ActiveRecord::Migration
  def self.up
    create_table :challenges do |t|
      t.integer :protocol_id
      t.string :data
      t.boolean :result
    end
  end

  def self.down
    drop_table :challenges
  end
end
