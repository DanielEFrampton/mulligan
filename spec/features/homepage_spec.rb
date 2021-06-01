require 'rails_helper'

RSpec.describe 'homepage' do
  context 'when I visit the homepage' do
    before do
      visit '/'
    end

    it 'I see the name of the app' do
      expect(page).to have_content('Mulligan')
    end

    it 'I see a dropdown menu of existing decks and button to load one' do
      expect(page).to have_select('Deck')
      expect(page).to have_button('Load Deck')
    end

    describe 'when I select a deck and click the load button' do
      before do
        select 'Poker Deck', from: 'Deck'
        click_button 'Load Deck'
      end

      it 'I am taken to the details page for that deck' do
        expect(current_path).to eq '/decks/1'
      end
    end
  end
end