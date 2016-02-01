class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :name
      t.string :email
      t.string :password_digest
      t.string :profile
      t.string :area
      t.string :university

      t.timestamps null: false
      
      #他ユーザーとemailが異なるようにする。
      t.index :email, unique: true # この行を追加
    end
  end
end
