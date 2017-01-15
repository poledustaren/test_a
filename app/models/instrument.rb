class Instrument
  attr_accessor :entities, :params_from_get

  def initialize
    @entities = ordered_entities
    @params_from_get = []
  end

  def ordered_entities
    Entity.order(:order_number)
  end

  def build_add_entity
    parent_entity = find_entity
    entity = Entity.new
    entity.entity_id = parent_entity.id
    entity.order_number = parent_entity.order_number + 1
    entity.url_path = parent_entity.url_path
    entity
  end

  def add_entity(params)
    entity = Entity.new(params)
    entity.url_path="#{entity.url_path}/#{entity.name}"
    entity.save
    entity.url_path
  end

  def edit_entity(params)
    entity = Entity.update(params[:id], params)
    entity.url_path
  end

  def find_entity
    size_to_order = @params_from_get.size-1
    last_param = @params_from_get.last.downcase
    if (last_param == 'add' || last_param == 'edit')
      size_to_order = size_to_order - 1
    end
    if size_to_order == 0
      return @entities.first
    else
      filtered_by_order = @entities.select { |x| x[:order_number] == size_to_order }
      return filtered_by_order.detect { |w| w.name == @params_from_get[size_to_order] }
    end
  end
end