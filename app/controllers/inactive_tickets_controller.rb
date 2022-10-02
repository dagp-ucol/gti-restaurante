class InactiveTicketsController < ApplicationController
  before_action :set_inactive_ticket, only: %i[ show edit update destroy ]

  # GET /inactive_tickets or /inactive_tickets.json
  def index
    @inactive_tickets = InactiveTicket.all
  end

  # GET /inactive_tickets/1 or /inactive_tickets/1.json
  def show
  end

  # GET /inactive_tickets/new
  def new
    @inactive_ticket = InactiveTicket.new
  end

  # GET /inactive_tickets/1/edit
  def edit
  end

  # POST /inactive_tickets or /inactive_tickets.json
  def create
    @inactive_ticket = InactiveTicket.new(inactive_ticket_params)

    respond_to do |format|
      if @inactive_ticket.save
        format.html { redirect_to inactive_ticket_url(@inactive_ticket), notice: "Inactive ticket was successfully created." }
        format.json { render :show, status: :created, location: @inactive_ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @inactive_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /inactive_tickets/1 or /inactive_tickets/1.json
  def update
    respond_to do |format|
      if @inactive_ticket.update(inactive_ticket_params)
        format.html { redirect_to inactive_ticket_url(@inactive_ticket), notice: "Inactive ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @inactive_ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @inactive_ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /inactive_tickets/1 or /inactive_tickets/1.json
  def destroy
    @inactive_ticket.destroy

    respond_to do |format|
      format.html { redirect_to inactive_tickets_url, notice: "Inactive ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_inactive_ticket
      @inactive_ticket = InactiveTicket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def inactive_ticket_params
      params.fetch(:inactive_ticket, {})
    end
end
