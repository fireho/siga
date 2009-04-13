class Holder < ActiveRecord::Base
  attr_writer :person_text
  belongs_to :group
  belongs_to :person

  validates_presence_of :group
  validates_presence_of :person

  def person_text
    person.name if person
  end


end
