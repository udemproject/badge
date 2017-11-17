# class Event::ReviewsController < ApplicationController
#   before_filter :require_login
#
#   def new
#     redirect_to edit_user_path unless current_event.review?
#     redirect_to edit_user_path if Review.find_by(event: current_event, reviewer: current_user)
#     @event_questions = Question.where(individual: false)
#     @team_questions = Question.where(individual: true)
#
#     @current_attendee = current_event.attendees.find_by(user: current_user)
#
#     @team_mates = @current_attendee.team.users - [current_user]
#
#     @review = Review.new
#   end
#
#   def create
#     # Event Question Answers
#     params.fetch('event_question_answers').keys.each do |event_question_answer_key|
#       stars = nil
#       answer = nil
#       if Question.find(event_question_answer_key.to_i).q_type == 'stars'
#         stars = params.dig('event_question_answers', event_question_answer_key).to_i
#       else
#         answer = params.dig('event_question_answers', event_question_answer_key)
#       end
#       Review.create(stars: stars,
#                     answer: answer,
#                     question_id: event_question_answer_key.to_i,
#                     reviewee_id: nil, reviewer_id: current_user.id,
#                     event_id: current_event.id)
#     end
#     # Team Review Answers
#     params.fetch('team_review_answers').keys.each do |team_review_answer_key|
#       params.dig('team_review_answers', team_review_answer_key).keys.each do |question|
#         stars = nil
#         answer = nil
#         if Question.find(question.to_i).q_type == 'stars'
#           stars = params.dig('team_review_answers', team_review_answer_key, question).to_i
#         else
#           answer = params.dig('team_review_answers', team_review_answer_key, question)
#         end
#         Review.create(stars: stars,
#                       answer: answer,
#                       question_id: question.to_i,
#                       reviewee_id: team_review_answer_key.to_i,
#                       reviewer_id: current_user.id,
#                       event_id: current_event.id)
#       end
#     end
#     redirect_to edit_user_path, notice: 'Gracias por ayudarnos a mejorar. 🤖'
#   end
# end
