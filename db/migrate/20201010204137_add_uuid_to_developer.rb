class AddUuidToDeveloper < ActiveRecord::Migration[6.0]
  def change
    add_column :developers, :uuid, :string, null: false
  end
end
