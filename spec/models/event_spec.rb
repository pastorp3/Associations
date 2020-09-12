require 'rails_helper'

RSpec.describe Event, type: :model do
  it 'Event gets the creator info' do
    expect(Event.first.creator).not_to eq(nil)
  end

  it 'Event gets the attendances from the attendance model' do
    expect(Event.first.attendances[0]).not_to eq(nil)
  end

  it 'Event get the user info through the attendances' do
    expect(Event.first.attendances.first.user).not_to eq(nil)
  end
end
