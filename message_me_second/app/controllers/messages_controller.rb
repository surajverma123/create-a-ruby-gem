class MessagesController < ApplicationController
    def create
        message = current_user.messages.build(messages_params)
        if message.save
            MessagesChannel.broadcast_to("message", "testMesage")
            # head :ok
            redirect_to root_path
        end
    end

    private
    def messages_params
        params.require(:message).permit(:body)
    end
end