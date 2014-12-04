ActiveAdmin.register Office do
  menu priority: 20, label: 'Офисы'
  permit_params :name,
                :postindex,
                :city,
                :phone,
                :active,
                :street_address,
                :manager,
                :description,
                :directions,
                :work_hours,
                :phone_numbers,
                :email,
                :fb_url,
                :vk_url,
                :tw_url,
                :insta_url,
                :rating,
                :total_votes,
                :user_request_recipients,
                :certificate,
                office_slides_attributes: [
                    :id,
                    :image,
                    :_destroy
                ],
                reviews_attributes: [
                    :id,
                    :author,
                    :avatar,
                    :body,
                    :_destroy
                ]

  action_item only: :show do
    link_to('Смотреть на сайте', url_for(resource))
  end

  form(:html => { :multipart => true }) do |f|
    f.inputs 'Контактная информация' do
      f.input :name
      f.input :postindex
      f.input :active, label: 'Активировано'
      f.input :city
      f.input :phone
      f.input :street_address
      f.input :manager, hint: 'например: ИМ Мураховский Сергей Игоревич'
      f.input :description, as: :ckeditor
      f.input :directions, as: :ckeditor
      f.input :work_hours, hint: 'например: Понедельник — Пятница, с 9:00 до 19:00', as: :ckeditor, input_html:{ rows: 3 }
      f.input :phone_numbers, hint: 'например: 8 495 223-04-23 — с 9:00 до 18:00', as: :ckeditor
      f.input :email
      f.input :fb_url
      f.input :vk_url
      f.input :tw_url
      f.input :insta_url
      f.input :rating
      f.input :total_votes, hint: 'Сколько голосов участвовало в формировании рейтинга'
      f.input :certificate, :as => :file, :hint => f.object.certificate.present? \
          ? f.template.image_tag(f.object.certificate.url(:thumb))
          : f.template.content_tag(:span, "Еще не добавлен")
      f.has_many :office_slides, allow_destroy: true do |s|
        s.input :image, :as => :file, :hint => s.object.image.present? \
          ? s.template.image_tag(s.object.image.url(:thumb))
          : f.template.content_tag(:span, "Еще не добавлен")
      end
      f.has_many :reviews, allow_destroy: true do |s|
        s.input :avatar, :as => :file, :hint => s.object.avatar.present? \
          ? s.template.image_tag(s.object.avatar.url(:thumb))
          : f.template.content_tag(:span, "Еще не добавлен")
        s.input :author
        s.input :body, input_html: {rows: 3}

      end
    end

    f.inputs 'Настройки форм' do
      f.input :user_request_recipients, label: 'Получатели заявок (email через запятую)', input_html: { rows: 1 }
    end

    f.actions
  end

  index do
    selectable_column
    column :name
    column :city
    column :postindex
    column :street_address
    column :updated_at
    actions
  end

  member_action :update_in_place, method: :post do
    if request.xhr?
      office = Office.find(params[:id])
      if office.update_attributes(permitted_params[:office])
        render :json => {:url => office_url(office), :notice => 'Данные успешно обновлены'}
      end
    end
  end

end
