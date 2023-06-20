class Api::V1::RouteController < ApplicationController

  def index
  end

  def show
  end

  def status
    render json: {"status" => "ok"}
  end

  def calc
    calc = RouteCalc.new(calc_params)

    if calc.invalid?
      return render json: {:errors => calc.errors.full_messages}, status: 400
    end
    render json: calc.perform_calc, status: 200
    
  end

  private
    def calc_params
      params.permit(:from, :to)
    end
end
