class MessagesController < ApplicationController
  def new
    @message = Message.new
  end

  def create
      @message = Message.new(message_params)

      if @message.valid?
        MessageMailer.contact_me(@message).deliver_now
        flash[:notice] = "(( Thank you for sending us a message ))"
        # render json: {message: "Element successfully created"} 
        redirect_to "/"
      else
        render :new
      end
  end

  private

  def message_params
    params.require(:message).permit(:name, :email, :body)
  end
end
