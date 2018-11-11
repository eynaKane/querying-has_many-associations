# frozen_string_literal: true

# Region class
class Region < ActiveRecord::Base
  has_many :locations
end
