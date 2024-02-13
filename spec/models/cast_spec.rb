# spec/models/cast_spec.rb

require 'rails_helper'

RSpec.describe Cast, type: :model do
  describe "associations" do
    it { should have_many(:star_casts) }
  end
end
