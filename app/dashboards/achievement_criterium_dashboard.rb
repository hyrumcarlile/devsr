require "administrate/base_dashboard"

class AchievementCriteriumDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    user: Field::BelongsTo,
    id: Field::Number,
    consecutive_logins: Field::Number,
    last_login: Field::DateTime,
    has_founder: Field::Boolean,
    has_lightbulb: Field::Boolean,
    has_pest_control: Field::Boolean,
    has_lifesaver: Field::Boolean,
    has_party_parrot: Field::Boolean,
    has_party_corgi: Field::Boolean,
    has_party_wizard: Field::Boolean,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :user,
    :id,
    :consecutive_logins,
    :last_login,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :user,
    :id,
    :consecutive_logins,
    :last_login,
    :has_founder,
    :has_lightbulb,
    :has_pest_control,
    :has_lifesaver,
    :has_party_parrot,
    :has_party_corgi,
    :has_party_wizard,
    :created_at,
    :updated_at,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :user,
    :consecutive_logins,
    :last_login,
    :has_founder,
    :has_lightbulb,
    :has_pest_control,
    :has_lifesaver,
    :has_party_parrot,
    :has_party_corgi,
    :has_party_wizard,
  ].freeze

  # Overwrite this method to customize how achievement criteria are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(achievement_criterium)
  #   "AchievementCriterium ##{achievement_criterium.id}"
  # end
end
