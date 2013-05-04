class CreateColaboradors < ActiveRecord::Migration
  def change
    create_table :colaboradors do |t|
      t.string :nome
      t.string :matricula
      t.string :cargo

      t.timestamps
    end
  end
end
