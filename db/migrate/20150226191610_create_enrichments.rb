class CreateEnrichments < ActiveRecord::Migration
  def change
    create_table :enrichments do |t|
      t.float :length
      t.text :notes

      t.timestamps
    end
  end
end
