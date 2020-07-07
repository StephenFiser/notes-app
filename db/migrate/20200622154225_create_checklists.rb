class CreateChecklists < ActiveRecord::Migration[6.0]
  def change
    create_table :checklists do |t|
      t.references :page, null: false, foreign_key: true
      t.string :title

      t.timestamps
    end
  end
end
