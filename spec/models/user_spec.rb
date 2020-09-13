require 'rails_helper'

RSpec.describe User, type: :model do
  test_user = User.create(name: 'Mateo', email: 'mateo@test.com')
  test_event = Event.new
  test_event.title = 'test event 1'
  test_event.body = '1 from the test database'
  test_event.location = 'microverse'
  test_event.date = '2020-09-10'
  test_event.creator_id = test_user.id
  test_event.save
  test_a = Attendance.new
  test_a.user_id = test_user.id
  test_a.event_id = test_event.id
  test_a.save

  it 'Checks for user creation into the data base' do
    expect(test_user).to be_valid
  end

  it 'User gets the attendances' do
    expect(test_user.attendances[0]).not_to be_nil
  end

  it 'User gets the event info through attendances' do
    expect(test_user.attendances.first.event).not_to be_nil
  end

  it 'User gets the info of its created events' do
    expect(test_user.own_events[0]).to be_valid
  end

  it 'User gets the info of the attending events' do
    expect(test_user.events[0]).not_to be_nil
  end
end
