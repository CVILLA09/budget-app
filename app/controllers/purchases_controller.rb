class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_purchase, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new edit]

  # GET /categories/:category_id/purchases/new
  def new
    @category = Category.find(params[:category_id])
    @purchase = @category.purchases.build
  end

  # POST /categories/:category_id/purchases
  def create
    begin
      @category = Category.find(params[:category_id])
    rescue ActiveRecord::RecordNotFound
      redirect_to categories_path, alert: 'Category not found.'
      return
    end

    @purchase = @category.purchases.build(purchase_params.merge(author: current_user))

    if @purchase.save
      redirect_to category_path(@category), notice: 'Purchase was successfully created.'
    else
      set_categories
      render :new
    end
  end

  # GET /purchases/1
  def show; end

  # GET /purchases/1/edit
  def edit; end

  # PATCH/PUT /purchases/1
  def update
    if @purchase.update(purchase_params)
      redirect_to purchase_path(@purchase), notice: 'Purchase was successfully updated.'
    else
      set_categories
      render :edit
    end
  end

  # DELETE /purchases/1
  def destroy
    @purchase.destroy
    redirect_to categories_url, notice: 'Purchase was successfully destroyed.'
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_purchase
    @purchase = Purchase.find(params[:id])
  end

  def set_categories
    @categories = current_user.categories
  end

  # Only allow a list of trusted parameters through.
  def purchase_params
    params.require(:purchase).permit(:name, :amount, :category_id)
  end
end
