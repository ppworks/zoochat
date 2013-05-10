require 'spec_helper'

describe ChatsController do
  let(:room) { FactoryGirl.create(:room1) } 
  let(:chat) { FactoryGirl.create(:chat, room_id: room.id) } 
  let(:user) { FactoryGirl.create(:user) }
  
  subject { response }
  describe "get 'index'" do
    before do
      sign_in user
      get :index, room_id: room.id
    end
    it { should be_success }
  end

  describe "get 'show'" do
    before do
      sign_in user
      get :show, room_id: room.id, id: chat.id
    end
    it { should be_success }
  end

  describe "post 'create'" do
    let(:color) { '#333333' }
    let(:user_name) { 'test' }
    let(:content) { 'test' }
    before do
      sign_in user
      post :create, room_id: room.id, user_name: user_name, color: color, content: content
    end
    it { should redirect_to room_chats_path(room) }
  end
end
