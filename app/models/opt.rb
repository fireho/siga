class Opt < ActiveRecord::Base

  OPT = {
    :online => true,
    :city => "Sig@ Cidade Teste",
    :welcome => "Bem Vindo ao SIG@",
    :enable_gis => true,
    :enable_modules => true
  }

  validates_presence_of :key, :value


  def method_missing(m)
    OPT.each { |o| return o if m =~ o.key }
    super
  end

end

# == Schema Information
# Schema version: 99999999999999
#
# Table name: opts
#
#  id         :integer         not null, primary key
#  key        :string(255)
#  value      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

