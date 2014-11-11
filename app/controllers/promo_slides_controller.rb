class PromoSlidesController < ApplicationController

  def destroy
    promo_slide = PromoSlide.find params[:id]
    promo_slide.destroy
    render json: { slider_html: render_to_string('promo_slides/_promo_slider'), notice: 'Слайд удален' }
  end

  def update
    promo_slide = PromoSlide.find params[:id]
    promo_slide.update_attributes build_params
    render json: { slider_html: render_to_string('promo_slides/_promo_slider'), notice: 'Слайд изменен', goto: PromoSlide.all.index(promo_slide) }
  end

  def create
    promo_slide = PromoSlide.create(build_params)
    promo_slide.save
    render json: { slider_html: render_to_string('promo_slides/_promo_slider'), notice: 'Слайд добавлен', goto: PromoSlide.all.index(promo_slide) }
  end

  def index
    # menu = params[:menu]
    # @menu_items = MenuItem.where menu: menu
    # render json: @menu_items.to_json(:include => :children)
  end

  private

  def build_params
    params.require(:promo_slide).permit(:title, :text, :url, :text_italic, :title_italic)
  end
end