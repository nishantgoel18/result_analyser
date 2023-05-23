require "administrate/field/base"

class FormattedDateField < Administrate::Field::Base
  def to_s
    data
  end
end
