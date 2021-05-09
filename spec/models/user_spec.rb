require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it { validate_presence_of(:name) }
    it { validate_presence_of(:password) }
  end

  describe 'associations' do
    it { should have_many(:articles).dependent(:destroy) }
    it { should have_many(:votes).dependent(:destroy) }
  end
end
