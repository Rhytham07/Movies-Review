require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
    binding.pry
  let(:user) { create(:user) }
  let(:movie) { create(:movie) }
  let(:review) { create(:review, movie: movie) }

  #before { sign_in user }

  describe 'POST #create' do

    #context 'when user does not own the movie' do
      it 'creates a new review' do
  binding.pry
        post :create, params: { movie_id: movie.id, review: attributes_for(:review) }
        expect(Review.count).to eq(1)
      end

      it 'redirects to the movie page with success notice' do
        post :create, params: { movie_id: movie.id, review: attributes_for(:review) }
        expect(response).to redirect_to(movie)
        expect(flash[:notice]).to eq('Review was successfully created.')
      #end
    end

    context 'when user owns the movie' do
      before { movie.update(user: user) }

      it 'does not create a new review' do
        post :create, params: { movie_id: movie.id, review: attributes_for(:review) }
        expect(Review.count).to eq(0)
      end

      it 'redirects to the movie page with alert message' do
        post :create, params: { movie_id: movie.id, review: attributes_for(:review) }
        expect(response).to redirect_to(movie)
        expect(flash[:alert]).to eq('You cannot give a review for your own movie.')
      end
    end
  end

  describe 'PUT #update' do
    it 'updates the review' do
      put :update, params: { movie_id: movie.id, id: review.id, review: { content: 'Updated content' } }
      review.reload
      expect(review.content).to eq('Updated content')
    end

    it 'redirects to the movie page with success notice' do
      put :update, params: { movie_id: movie.id, id: review.id, review: { content: 'Updated content' } }
      expect(response).to redirect_to(movie)
      expect(flash[:notice]).to eq('Review was successfully updated.')
    end

    it 'renders edit template if review params are invalid' do
      put :update, params: { movie_id: movie.id, id: review.id, review: { content: '' } }
      expect(response).to render_template(:edit)
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the review' do
      delete :destroy, params: { movie_id: movie.id, id: review.id }
      expect(Review.exists?(review.id)).to be_falsy
    end

    it 'redirects to the movie page with success notice' do
      delete :destroy, params: { movie_id: movie.id, id: review.id }
      expect(response).to redirect_to(movie)
      expect(flash[:notice]).to eq('Review was successfully deleted.')
    end
  end
end
