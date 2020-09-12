require 'rails_helper'

RSpec.describe User, type: :model do
  it 'User gets the attendances' do
    expect(User.first.attendances[0]).not_to eq(nil)
  end

  it 'User gets the event info through attendances' do
    expect(User.first.attendances.first.event).not_to eq(nil)
  end

  it 'User gets the info of its created events' do
    expect(User.first.own_events[0]).not_to eq(nil)
  end

  it 'User gets the info of the attending events' do
    expect(User.first.events[0]).not_to eq(nil)
  end
end
