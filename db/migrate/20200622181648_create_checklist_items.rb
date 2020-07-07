class CreateChecklistItems < ActiveRecord::Migration[6.0]
  def change
    create_table :checklist_items do |t|
      t.references :checklist, null: false, foreign_key: true
      t.string :title
      t.string :status

      t.timestamps
    end
  end
end
