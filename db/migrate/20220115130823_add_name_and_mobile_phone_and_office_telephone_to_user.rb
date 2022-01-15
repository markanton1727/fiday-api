class AddNameAndMobilePhoneAndOfficeTelephoneToUser < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :name, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :office_telephone, :string
  end
end
