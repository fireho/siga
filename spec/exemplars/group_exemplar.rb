class Group < ActiveRecord::Base
  generator_for :name, :method => :next_group_name
  generator_for :official_name, :method => :next_group_name

  # generator_for :state => 'active'

  def self.next_group_name
    @last ||= "Yoyodine Ltda"
    @last = @last.succ
  end
end

