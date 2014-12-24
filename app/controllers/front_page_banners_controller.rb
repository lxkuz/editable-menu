class FrontPageBannersController < ApplicationController
  include FrontPageBannerHelper
  def update
    banner = FrontPageBanner.find params[:id]
    banner.update_attributes build_params
    is_bg_banner = banner.name == 'bg'
    partial = is_bg_banner ? 'front_page_banners/bg_banner' : 'front_page_banners/banner'
    render json: { banner_html: render_to_string( partial: partial,locals: { banner: banner}),
                   notice: 'Баннер изменен',
                   insert_to: "#fpb-wrapper-#{banner_postfix(banner)}",
                   is_bg_banner: is_bg_banner
    }
  end


  private

  def build_params
    params.require(:front_page_banner).permit(:image, :title, :price, :url, :valign, :font_size, :font_color)
  end
end