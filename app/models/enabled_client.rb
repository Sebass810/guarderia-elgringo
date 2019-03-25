class EnabledClient < ApplicationRecord
  belongs_to :enabled_person
  belongs_to :clients
end
