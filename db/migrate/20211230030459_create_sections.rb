class CreateSections < ActiveRecord::Migration[6.0]
  def change
    create_table :sections do |t|
      t.integer :duration
      t.string :start_at
      t.belongs_to :teacher, null: false, foreign_key: true
      t.belongs_to :subject, null: false, foreign_key: true
      t.belongs_to :room, null: false, foreign_key: true

      t.timestamps
    end
  end
end
