require 'rails_helper'

RSpec.describe Event, type: :model do
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

  it 'Event gets the creator info' do
    expect(test_event.creator).not_to be_nil
  end

  it 'Event gets the attendances from the attendance model' do
    expect(test_event.attendances[0]).not_to be_nil
  end

  it 'Event get the user info through the attendances' do
    expect(test_event.attendances.first.user).not_to be_nil
  end
end
