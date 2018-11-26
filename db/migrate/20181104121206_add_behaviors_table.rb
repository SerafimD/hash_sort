class AddBehaviorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :behaviors do |t|
      t.json :properties
      t.timestamps
    end
  end
end
