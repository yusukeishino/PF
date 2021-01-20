class AddAddressToInquiries < ActiveRecord::Migration[5.2]
  def change
    add_column :inquiries, :address, :string
  end
end
