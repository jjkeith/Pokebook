class CardsController < ApplicationController
  before_action :authorize

  def index
    @cards = Card.all
  end

  def show
    @card = Card.find(params[:id])
  end

  def new
    @card = Card.new
  end

  def create
    @card = Card.new(card_params)
    @card.user = current_user
    if @card.save
      redirect_to card_path(@card)
    else
      redirect_to new_card_path
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def card_params
    params.require(:card).permit(:title, :card_id, :types, :imageUrl)
  end
end
