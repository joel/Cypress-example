# frozen_string_literal: true

# Source: https://github.com/rails/rails/blob/7-1-stable/activerecord/lib/rails/generators/active_record/model/templates/model.rb.tt
class ::Post < ApplicationRecord
  belongs_to :user
  validates :title, presence: true

  attribute :user_id, :uuid_v7
end
