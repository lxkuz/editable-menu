class FrontPageBannersController < ApplicationController
  include FrontPageBannerHelper
  def update
    banner = FrontPageBanner.find params[:id]
    banner.update_attributes build_params
    render json: { banner_html: render_to_string( partial: 'front_page_banners/banner',locals: { banner: banner}),
                   notice: 'Баннер изменен',
                   insert_to: "#fpb-wrapper-#{banner_postfix(banner)}"
    }
  end


  private

  def build_params
    params.require(:front_page_banner).permit(:image, :title, :price, :url)
  end
end