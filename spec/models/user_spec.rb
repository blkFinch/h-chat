require 'rails_helper'

RSpec.describe User, type: :model do
  it "must have unique username" do
    user = User.create(username:"username", password: "password")
    user2 = User.new(username:"username", password: "password")
    expect(user2).to_not be_valid
  end

  it "must have password" do
    user = User.new(username:"username")
    expect(user).to_not be_valid
  end
end
