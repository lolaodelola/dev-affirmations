class CreateSentAffirmations < ActiveRecord::Migration[6.0]
  def change
    create_table :sent_affirmations do |t|
      t.integer :developer_id
      t.integer :affirmation_id
      t.datetime :sent_at

      t.timestamps
    end
  end
end
