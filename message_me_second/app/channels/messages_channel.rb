class MessagesChannel < ApplicationCable::Channel  
    def subscribed
        byebug
        stream_from 'messages'
      end
end  