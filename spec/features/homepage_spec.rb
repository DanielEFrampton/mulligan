require 'rails_helper'

RSpec.describe 'homepage' do
  context 'when I visit the homepage' do
    before do
      visit '/'
    end

    it 'I see the name of the app' do
      expect(page).to have_content('Mulligan')
    end
  end
end