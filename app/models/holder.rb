class Holder < ActiveRecord::Base

  belongs_to :group
  belongs_to :person

  def person_text
    person.name if person
  end

end
