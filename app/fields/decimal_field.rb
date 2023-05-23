require "administrate/field/base"

class DecimalField < Administrate::Field::Base
  def to_s
    data
  end
end
