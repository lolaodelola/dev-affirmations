require 'rails_helper'

RSpec.describe 'Affirmation', type: :system do

  it 'enables me to create affirmations' do
    visit '/'
    fill_in 'affirmation[affirmation]', with: 'This is a test affirmation'
    click_button 'Create'

    expect(page).to have_text('Your affirmation has been created! How about another one?')
  end
end