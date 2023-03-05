class ChatMessagesController < ApplicationController
  before_action :set_chat_message, only: [:show, :edit, :update, :destroy]
  # GET /chat_messages
  def index
    @chat_messages = ChatMessage.all
  end

  # GET /chat_messages/1
  def show
  end

  # GET /chat_messages/new
  def new
    @chat_message = ChatMessage.new

  end

  # GET /chat_messages/1/edit
  def edit
  end

  # POST /chat_messages
  def create
    @chat_message = ChatMessage.new(chat_message_params)
    if @chat_message.save
      redirect_to controller: 'subject', action: 'show', id: chat_message_params[:subject_id]  
    else
      render :new
    end
  end

  # PATCH/PUT /chat_messages/1
  def update
    if @chat_message.update(chat_message_params)
      redirect_to @chat_message, notice: 'Chat message was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /chat_messages/1
  def destroy
    @chat_message.destroy
    redirect_to chat_messages_url, notice: 'Chat message was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chat_message
      @chat_message = ChatMessage.find(params[:id])
    end
    
    # Only allow a list of trusted parameters through.
    def chat_message_params
      params.require(:chat_message).permit(:content, :teacher_id, :student_id, :subject_id)
    end
end
