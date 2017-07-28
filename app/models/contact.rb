class Contact < ApplicationRecord
  belongs_to :user
  before_save :capitalize_first_and_last

  def capitalize_first_and_last
    self.first_name.capitalize!
    self.last_name.capitalize!

  end

end
