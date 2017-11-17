class Event::TeamsController < ApplicationController
  before_filter :require_login, except: :draft

  def draft
    @attendees = current_event.attendees.where(team: nil)
    @teams = Team.where(event: current_event)
  end

  def select
    @attendees = current_event.attendees.where(team: nil)
    @next_user = next_user
    @teams = Team.where(event: current_event).select { |t| t.available_profile?(current_user.profile.name) }
    @turns = turns
  end

  def pick
    if team.available_profile?(attendee.user.profile.name) && attendee.update(team: team)
      team.substract_profile(attendee.user.profile.name)
      team.save
      redirect_to event_logout_path, notice: 'Tu elección de equipo ha sido guardada.'
    else
      render event_select_path
    end
  end

  private

  def attendee
    @attendee ||= Attendee.find_by(user: current_user, event: current_event)
  end

  def team
    @team ||= Team.find(params[:id])
  end

  def next_user
    event_attendees.first.user
  end

  def event_attendees
    current_event.attendees.where(team: nil).order(:created_at)
  end

  def turns
    event_attendees.map { |e| e.user.id }.find_index(current_user.id)
  end
end
