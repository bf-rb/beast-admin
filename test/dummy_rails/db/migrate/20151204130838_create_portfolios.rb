class CreatePortfolios < ActiveRecord::Migration
  def change
    create_table :portfolios do |t|

      t.integer :user_id
      t.datetime :some_date

      t.timestamps
    end
  end
end
