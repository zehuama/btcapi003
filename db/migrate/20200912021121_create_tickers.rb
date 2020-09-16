class CreateTickers < ActiveRecord::Migration[5.1]
  def change
    create_table :tickers do |t|
      t.string :symbol
      t.decimal :openPrice
      t.string :openTime
      t.string :closeTime
      t.datetime :created_at
      t.timestamps
    end
    add_index :tickers, :symbol
  end
end
