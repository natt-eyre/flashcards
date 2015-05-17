class CardsController < ApplicationController
  before_filter :find_deck

  def show
    @card = @deck.cards.find(params[:id])
  end

  def new
    @card = @deck.cards.new
  end

  def create
    @card = @deck.cards.new(params[:card])
    @card.save!
    redirect_to @deck
  end

  def destroy
    @card = @deck.cards.find(params[:id])
    @card.delete
    redirect_to @deck
  end

  def edit
    @card = @deck.cards.find(params[:id])
  end

  def update
    @card = @deck.cards.find(params[:id])
    @card.update_attributes(params[:card])
    redirect_to @deck
  end

  private

  def find_deck
    @deck = Deck.find(params[:deck_id])
  end

end
