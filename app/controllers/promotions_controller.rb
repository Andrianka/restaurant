class PromotionsController < ApplicationController
  def index
    @promotions = Promotion.all
  end

  def show
    @promotion = Promotion.find(params[:id])
  end

  def new
    @promotion = Promotion.new
  end

  def create
    @promotion = Promotion.new(promotion_params)
    if @promotion.save
      redirect_to promotion_path(@promotion)
    else
      render :new
    end
  end

  def update
    @promotion = Promotion.find(params[:id])
    if @promotion.update_attributes(promotion_params)
      redirect_to promotions_path
    else
      render :show
    end
  end

  def destroy
    @promotion = Promotion.find(params[:id])
    if @promotion.destroy
      redirect_to promotions_path
    end
  end

  def change_status
    @promotion = Promotion.find(params[:id])
    @promotion.active == true ? @promotion.update_attributes(active: false) : @promotion.update_attributes(active: true)
    redirect_to :back
  end

  private

  def promotion_params
    params.require(:promotion).permit(:title, :content, :active, :date_from,
    :date_until, :image)
  end
end
