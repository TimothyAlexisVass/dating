class MessagesController < ApplicationController
  before_action :set_conversation

  def create
    @message = @conversation.messages.new(message_params)
    @message.user = @current_user
  
    if @message.save
      redirect_to conversation_path(@conversation)
    else
      redirect_to conversation_path(@conversation), flash: { danger: "<%= t(:message_failed) %>"}
    end
  end

  def edit
    @message = @conversation.messages.find(params[:id])
  end

  def update
    @message = @conversation.messages.find(params[:id])

    if @message.update(message_params)
      redirect_to conversation_path(@conversation)
    else
      render :edit
    end
  end

  def destroy
    @message = @conversation.messages.find(params[:id])
    @message.destroy
    redirect_to conversation_path(@conversation)
  end

  private

  def set_conversation
    @conversation = Conversation.find(params[:conversation_id])
  end

  def message_params
    params.require(:message).permit(:body)
  end
end
