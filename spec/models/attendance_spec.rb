require 'rails_helper'

RSpec.describe Attendance, type: :model do
  test_user = User.create(name: 'Mateo', email: 'mateo@test.com')
  test_event = Event.new
  test_event.title = 'test event 1'
  test_event.body = '1 from the test database'
  test_event.location = 'microverse'
  test_event.date = '2020-09-10'
  test_event.creator_id = test_user.id
  test_event.save

  it 'FAIL CHECK - Checks if the attendance can be created' do
    test_a = Attendance.create(user_id: 0, event_id: 0)
    expect(test_a).to be_invalid
  end

  it 'SUCCESS CHECK - Checks if the attendance can be created' do
    test_a = Attendance.create(user_id: test_user.id, event_id: test_event.id)
    expect(test_a).to be_valid
  end
end
