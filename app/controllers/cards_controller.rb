class CardsController < ApplicationController
  before_action :authorize


  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new(params[:id])
  end

  def add
    current_user.add_card(Card.find(params[:id]))
    redirect_to user_path(current_user)
  end

  def destroy
    current_user.destroy_card(Card.find(params[:id]))
    redirect_to user_path(current_user)
  end

  def create
    @card = Card.new(card_params)
    if @card.save
      redirect_to '/cards/'
    else
      redirect_to error_path
    end
  end

  def edit
  end

  def update
    # @card = Card.new
    # if @card.update_attributes(card_params)
    #   redirect_to card_path(@card)
    # else
    #   redirect_to error_path
    # end
  end

  private
  def card_params
    params.require(:card).permit(:name, :imageUrl)
  end
end
