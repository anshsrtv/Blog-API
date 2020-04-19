class CreateTriangles < ActiveRecord::Migration[6.0]
  def change
    create_table :triangles do |t|
      t.float :a
      t.float :b
      t.float :c
      t.string :type

      t.timestamps
    end
  end
end
