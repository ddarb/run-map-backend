class Api::V1::RouteController < ApplicationController
  def index
  end

  def show
  end

  def status
    render json: {"status" => "ok"}
  end
end
