class AddBehaviorsTable < ActiveRecord::Migration[5.2]
  def change
    create_table :behaviors do |t|
      t.string :properties
      t.timestamps
    end
  end
end
