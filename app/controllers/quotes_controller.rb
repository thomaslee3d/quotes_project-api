class QuotesController < class OpenReadController
  before_action :set_quote, only: [:show, :update, :destroy]

  # GET /quotes
  def index
    @quotes = Quote.all

    render json: @quotes
  end

  # GET /quotes/1
  def show
    @quotes = Quote.all
    render json: @quote
  end

  # POST /quotes
  def create

    #my edit
    # @quote = Quote.new(quote_params)

    # example
    # @example = current_user.quotes.build(quote_params)

    # this is my added code
    @quote = current_user.quotes.build(quote_params)

    if @quote.save
      render json: @quote, status: :created, location: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /quotes/1
  def update
    # this is my added code


    # example
    # def set_example
    #     @example = current_user.examples.find(params[:id])
    # end


    # this is my added code
    def set_quote
      @quote = current_user.quote.find(params[:id])
    end

    if @quote.update(quote_params)
      render json: @quote
    else
      render json: @quote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /quotes/1
  def destroy
    @quote.destroy

    def set_quote
      @quote = current_user.quote.find(params[:id])
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def quote_params
      params.require(:quote).permit(:given_name, :quote)
    end
end
