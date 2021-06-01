class HomepageController < ApplicationController
  def show
    @existing_decks = Deck.all
  end
end