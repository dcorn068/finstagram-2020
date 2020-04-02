# frozen_string_literal: true

class Comment < ActiveRecord::Base
  belongs_to :user
  belongs_to :finstagram_post

  # comments must have text, user, post associated with them
  validates_presence_of :text, :user, :finstagram_post
end
