class Province < ActiveRecord::Base
  generator_for :name, :method => :next_name
  generator_for :abbr, :method => :next_abbr

  def self.next_name
    @last ||= 'Minas Gerais'
    @last = @last.succ
  end

  def self.next_abbr
    @last_sig ||= 'MG'
    @last_sig = @last_sig.succ
  end
end

