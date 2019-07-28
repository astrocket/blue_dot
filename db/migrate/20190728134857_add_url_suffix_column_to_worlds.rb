class AddUrlSuffixColumnToWorlds < ActiveRecord::Migration[6.0]
  def change
    add_column :worlds, :url_suffix, :string
    add_index :worlds, :url_suffix
  end
end
