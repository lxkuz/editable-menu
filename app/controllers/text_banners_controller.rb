class TextBannersController < ApplicationController
  include FrontPageBannerHelper
  def update
    banner = TextBanner.find params[:id]
    banner.update_attributes build_params
    render json: { banner_html: render_to_string( partial: 'text_banners/banner',locals: { banner: banner}),
                   notice: 'Баннер изменен',
                   insert_to: "#tb-wrapper-#{banner.name}"
    }
  end


  private

  def build_params
    params[:text_banner][:remove_image] = 1 if params[:text_banner][:bg].present? && !params[:text_banner].has_key?(:image)
    params.require(:text_banner).permit(:image, :body, :bg, :url, :all_block_url, :v_align, :remove_image)
  end
end