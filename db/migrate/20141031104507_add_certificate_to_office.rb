class AddCertificateToOffice < ActiveRecord::Migration
  def change
    add_column :offices, :certificate, :string
  end
end
