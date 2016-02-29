class CreateEnrichmentDays < ActiveRecord::Migration
  def change
    create_table :enrichment_days do |t|
      t.integer :child_id
      t.integer :enrichment_id

      t.timestamps
    end
  end
end
