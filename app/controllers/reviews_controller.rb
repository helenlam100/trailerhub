class ReviewsController < ApplicationController
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_filter :authenticate_user!, :except => [:index, :show]
  before_action :authorize_user, only: [:edit, :update, :destroy]

  def index
    @reviews = Review.all
  end

  def show

  end

  def new
    @review = current_user.reviews.build
  end

  def edit

  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.save
    render json: @review
  end




    private
      # Use callbacks to share common setup or constraints between actions.
    def set_review
      @review = Review.find(params[:id])
    end

      # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.permit(:title, :review, :trailer_id)
    end

    def authorize_user
      @review = current_user.reviews.find_by(id: params[:id])
      redirect_to reviews_path, notice: "Not authorized to edit this review" if @review.nil?
    end

end
