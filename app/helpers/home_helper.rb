module HomeHelper
  def resource_name
    :user
  end

  def resource
    begin
      @resource ||= User.new
    rescue ActionView::TemplateError
      Rails.logger.info('Could not create resource for devise partial')
    end
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end
end
