class Entity < ActiveRecord::Base
  belongs_to :entity
  has_many :entity
end

require_relative 'instrument.rb'

