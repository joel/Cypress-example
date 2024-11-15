# frozen_string_literal: true

# Source: https://github.com/rails/rails/blob/7-1-stable/activerecord/lib/rails/generators/active_record/model/templates/model.rb.tt
class ::Post < ApplicationRecord
  belongs_to :user
end
