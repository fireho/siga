class Profession < ActiveRecord::Base
  generator_for :name, :method => :some_name
  generator_for :kind => "graduated"

  def self.some_name
    @last ||= "Marceneiro"
    @last = @last.succ
  end

end
