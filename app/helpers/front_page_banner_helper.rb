module FrontPageBannerHelper
  def banner_conf banner
    "font-size:#{banner.font_size.present? ? banner.font_size : 40}px;
     color: #{banner.font_color.present? ? banner.font_color : '#000000'};
     vertical-align:#{banner.valign.present? ? banner.valign : 'top'};"
  end
  def banner_size(banner)
    case banner.name
      when 'top_left', 'center_right', 'bot_right' then '300x700'
      when 'top_right', 'center_left' then '700x300'
      when 'bot_left' then '700x400'
      when 'bot_left_mini' then '400x300'
    end
  end

  def link_class(banner)
    case banner.name
      when 'top_left', 'center_right', 'bot_right' then 'h-7'
      when 'bot_left_mini', 'top_right', 'center_left' then 'h-3'
      when 'bot_left' then 'h-4'
    end
  end


  def banner_postfix banner
    case banner.name
      when 'bot_right' then 'br'
      when 'center_right' then 'cr'
      when 'top_left' then 'tl'
      when 'center_left' then 'cl'
      when 'top_right' then 'tr'
      when 'bot_left' then 'bl'
      when 'bot_left_mini' then 'blm'
      when 'bg' then 'bg'
    end
  end

  def banner_version banner
    case banner.name
      when 'top_left', 'center_right', 'bot_right' then 'banner3x7'
      when 'top_right', 'center_left' then 'banner7x3'
      when 'bot_left' then 'banner7x4'
      when 'bot_left_mini' then 'banner4x3'
    end
  end

  def caption_class(banner)
    str_class = ''
    str_class << 'white ' if banner.font_color == 'rgb(255, 255, 255)' || banner.font_color == '#ffffff'
    str_class << banner.valign if banner.valign.present?
    str_class
  end

end
