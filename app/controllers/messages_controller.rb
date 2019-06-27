class MessagesController < ApplicationController
  before_action :require_user

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    {msg: message_partial(@message)}
    end
  end

  private
  def message_params
    params.require(:message).permit(:body)
  end

  def message_partial (message)
    render(partial: 'shared/message', locals: {obj: message})
  end
end