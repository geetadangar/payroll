class EmployeesController < ApplicationController
  before_action :set_employee, only: [:edit, :update, :destroy]
  before_action :set_company, only: [:index, :edit, :update, :destroy]

  def index
   @employees = @company.employees
  end

  def new
	  @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    respond_to do |format|
      if @employee.save
        format.html { redirect_to company_employees_path(params[:company_id]), notice: 'employee was successfully created.' }
        format.json { render :show, status: :created, location: @employee }
      else
        format.html { render :new }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

	def edit
    @employee = Employee.find(params[:id])
  end

  def update
    respond_to do |format|
      if @employee.update(employee_params)
        format.html { redirect_to company_employees_path(params[:company_id]), notice: 'employee was successfully updated.' }
        format.json { render :show, status: :ok, location: @employee }
      else
        format.html { render :edit }
        format.json { render json: @employee.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @employee.destroy
    respond_to do |format|
      format.html { redirect_to company_employees_path(params[:company_id]), notice: 'employee was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def send_email
    @employee = Employee.find(params[:id])
    @email =  @employee.email
    EmployeeMailer.send_pdf_email(@employee,@email).deliver_now!
  end

  private

    def set_company
      @company = Company.find_by_id(params[:company_id])
    end

    def set_employee
      @employee = Employee.find(params[:id])
    end

    def employee_params
       params.permit(:name, :designation, :department, :PAN, :PF, :company_id, :email)
    end
end