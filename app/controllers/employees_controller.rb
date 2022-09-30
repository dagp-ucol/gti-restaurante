# frozen_string_literal: true

class EmployeesController < ApplicationController
  before_action :require_admin
  before_action :set_employee, only: %i[show edit update destroy]

  def show; end

  def index
    @employees = Employee.all
  end

  def new
    @employee = Employee.new
  end

  def create
    @employee = Employee.new(employee_params)
    if @employee.save
      redirect_to @employee
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @employee.update(employee_params)
      redirect_to @employee
    else
      render 'edit'
    end
  end

  def destroy
    @employee.destroy

    redirect_to @employee
  end

  private

  def set_employee
    @employee = Employee.find(params[:id])
  end

  def employee_params
    params.require(:employee).permit(:first_name, :last_name, :email, :position, :working,
                                     :store_id)
  end
end
