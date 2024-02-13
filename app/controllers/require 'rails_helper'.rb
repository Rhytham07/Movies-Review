require 'rails_helper'

RSpec.describe MoviesController, type: :controller do

  
  # describe "POST #create" do
  #   context "with valid attributes" do
  #     it "creates a new movie" do
  #       user = FactoryBot.create(:user)
  #       sign_in user

  #       expect {
  #         post :create, params: { movie: FactoryBot.create(:movie) }
  #       }.to change(Movie, :count).by(1)

  #       expect(response).to redirect_to(assigns(:movie))
  #       expect(flash[:notice]).to eq('Movie was successfully created.')
  #     end
  #   end

  #   context "with invalid attributes" do
  #     it "does not create a new movie" do
  #       user = FactoryBot.create(:user)
  #       sign_in user

  #       expect {
  #         post :create, params: { movie: FactoryBot.attributes_for(:movie, title: nil) }
  #       }.to_not change(Movie, :count)

  #       expect(response).to render_template(:new)
  #     end
  #   end
  # end
end
