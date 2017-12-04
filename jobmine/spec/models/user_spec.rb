require 'rails_helper'

RSpec.describe User, type: :model do

  it "is valid with valid attributes" do
    user = User.create(email: 'teen@t.com', password: '123')

    expect(user).to be_valid
  end

  it "is not valid without a title" do
  end

  it "is not valid without a description" do
  end

  it "is not valid without a start_date" do
  end

  it "is not valid without a end_date" do
  end
end
