ActiveAdmin.register_page 'Dashboard' do

  menu priority: 1, label: proc { I18n.t('active_admin.dashboard') }

  action_item do
    link_to 'New Product', '/products/new'
  end

  content title: proc { I18n.t('active_admin.dashboard') } do
    div class: :blank_slate_container, id: :dashboard_default_message do
      span class: 'blank_slate' do
        span I18n.t :title
      end
    end


    columns do
      column do
        panel 'Products' do
          if Product.count > 0
            table do
              tr do
                th :id
                th :name
                th :price
                th :city
                th :region
                th :manufacturer
                th :actions
              end
              Product.last(10).map do |product|
                tr do
                  td product.id
                  td product.name
                  td product.price
                  td product.city.name
                  td do
                   product.region.name if product.region
                  end
                  td do
                    product.manufactur.name if product.manufactur
                  end
                  td do
                    span link_to 'Edit', edit_product_path(product)
                    span link_to 'Show', product_path(product)
                  end
                end
              end
            end
          else
            span 'None products'
          end
        end
      end
    end

  end # content
end
