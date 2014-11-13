class CreateSteps < ActiveRecord::Migration
  def change
    create_table :steps do |t|
      t.string :name
      t.references :list, index: true

      t.timestamps
    end
  end
end
