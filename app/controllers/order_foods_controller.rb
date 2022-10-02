class OrderFoodsController < ApplicationController
  before_action :set_order_food, only: %i[ show edit update destroy ]

  # GET /order_foods or /order_foods.json
  def index
    @order_foods = OrderFood.all
  end

  # GET /order_foods/1 or /order_foods/1.json
  def show
  end

  # GET /order_foods/new
  def new
    @order_food = OrderFood.new
  end

  # GET /order_foods/1/edit
  def edit
  end

  # POST /order_foods or /order_foods.json
  def create
    @order_food = OrderFood.new(order_food_params)

    respond_to do |format|
      if @order_food.save
        format.html { redirect_to order_food_url(@order_food), notice: "Order food was successfully created." }
        format.json { render :show, status: :created, location: @order_food }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @order_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /order_foods/1 or /order_foods/1.json
  def update
    respond_to do |format|
      if @order_food.update(order_food_params)
        format.html { redirect_to order_food_url(@order_food), notice: "Order food was successfully updated." }
        format.json { render :show, status: :ok, location: @order_food }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @order_food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /order_foods/1 or /order_foods/1.json
  def destroy
    @order_food.destroy

    respond_to do |format|
      format.html { redirect_to order_foods_url, notice: "Order food was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_order_food
      @order_food = OrderFood.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def order_food_params
      params.require(:order_food).permit(:food_id, :ticket_id)
    end
end
