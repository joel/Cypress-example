# Source: https://github.com/rails/rails/blob/v7.1.2/activerecord/lib/rails/generators/active_record/migration/templates/create_table_migration.rb.tt
#
# This template comes from your local project under lib/rails/generators/active_record/migration/templates/create_table_migration.rb.tt.
# It is based on Rails 7.1. If your Rails version diverges, please note that the generator is outdated, and changes might be made.
#
class CreateUsers < ActiveRecord::Migration[8.0]
  def change
    create_table :users, id: false do |t|
      t.binary :id, limit: 16, null: false, index: { unique: true }, primary_key: true
      t.string :name

      t.timestamps
    end
  end
end
