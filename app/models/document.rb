class Document < ActiveRecord::Base
  belongs_to :person
  # :cpf, :cnh, :rg, cert_nasc, tipo sanguineo

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: documents
#
#  id         :integer         not null, primary key
#  person_id   :integer         not null
#  kind       :string(10)      not null
#  value      :string(255)     not null
#  note       :string(255)
#  state      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

