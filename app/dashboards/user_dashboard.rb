require "administrate/base_dashboard"

class UserDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    id: Field::Number,
    overall_rank: Field::Number.with_options(decimals: 2),
    profile: Field::BelongsTo,
    invitations: Field::HasMany,
    attendees: Field::HasMany,
    name: Field::String,
    email: Field::String,
    image_url: Field::Image,
    role: Field::Enum,
    shirt_size: Field::Enum,
    cellphone: Field::Telephone,
    question_ranks: Field::JSON,
    created_at: Field::DateTime,
    updated_at: Field::DateTime
  }.freeze

  # COLLECTION_ATTRIBUTES
  # an array of attributes that will be displayed on the model's index page.
  #
  # By default, it's limited to four items to reduce clutter on index pages.
  # Feel free to add, remove, or rearrange items.
  COLLECTION_ATTRIBUTES = [
    :name,
    :profile,
    :overall_rank,
    :shirt_size,
    :id
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :profile,
    :overall_rank,
    :question_ranks,
    :invitations,
    :attendees,
    :name,
    :email,
    :image_url,
    :role,
    :shirt_size,
    :cellphone,
    :created_at,
    :updated_at
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :profile,
    :name,
    :email,
    :image_url,
    :role,
    :shirt_size,
    :cellphone
  ].freeze

  # Overwrite this method to customize how users are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(user)
    user.name
  end
end
