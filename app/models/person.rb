require 'pry'

class Person < ActiveRecord::Base
  belongs_to :location
  belongs_to :role
  belongs_to :manager, class_name: "Person", foreign_key: :manager_id
  has_many :employees, class_name: "Person", foreign_key: :manager_id

  def self.order_by_location_name
    joins(:location).order('locations.name')
    # joins(:location).merge(Location.order(:name)) - thoughtbot
  end

  def self.managers
    where(manager_id: nil)
  end

  def self.with_managers
    where.not(manager_id: nil)
  end

  def self.with_employees
    self.managers.where(id: self.with_managers.pluck(:manager_id))
    # joins(:employees).distinct - thoughtbot
  end

  def self.with_employees_order_by_location_name
    from(Person.with_employees, :people).order_by_location_name
    # from(Person.with_employees, :people).order_by_location_name - thoughtbot
  end
end
