class ToiletTime < ApplicationRecord
  belongs_to :admin_note
  belongs_to :toilet_type
end