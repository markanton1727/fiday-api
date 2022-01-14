class AddDefaultJsonbToMetadataUsers < ActiveRecord::Migration[6.0]
  def change
    change_column_default :users, :metadata, from: nil, to: {}
  end
end
