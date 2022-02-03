class Api::V1::PropertiesController < ApiController
  before_action :oauth_authorize, except: [:index]
  skip_after_action :verify_authorized, only: [:index]

  def index
    titles_found = titles
    head 404 unless titles_found.present?

    render json: { titles: titles_found, meta: meta}, status: 200
  end

  private
  def client
    @client ||= EasyBroker.client
  end
  def properties
    @properties ||= client.properties.search(query: { page: page, limit: limit })
  end

  def titles
    return unless properties.present?
    titles_found = []
    properties.map do |property|
      titles_found << property.title
    end

    titles_found
  end

  def page
    params[:page] || 1
  end

  def limit
    params[:limit] || 20
  end

  def meta
    {
      page: properties.page,
      total: properties.total
    }
  end
end
