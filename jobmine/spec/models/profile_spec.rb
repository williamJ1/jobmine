require 'rails_helper'

RSpec.describe Profile, type: :model do

  it "is valid with valid attributes" do

    profile=Profile.create(address: 'teen addr', phone_num: 123456789,
                            gender: 'male', user_type: 'teen', latitude: nil, longitude: nil, average_rating: -0.1e1, rating_star: 0)

    expect(profile).to be_valid
  end

  it "is not valid without an address" do
profile=Profile.create(phone_num: 123456789,
                            gender: 'male', user_type: 'teen', latitude: nil, longitude: nil, average_rating: -0.1e1, rating_star: 0)
   expect(profile).to_not be_valid
  end

  it "is not valid without a phone_num" do
    expect(profile).to_not be_valid
  end

  it "is not valid without a gender" do
    expect(profile).to_not be_valid
  end

  it "is not valid without a user_id" do
    expect(profile).to_not be_valid
  end

 it "is not valid without a user_type" do
    expect(profile).to_not be_valid
  end


end
