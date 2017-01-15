class Entity < ActiveRecord::Base
  belongs_to :entity
  has_many :entity

  def self.ordered_entities
    self.order(:order_number)
  end

  def self.build_add_entity(params_from_get,entities)
    parent_entity = self.find_entity(params_from_get,entities)
    entity = Entity.new
    entity.entity_id = parent_entity.id
    entity.order_number = parent_entity.order_number + 1
    entity.url_path = parent_entity.url_path
    entity
  end

  def self.add_entity(params)
    entity = Entity.new(params)
    entity.url_path="#{entity.url_path}/#{entity.name}"
    entity.save
    entity.url_path
  end

  def self.edit_entity(params)
    entity = Entity.update(params[:id], params)
    entity.url_path
  end

  def self.find_entity(params_from_get,entities)
    size_to_order = params_from_get.size-1
    if ( params_from_get.last.downcase == 'add' || params_from_get.last.downcase == 'edit' )
      size_to_order = size_to_order - 1
    end

    if size_to_order == 0
      return entities.first
    else
      filtered_by_order = entities.select { |x| x[:order_number] == size_to_order }
      return filtered_by_order.detect { |w| w.name == params_from_get[size_to_order] }
    end
  end
end
