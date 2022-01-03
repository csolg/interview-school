class AddEndAtToSections < ActiveRecord::Migration[6.0]
  def change
    remove_column :sections, :duration, :integer
    add_column :sections, :end_at, :string
  end
end
