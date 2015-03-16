class ChangeLocationIdInPrograms < ActiveRecord::Migration
  def up
  	change_table :programs do |t|
  		t.change :location_id, :integer
  	end
  end

  def down
  	change_table :programs do |t|
  		t.change :location_id, :string
  	end
  end
end
