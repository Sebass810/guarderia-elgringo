class Boat < ApplicationRecord
  belongs_to :client

  validates :nombre, :matricula, :motor, presence: true

end
