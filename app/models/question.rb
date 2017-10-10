class Question < ApplicationRecord
  has_many :reviews
  enum q_type: [:stars, :open]

  def input(name)
    if q_type == 'open'
      "<div class='form-group'><textarea name='#{name}' class='form-control' required></textarea></div>"
    elsif q_type == 'stars'
      "<div class='c-rating form-group'><input type='hidden' class='form-control' value=0 name='#{name}' required></div>"
    else
      ''
    end
  end
end
