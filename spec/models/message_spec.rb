require 'rails_helper'

RSpec.describe Message, type: :model do
  it "can not be empty" do
    msg = Message.new(body: "")
    expect(msg).to_not be_valid
  end

  it "should not be too long" do
    msg = Message.new(body: "a" * 251)
    expect(msg).to_not be_valid
  end
end
