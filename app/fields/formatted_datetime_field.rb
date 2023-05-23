require "administrate/field/base"

class FormattedDatetimeField < Administrate::Field::Base
  def to_s
    data
  end
end
