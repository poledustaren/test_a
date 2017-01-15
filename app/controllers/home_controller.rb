class HomeController < ApplicationController
  def index
    @entity=Instrument.new
    if params[:names].nil?
      @view_entity = @entity.entities.first
    else
      @entity.params_from_get = params[:names].split('/')
      case @entity.params_from_get.last
        when 'add'
          add_model
        when 'edit'
          edit_model
        else
          @view_entity = @entity.find_entity
      end
    end
  end

  def add_model
    if (params[:entity].nil?)
      @view_entity = @entity.build_add_entity
      render "home/add"
    else
      url_path = @entity.add_entity(params[:entity])
      redirect_to "#{root_url}#{url_path}"
    end
  end

  def edit_model
    if (params[:entity].nil?)
      @view_entity = @entity.find_entity
      render "home/edit"
    else
      url_path=@entity.edit_entity(params[:entity])
      redirect_to "#{root_url}#{url_path}"
    end
  end
end
