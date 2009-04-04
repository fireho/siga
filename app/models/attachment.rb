class Attachment < ActiveRecord::Base
  has_attached_file :media,
                    :styles => { :medium => "300x300>",
                                 :thumb => "100x100>" }

end
