require 'rails_helper'

RSpec.describe Developer, type: :model do

  it 'creates a uuid before create' do
    d = Developer.create!(phone_number: '0984737424')
    expect(d.uuid).to_not be_nil
  end
end

