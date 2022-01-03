class AddWeekdaysToSections < ActiveRecord::Migration[6.0]
  def change
    add_column :sections, :weekdays, :string
  end
end
