# frozen_string_literal: true

# Controller for Attendances
class AttendancesController < ApplicationController
  before_action :require_admin, except: [:create]
  before_action :set_variables, only: [:create]

  def show
    @attendance = Attendance.find(params[:id])
  end

  def index
    @attendances = Attendance.all
  end

  def new
    @attendance = Attendance.new
  end

  def create
    # --------------- Check-in ---------------
    check_in if params[:commit] == 'Check-in'

    # --------------- Check-out ---------------
    checkout if params[:commit] == 'Check-out'
  end

  private

  # --------------- helpers ---------------
  def set_variables
    # Where return an array of objects, so we save the first one and thus the only one object because we have only allow to have just check_in per day
    @already_check_in = employee_today_attendance(Attendance.today_attendances)
    @attendance = Attendance.new(params.require(:attendance).permit(:employee_id, :store_id))
    @employee = Employee.find_by(id: @attendance.employee_id)
  end

  def employee_today_attendance(arr_records)
    arr_records.find { |record| record.employee_id == params[:attendance][:employee_id].to_i }
  end

  def employee_nil_or_wrong_private_number
    return 'Employee not found' if @employee.nil? || @employee.working == false

    if @employee.private_number != params[:attendance][:private_number].to_i
      'Wrong priva
      te number'
    end
  end

  # --------------- Check-in ---------------
  def check_in
    flash[:alert] = employee_nil_or_wrong_private_number || check_in_already
    flash[:notice] = check_in_register if flash[:alert].nil?
    redirect_to root_path
  end

  def check_in_already
    "You already checked in at -> '#{@already_check_in.check_in.to_s(:long)}'" if @already_check_in
  end

  def check_in_register
    "✅ Check-in register at '#{DateTime.now.to_s(:long)}'" if @attendance.save
  end

  # --------------- Check-out ---------------
  def checkout
    flash[:alert] = employee_nil_or_wrong_private_number || first_check_in_or_check_out_already
    flash[:notice] = check_out_register if flash[:alert].nil?
    redirect_to root_path
  end

  def first_check_in_or_check_out_already
    return 'You first need to check-in' if @already_check_in.nil?

    'Your assistant was already recorded' if @already_check_in.check_out
  end

  def check_out_register
    flash_notice_msg = "✅ Check-out register at '#{DateTime.now.to_s(:long)}'"
    flash_notice_msg if @already_check_in.update_columns(check_out: DateTime.now.to_s(:db))
  end
end
