class SessionsController < Devise::SessionsController
    def create
      super do |user|
        flash[:success] = "Signed in successfully."
      end
    end
  
    def destroy
      super do |user|
        flash[:notice] = "Signed out successfully."
      end
    end
  end
  