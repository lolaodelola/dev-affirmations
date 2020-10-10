class CreateDevelopers < ActiveRecord::Migration[6.0]
  def change
    create_table :developers do |t|
      t.string :phone_number
      t.string :twilio_uid
      t.boolean :confirmed, default: false

      t.timestamps
    end
  end
end
