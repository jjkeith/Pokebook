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

  def add
    current_user.add_card(Card.find(params[:id]))
    redirect_to user_path(current_user)
  end

  def destroy
    current_user.destroy_card(Card.find(params[:id]))
    redirect_to user_path(current_user)
  end

# This only exists so I can enter new cards without seeding, but it doesn't work
  def create
    @card = Card.new(card_params)
    @card.users = current_user
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

  private
  def card_params
    params.require(:card).permit(:title, :card_id, :types, :imageUrl)
  end
end
