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
      f.input :type => 'submit', :value => 'Add'
    end
  end

  page_action :update, :method => :post do
    params['data'].each do |k, v|
      Settings[k] = v
    end
    redirect_to :back, :notice => "Сохранено"
  end
end