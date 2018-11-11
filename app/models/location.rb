# frozen_string_literal: true

# Location class
class Location < ActiveRecord::Base
  belongs_to :region
  has_many :people
end
