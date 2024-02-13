require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  let(:user) { FactoryBot.create(:user) }

  before do
    sign_in user
  end

  describe "GET #index" do
    it "assigns movies" do
      movies = FactoryBot.create_list(:movie, 3)
      get :index
      expect(response).to have_http_status(200)
    end
  end

  describe "GET #show" do
    it "assigns the requested movie to @movie" do
      movie = FactoryBot.create(:movie)
      get :show, params: { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end

    it "assigns a new review to @review" do
      binding.pry
      movie = FactoryBot.create(:movie)
      get :show, params: { id: movie.id }
      expect(assigns(:review)).to be_a_new(Review).with(movie: movie)
    end

    it "renders the :show template" do
      movie = FactoryBot.create(:movie)
      get :show, params: { id: movie.id }
      expect(response).to render_template("show")
    end
  end

  describe "GET #new" do
    it "assigns a new movie to @movie" do
      get :new
      expect(assigns(:movie)).to be_a_new(Movie)
    end

    it "renders the :new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

  describe "POST #create" do
    context "with valid attributes" do
      it "creates a new movie" do
        expect {
          post :create, params: { movie: FactoryBot.attributes_for(:movie) }
        }.to change(Movie, :count).by(1)
      end

      it "redirects to the created movie" do
        post :create, params: { movie: FactoryBot.attributes_for(:movie) }
        expect(response).to redirect_to(Movie.last)
      end
    end

    context "with invalid attributes" do
      it "does not save the new movie" do
        expect {
          post :create, params: { movie: FactoryBot.attributes_for(:movie, title: nil) }
        }.to_not change(Movie, :count)
      end

      it "re-renders the new method" do
        post :create, params: { movie: FactoryBot.attributes_for(:movie, title: nil) }
        expect(response).to render_template(:new)
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested movie to @movie" do
      movie = FactoryBot.create(:movie)
      get :edit, params: { id: movie.id }
      expect(assigns(:movie)).to eq(movie)
    end

    it "renders the :edit template" do
      movie = FactoryBot.create(:movie)
      get :edit, params: { id: movie.id }
      expect(response).to render_template("edit")
    end
  end

  describe "PATCH #update" do
    let(:movie) { FactoryBot.create(:movie, title: "Old Title") }

    context "with valid attributes" do
      it "updates the requested movie" do
        patch :update, params: { id: movie.id, movie: { title: "New Title" } }
        movie.reload
        expect(movie.title).to eq("New Title")
      end

      it "redirects to the updated movie" do
        patch :update, params: { id: movie.id, movie: { title: "New Title" } }
        expect(response).to redirect_to(movie)
      end
    end

    context "with invalid attributes" do
      it "does not update the movie" do
        patch :update, params: { id: movie.id, movie: { title: nil } }
        movie.reload
        expect(movie.title).to eq("Old Title")
      end

      it "re-renders the edit method" do
        patch :update, params: { id: movie.id, movie: { title: nil } }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe "DELETE #destroy" do
    let!(:movie) { FactoryBot.create(:movie) }

    it "destroys the requested movie" do
      expect {
        delete :destroy, params: { id: movie.id }
      }.to change(Movie, :count).by(-1)
    end

    it "redirects to the movies list" do
      delete :destroy, params: { id: movie.id }
      expect(response).to redirect_to(movies_url)
    end
  end
end
