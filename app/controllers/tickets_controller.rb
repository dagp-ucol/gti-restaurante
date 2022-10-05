class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]

  # GET /tickets or /tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /tickets/1 or /tickets/1.json
  def show
    @orders = OrderFood.where(ticket_id: params[:id])
  end

  # GET /tickets/new
  def new
    @ticket = Ticket.new
    @food = Food.all
  end

  # GET /tickets/1/edit
  def edit
    @foods = Food.all
  end

  # POST /tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /tickets/1 or /tickets/1.json
  def update

    # byebug

    OrderFood.create(food_id: params[:dish], ticket_id: params[:id])
    update_final_price
    redirect_to ticket_url(params[:id]), notice: "Ticket was successfully updated."

    # respond_to do |format|
    #   if @ticket.update(ticket_params)
    #     format.html { redirect_to ticket_url(@ticket), notice: "Ticket was successfully updated." }
    #     format.json { render :show, status: :ok, location: @ticket }
    #   else
    #     format.html { render :edit, status: :unprocessable_entity }
    #     format.json { render json: @ticket.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  # DELETE /tickets/1 or /tickets/1.json
  def destroy

    if params[:dish]
      OrderFood.find(params[:dish]).destroy
      update_final_price
      redirect_to ticket_url(params[:id]), notice: "Dish was successfully removed."
    else
      respond_to do |format|
        format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
        format.json { head :no_content }
      end
    end

    # @ticket.destroy

    # respond_to do |format|
    #   format.html { redirect_to tickets_url, notice: "Ticket was successfully destroyed." }
    #   format.json { head :no_content }
    # end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ticket
      @ticket = Ticket.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ticket_params
      params.require(:ticket).permit(:table, :final_price)
    end

    def update_final_price
      @final_price = OrderFood.where(ticket_id: params[:id])
      @fp = 0
      @final_price.each do |price|
        @food = Food.find(price.food_id)
        @fp += @food.price
      end
      @lticket = Ticket.find(params[:id])
      @lticket.final_price = @fp
      @lticket.save
    end

end
