ActiveAdmin.register_page "Settings" do
  menu priority: 10, label: "Настройки"
  content do

    form :action => admin_settings_update_path, :method => :post do |f|
      f.input :name => 'authenticity_token', :type => :hidden, :value => form_authenticity_token.to_s
      panel "Мета теги главной страницы" do
        fieldset do
          ol do
            li do
              label 'Meta title'
              f.input :name => "data[home_page_meta_title]", :type => 'text', :value => Settings.home_page_meta_title
            end
            li do
              label 'Meta description'
              f.textarea :name => "data[home_page_meta_description]" do
                Settings.home_page_meta_description
              end
              end
            li do
              label 'Keywords'
              f.textarea :name => "data[home_page_keywords]" do
                Settings.home_page_keywords
              end
            end
          end
        end
      end
      panel "Настройки сайта" do
        fieldset do
          ol do
            li do
              label 'Всего лестниц продано'
              f.input :name => "data[total_stairs_sold]", :value => Settings.total_stairs_sold
            end
            li do
              label 'Основной телефон'
              f.input :name => "data[main_phone]", :value => Settings.main_phone
            end
          end
        end
      end

      panel "Форма дилеров" do
        fieldset do
          ol do
            li do
              label 'Заголовок'
              f.input :name => "data[dealers_form_title]", :type => 'text', :value => Settings.dealers_form_title
            end
            li do
              label 'Подзаголовок'
              f.input :name => "data[dealers_form_subtitle]", :type => 'text', :value => Settings.dealers_form_subtitle
            end
            li do
              label 'Keywords'
              f.textarea :name => "data[dealers_form_keywords]" do
                Settings.dealers_form_keywords
              end
            end
          end
        end
      end

      panel "О компании" do
        fieldset do
          ol do
            li do
              label 'Заголовок'
              f.input :name => "data[about_title]", :type => 'text', :value => Settings.about_title
            end
            li do
              label 'Подзаголовок'
              f.input :name => "data[about_subtitle]", :type => 'text', :value => Settings.about_subtitle
            end
            li do
              label 'Keywords'
              f.textarea :name => "data[about_keywords]" do
                Settings.about_keywords
              end
            end
          end
        end
      end

      panel "О лестницах" do
        fieldset do
          ol do
            li do
              label 'Заголовок'
              f.input :name => "data[articles_title]", :type => 'text', :value => Settings.articles_title
            end
            li do
              label 'Подзаголовок'
              f.input :name => "data[articles_subtitle]", :type => 'text', :value => Settings.articles_subtitle
            end
            li do
              label 'Keywords'
              f.textarea :name => "data[articles_keywords]" do
                Settings.articles_keywords
              end
            end
          end
        end
      end


      f.input :type => 'submit', :value => 'Add'
    end
  end

  page_action :update, :method => :post do
    params['data'].each do |k, v|
      Settings[k] = v
    end
    redirect_to :back, :notice => "Сохранено"
  end

  page_action :update_in_place, method: :post do
    if request.xhr?
      params['class'].each do |k, v|
        Settings[k] = v
      end
      render :json => {:url => request.env['HTTP_REFERER'], :notice => 'Данные успешно обновлены'}
    end
  end
end
