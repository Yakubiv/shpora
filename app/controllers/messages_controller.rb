class MessagesController < ApplicationController

  def sended
    @users = User.all
    @messages = current_user.sended_messages.all
  end

  def recived
    @users = User.all
    @messages = current_user.recepiend_messages.all
  end

  def new
    @user = User.find(params[:user_id])
    @message = @user.recepient_messages.new

  end

  def create
    @message = current_user.sended_messages.create(message_params)
    redirect_to users_path
  end

  def show
    @message = Message.find(params[:id])
    @user = current_user
  end

  def destroy
    @message = Message.find(params[:id])
    if User.find(@message.sender_id) == current_user
      @message.delete_from_sended
      redirect_to messages_sended_path
    else
      @message.delete_from_recived
      redirect_to messages_recived_path
    end
  end

  private

    def message_params
     params.require(:message).permit(:tema, :content, :recepient_id, :read_at)
    end
end
