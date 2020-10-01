class Contact < ApplicationRecord
  validates :e_mail, :message, presence: true
end
