class Register < ActiveRecord::Base
  has_money :value


  state_machine :state, :initial => :open do
     event :pay do
        transition :open => :closed
      end

  end

  def close
    update_attribute(:cleared_at, Time.now)
  end

end
