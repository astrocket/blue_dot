class WorldsController < ApplicationController

  before_action :set_world, only: [:show]

  def index
  end

  def new
  end

  def show
  end

  private

  def set_world
    @world = World.find_by(url_suffix: params[:url_suffix])
  end
end
