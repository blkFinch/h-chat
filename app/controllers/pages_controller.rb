class PagesController < ApplicationController
  before_action :require_user, only: [:home]

  def home
    @messages = Message.all
    @message = Message.new
  end
end
