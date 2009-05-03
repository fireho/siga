class Document < ActiveRecord::Base
  generator_for :value, :method => :some_value
  generator_for :kind => "cpf"

  def self.some_valuew
    @last ||= "42465245"
    @last = @last.succ
  end


end
