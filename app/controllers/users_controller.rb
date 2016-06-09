class UsersController < ApplicationController
  protect_from_forgery
  before_action :authorize, only: [:show]
  before_action :set_user, only: [ :cards, :add, :show, :edit, :update, :destroy]

  def show
  end

  def cards
  end

  def new
    @user = User.new
    
  end

  def add
  end

  def add_card
    # current_user.cards << Card.find(params[:card_id])
    # redirect_to current_user
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to user_path(@user)
    else
      redirect_to root_path
    end
  end

  def edit
    if current_user != @user
      redirect_to root_path
    end
  end

  def update
    if @user.update_attributes(user_params)
      redirect_to user_path(current_user)
    else
      redirect_to edit_user(current_user)
    end
  end

  def destroy
    if current_user != @user
      redirect_to root_path
    else
      redirect_to logout_oath
      @user.destroy
    end
  end

private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :avatar)
  end
end
