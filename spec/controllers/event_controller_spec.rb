require 'rails_helper'

RSpec.describe EventsController, type: :controller do
  test_user = User.create(name: 'Mateo', email: 'mateo@test.com')
  test_event = Event.new
  test_event.title = 'test event 1'
  test_event.body = '1 from the test database'
  test_event.location = 'microverse'
  test_event.date = '2020-09-10'
  test_event.creator_id = test_user.id
  test_event.save

  it 'Checks for the event index route with no user session set' do
    get :index, session: { username: nil, user_id: nil }
    expect(response).to redirect_to('/users')
  end

  it 'Checks for the event index route with user authentication set' do
    get :index, session: { username: test_user.name, user_id: test_user.id }
    expect(response).to render_template('events/index')
  end

  it 'Checks for the creation page of an event' do
    get :new, session: { username: test_user.name, user_id: test_user.id }
    expect(response).to render_template('events/new')
  end

  it 'Checks for the show page of an event' do
    get :show, params: { id: test_event.id }, session: { username: test_user.name, user_id: test_user.id }
    expect(response).to render_template('events/show')
  end
end
