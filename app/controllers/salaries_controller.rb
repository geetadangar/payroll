class SalariesController < ApplicationController

  def index
    @salary = Salary.all
  end

  def show
    @salary = Salary.find_by_id(params[:id])
  end

end