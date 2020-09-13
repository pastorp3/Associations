require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  it 'Checks for the user index route' do
    get :index
    expect(response).to render_template('sign_in')
  end

  it 'Checks for new user route' do
    get :new
    expect(response).to render_template('new')
  end

  it 'Checks for the show user route' do
    test_user = User.create(name: 'Mateo', email: 'mateo@test.com')
    get :show, params: { id: test_user.id }
    expect(response).to render_template('users/show')
  end
end