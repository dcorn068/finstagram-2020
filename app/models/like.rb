# frozen_string_literal: true

class Like < ActiveRecord::Base
  belongs_to :user
  belongs_to :finstagram_post

  # likes must have user & post
  validates_presence_of :user, :finstagram_post
end
