require 'rails_helper'

RSpec.describe 'Affirmation', driver: :selenium_chrome, js: true, type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'enables me to create affirmations' do
    visit '/'
    fill_in 'affirmation[affirmation]', with: 'This is a test affirmation'
    click_button 'Create'

    expect(page).to have_text('Your affirmation has been created! How about another one?')
  end
end