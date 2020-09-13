require 'rails_helper'

RSpec.describe AccessControlController, type: :controller do
  test_user = User.create(name: 'Mateo', email: 'mateo@test.com')
  test_event = Event.new
  test_event.title = 'test event 1'
  test_event.body = '1 from the test database'
  test_event.location = 'microverse'
  test_event.date = '2020-09-10'
  test_event.creator_id = test_user.id
  test_event.save

  it 'checks for the creation of a session with a valid user' do
    post :sign_in, params: { user: { name: test_user.name }}
    expect(response).to redirect_to('/events')
  end

  it 'checks redirection from a invalid user' do
    post :sign_in, params: { user: { name: nil }}
    expect(response).to redirect_to('/users')
  end

  it 'Checks the logout functionality' do
    get :log_out
    expect(response).to redirect_to('/users')
  end

  it 'SUCCESS CASE - Checks the attend link' do
    get :attend, params: { id: test_event.id }, session: { user_id: test_user.id }
    expect(response).to redirect_to('/events')
  end

  it 'FAIL CASE - checks the attend link' do
    get :attend, params: { id: test_event.id }, session: { user_id: nil }
    expect(response).to have_http_status(302)
  end
end