class AddProgramIdToEnrichment < ActiveRecord::Migration
  def change
    add_column :enrichments, :program_id, :integer
  end
end
