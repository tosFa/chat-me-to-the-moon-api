
module Pagination
  protected

  def paginate(*options_or_collection)
    options    = options_or_collection.extract_options!
    collection = options_or_collection.first

    return _paginate_collection(collection, options) if collection

    collection = options[:json] || options[:xml]
    collection = _paginate_collection(collection, options)

    options[:json] = collection if options[:json]
    options[:xml]  = collection if options[:xml]

    render options
  end

  def paginate_with(collection)
    respond_with _paginate_collection(collection)
  end

  private

  def _paginate_collection(collection, options={})
    options[:page] = ApiPagination.config.page_param(params)
    options[:per_page] ||= ApiPagination.config.per_page_param(params)

    collection = ApiPagination.paginate(collection, options)
    {
      data: collection,
      pagination: {
        per_page: options[:per_page].to_i,
        page: options[:page].to_i || 1,
        total_count: total_count(collection, options).to_i,
        total_pages: (total_count(collection, options).to_i/options[:per_page].to_i).ceil.to_i
      }
    }
  end

  def total_count(collection, options)
    total_count = if ApiPagination.config.paginator == :kaminari
      paginate_array_options = options[:paginate_array_options]
      paginate_array_options[:total_count] if paginate_array_options
    end
    total_count || ApiPagination.total_from(collection)
  end
end
