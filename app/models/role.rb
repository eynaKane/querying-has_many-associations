# frozen_string_literal: true

# Role class
class Role < ActiveRecord::Base
  has_many :people
end
