class Reservation < ApplicationRecord
  belongs_to :client
  belongs_to :box
  
  # validates :fecha_desde,less_than: :fecha_hasta
  validate :expiration_date_cannot_be_in_the_past
  validate :fecha_desde_fecha_hasta
  
  def expiration_date_cannot_be_in_the_past
    if fecha_desde.present? && fecha_desde < Date.today
      errors.add(:fecha_desde, "La fecha desde es INCORRECTA")
    end
  end

  def fecha_desde_fecha_hasta
    if fecha_hasta < fecha_desde
      errors.add(:fecha_hasta, "La fecha Hasta tiene que se mayor que Fecha Desde")
    end
  end

end
