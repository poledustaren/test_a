class HomeController < ApplicationController
  def index
    @entities = Entity.ordered_entities
    if params[:names].nil?
      @view_entity = @entities.first
    else
      params_from_get = params[:names].split('/')
      last_param = params_from_get.last

      case last_param
        when 'add'
          add_model(params_from_get)
        when 'edit'
          edit_model(params_from_get)
        else
          @view_entity = Entity.find_entity(params_from_get,@entities)
      end
    end
  end

  def add_model(params_from_get)
    if (params[:entity].nil?)
      @view_entity = Entity.build_add_entity(params_from_get,@entities)
      render "home/add"
    else
      url_path = Entity.add_entity(params[:entity])
      redirect_to "http://0.0.0.0:3000/#{url_path}"
    end
  end

  def edit_model(params_from_get)
    if (params[:entity].nil?)
      @view_entity = Entity.find_entity(params_from_get,@entities)
      render "home/edit"
    else
      url_path=Entity.edit_entity(params[:entity])
      redirect_to "http://0.0.0.0:3000/#{url_path}"
    end
  end
end
