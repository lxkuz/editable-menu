class DealerRequestsController < ApplicationController
  def create
    @dealer_request = DealerRequest.new(dealer_request_params)
    @dealer_request.save
    render json: {text: :ok}
  end

  private

  def dealer_request_params
    params.require(:dealer_request).permit(:name, :email, :phone, :file_attachment, :city, :description)
  end
end
