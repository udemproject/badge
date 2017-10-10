require 'administrate/base_dashboard'

class EventDashboard < Administrate::BaseDashboard
  # ATTRIBUTE_TYPES
  # a hash that describes the type of each of the model's fields.
  #
  # Each different type represents an Administrate::Field object,
  # which determines how the attribute is displayed
  # on pages throughout the dashboard.
  ATTRIBUTE_TYPES = {
    invitations: Field::HasMany,
    location: Field::BelongsTo,
    users: Field::HasMany,
    invited_users: Field::HasMany,
    attendees: Field::HasMany,
    teams: Field::HasMany,
    id: Field::Number,
    name: Field::String,
    starts_at: Field::DateTime,
    finishes_at: Field::DateTime,
    label_xml: FileField,
    image: Field::Refile,
    agenda_image: Field::Refile,
    choose_team: Field::Boolean,
    checkin: Field::Boolean,
    review: Field::Boolean,
    reviews: Field::HasMany,
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
    :attendees,
    :teams
  ].freeze

  # SHOW_PAGE_ATTRIBUTES
  # an array of attributes that will be displayed on the model's show page.
  SHOW_PAGE_ATTRIBUTES = [
    :location,
    :choose_team,
    :checkin,
    :review,
    :attendees,
    :users,
    :invited_users,
    :teams,
    :id,
    :name,
    :starts_at,
    :finishes_at,
    :image,
    :agenda_image,
    :reviews
  ].freeze

  # FORM_ATTRIBUTES
  # an array of attributes that will be displayed
  # on the model's form (`new` and `edit`) pages.
  FORM_ATTRIBUTES = [
    :name,
    :location,
    :choose_team,
    :checkin,
    :review,
    :starts_at,
    :finishes_at,
    :label_xml,
    :image,
    :agenda_image
  ].freeze

  # Overwrite this method to customize how events are displayed
  # across all pages of the admin dashboard.
  #
  def display_resource(event)
    event.name
  end
end
