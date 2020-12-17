class UserNote < ApplicationRecord
  belongs_to :user, optional: true
end
