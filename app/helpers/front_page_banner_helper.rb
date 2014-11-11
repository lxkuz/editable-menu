module FrontPageBannerHelper
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

  def banner_class(banner)
    case banner.name
      when 'top_left', 'center_right', 'bot_right' then 'black'
      when 'top_right', 'center_left' then 'white bottom'
      when 'bot_left' then 'black'
      when 'bot_left_mini' then 'white bottom'
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

end
