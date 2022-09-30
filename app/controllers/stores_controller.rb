# frozen_string_literal: true

class StoresController < ApplicationController
  before_action :require_admin
  before_action :set_store,
                only: %i[show edit update destroy reports reports_att_by_day reports_att_by_day_date reports_abs_by_month
                         reports_abs_by_month_date reports_avg_time_by_month reports_avg_time_by_month_date]

  def show; end

  def index
    @stores = Store.all
  end

  def new
    @store = Store.new
  end

  def create
    @store = Store.new(store_params)
    if @store.save
      redirect_to @store
    else
      render 'new'
    end
  end

  def edit; end

  def update
    if @store.update(store_params)
      redirect_to @store
    else
      render 'edit'
    end
  end

  def destroy
    @store.destroy
    redirect_to stores_path
  end

  def reports; end

  def reports_att_by_day; end

  def reports_att_by_day_date
    date = params[:check_out].to_date
    date ? @reports = Attendance.where(check_out: date.all_day) : report_empty(:attendance)
  end

  def reports_abs_by_month; end

  def reports_abs_by_month_date
    return report_empty(:absence) if params[:month] == ''

    set_variables_for_reports
  end

  def reports_avg_time_by_month; end

  def reports_avg_time_by_month_date
    return report_empty(:average) if params[:month] == ''

    set_variables_for_reports
  end

  private

  def set_store
    @store = Store.find(params[:id])
  end

  def store_params
    params.require(:store).permit(:name, :address)
  end

  def report_empty(type)
    flash[:alert] = 'Please select a date'
    return redirect_to store_reports_att_by_day_path if type == :attendance

    return redirect_to store_reports_abs_by_month_path if type == :absence

    redirect_to store_reports_avg_time_by_month_path if type == :average
  end

  def set_variables_for_reports
    date = "#{params[:month]}-01".to_date
    start_day = date
    end_day = date.end_of_month
    @working_days = start_day.business_days_until(end_day)
    @store_employees = @store.employees
    @attendance_by_month = Attendance.where(check_out: date.all_month)
  end
end
