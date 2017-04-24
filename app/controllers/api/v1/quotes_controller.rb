module Api::V1
  class QuotesController < ApiController

    def index
      respond_to do |format|
        format.json {render json: Quote.all}
      end
    end

  end
end