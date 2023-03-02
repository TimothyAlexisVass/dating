class ConversationsController < ApplicationController
  def index
    @conversations = @current_user.conversations.order(updated_at: :desc).includes(:users)
  end

  def show
    @conversation = Conversation.find(params[:id])
    @messages = @conversation.messages
    @message = Message.new
  end

  def create
    recipient = User.find(params[:recipient_id])
    conversation = @current_user.conversation_with(recipient)

    if conversation.nil?
      user_ids = [@current_user.id, recipient.id]
      conversation = Conversation.create(id: "#{user_ids.min}-#{user_ids.max}")
      conversation.users << @current_user
      conversation.users << recipient
    end

    redirect_to conversation_path(conversation)
  end

  def destroy
    @conversation = Conversation.find(params[:id])
    @conversation.destroy

    redirect_to conversations_path
  end
end
