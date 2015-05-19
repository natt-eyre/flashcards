class CardsController < ApplicationController
  before_filter :authenticate, :find_deck

  def show
    @card = find_card(@deck)
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
    @card = find_card(@deck)
    @card.destroy
    redirect_to @deck
  end

  def edit
    @card = find_card(@deck)
  end

  def update
    @card = find_card(@deck)
    @card.update_attributes(params[:card])
    redirect_to @deck
  end

  private

  def find_deck
    @deck = current_user.decks.find(params[:deck_id])
  end

  def find_card(deck)
    deck.cards.find(params[:id])
  end

end
