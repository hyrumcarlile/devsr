require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    achievements: Field::HasMany,
    achievement_criterium: Field::HasOne,
    endorsers: Field::HasMany.with_options(class_name: "Endorsement"),
    endorsees: Field::HasMany.with_options(class_name: "Endorsement"),
    notes: Field::HasMany,
    skill_ratings: Field::HasMany,
    votes: Field::HasMany,
    id: Field::Number,
    created_at: Field::DateTime,
    updated_at: Field::DateTime,
    email: Field::String,
    encrypted_password: Field::String,
    reset_password_token: Field::String,
    reset_password_sent_at: Field::DateTime,
    remember_created_at: Field::DateTime,
    sign_in_count: Field::Number,
    current_sign_in_at: Field::DateTime,
    last_sign_in_at: Field::DateTime,
    current_sign_in_ip: Field::String.with_options(searchable: false),
    last_sign_in_ip: Field::String.with_options(searchable: false),
    name: Field::String,
    username: Field::String,
    rating: Field::String.with_options(searchable: false),
    avatar_url: Field::Text,
    provider: Field::String,
    uid: Field::String,
    role: Field::String.with_options(searchable: false),
    number_of_sign_ins: Field::Number,
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :achievements,
    :achievement_criterium,
    :endorsers,
    :endorsees,
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :achievements,
    :achievement_criterium,
    :endorsers,
    :endorsees,
    :notes,
    :skill_ratings,
    :votes,
    :id,
    :created_at,
    :updated_at,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :name,
    :username,
    :rating,
    :avatar_url,
    :provider,
    :uid,
    :role,
    :number_of_sign_ins,
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :achievements,
    :achievement_criterium,
    :endorsers,
    :endorsees,
    :notes,
    :skill_ratings,
    :votes,
    :email,
    :encrypted_password,
    :reset_password_token,
    :reset_password_sent_at,
    :remember_created_at,
    :sign_in_count,
    :current_sign_in_at,
    :last_sign_in_at,
    :current_sign_in_ip,
    :last_sign_in_ip,
    :name,
    :username,
    :rating,
    :avatar_url,
    :provider,
    :uid,
    :role,
    :number_of_sign_ins,
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  # def display_resource(user)
  #   "User ##{user.id}"
  # end
end
