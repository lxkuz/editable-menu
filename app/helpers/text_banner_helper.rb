module TextBannerHelper
  def text_banner_specific_size(banner)
    case banner.name
      when 't' then '300x300'
      when 'bl' then '400x300'
      when 'br' then '300x400'
      when 'cl','cr' then '500x400'
    end
  end

  def text_banner_specific_link_class(banner)
    case banner.name
      when 't' then 'h-3'
      when 'cl', 'cr' then 'h-4'
      when 'bl' then 'h-3 cell-hits'
      when 'br' then 'cell-credit h-4'
    end
  end

  def text_banner_specific_bg(banner)
    if banner.image.present?
      case banner.name
        when 't' then "background: url(#{banner.image.url(:banner3x3)})"
        when 'bl' then "background: url(#{banner.image.url(:banner4x3)})"
        when 'br' then "background: url(#{banner.image.url(:banner3x4)})"
        when 'cl','cr' then "background: url(#{banner.image.url(:banner5x4)})"
      end
    else
      "background: #{banner.bg || '#cccccc'};"
    end
  end

  def text_banner_specific_v_align(banner)
    if !banner.v_align.present? || banner.v_align == 'middle'
      "vertical-align: middle;"
    else
      "vertical-align: #{banner.v_align};"
    end
  end
end
