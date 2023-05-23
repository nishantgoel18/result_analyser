require "administrate/base_dashboard"

class MonthlyResultAverageDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    date: FormattedDateField,
    monthly_avg_high: DecimalField,
    monthly_avg_low: DecimalField,
    monthly_result_count_used: Field::Number,
    subject: Field::String,
    created_at: FormattedDatetimeField,
    updated_at: FormattedDatetimeField,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = %i[
    id
    subject
    date
    monthly_avg_high
    monthly_avg_low
    monthly_result_count_used
    created_at
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = %i[
    id
    subject
    date
    monthly_avg_high
    monthly_avg_low
    monthly_result_count_used
    created_at
    updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = %i[
    subject
    date
    monthly_avg_high
    monthly_avg_low
    monthly_result_count_used
  ].freeze

  # COLLECTION_FILTERS
  # a hash that defines filters that can be used while searching via the search
  # field of the dashboard.
  #
  # For example to add an option to search for open resources by typing "open:"
  # in the search field:
  #
  #   COLLECTION_FILTERS = {
  #     open: ->(resources) { resources.where(open: true) }
  #   }.freeze
  COLLECTION_FILTERS = {}.freeze

  # Overwrite this method to customize how monthly result averages are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(monthly_result_average)
  #   "MonthlyResultAverage ##{monthly_result_average.id}"
  # end
end
