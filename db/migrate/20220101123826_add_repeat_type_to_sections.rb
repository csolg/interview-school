class AddRepeatTypeToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :repeat_type, :integer
  end
end
