class DescentClient < ApplicationRecord
  belongs_to :client
  belongs_to :boat
  belongs_to :enable_person
end
