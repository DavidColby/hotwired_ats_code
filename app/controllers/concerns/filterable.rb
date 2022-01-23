module Filterable
  def filter!(resource)
    store_filters(resource)
    apply_filters(resource)
  end

  private

  def filter_key(resource)
    "#{resource.to_s.underscore}_filters:#{current_user.id}"
  end

  def store_filters(resource)
    key = filter_key(resource)
    stored_filters = Kredis.hash(key)
    stored_filters.update(**filter_params_for(resource))
  end

  def filter_params_for(resource)
    params.permit(resource::FILTER_PARAMS)
  end

  def apply_filters(resource)
    key = filter_key(resource)
    resource.filter(Kredis.hash(key))
  end
end
