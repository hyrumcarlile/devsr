require "administrate/base_dashboard"

class SimulatedDayDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    num_new_users: Field::Number,
    num_new_endorsements: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    num_new_notes: Field::Number,
    num_new_votes: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :id,
    :num_new_users,
    :num_new_endorsements,
    :num_new_notes,
    :num_new_votes,
    :created_at,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :id,
    :num_new_users,
    :num_new_endorsements,
    :created_at,
    :updated_at,
    :num_new_notes,
    :num_new_votes,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :num_new_users,
    :num_new_endorsements,
    :num_new_notes,
    :num_new_votes,
  ].freeze

  # Overwrite this method to customize how simulated days are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(simulated_day)
  #   "SimulatedDay ##{simulated_day.id}"
  # end
end
