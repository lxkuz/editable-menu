class OfficesController < ResourcesController
  actions :index, :show

  def index
  end

  def show
    @office = Office.find(params[:id])
  end

  protected

  def collection
    # by city
    # @office ||= end_of_association_chain.by_city()
  end
end

