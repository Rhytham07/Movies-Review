require 'rails_helper'

RSpec.describe Movie, type: :model do
  describe "associations" do
    it { should have_many(:reviews).dependent(:destroy) }
    it { should belong_to(:user) }
   
  end
end
