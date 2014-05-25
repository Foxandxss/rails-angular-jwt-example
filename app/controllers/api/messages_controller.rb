module Api
  class MessagesController < Api::BaseController
    before_action :correct_user, only: :destroy

    def index
      messages = @current_user.messages
      render json: messages, root: false
    end

    def create
      message = @current_user.messages.build(message_params)
      if message.save
        render json: message, root: false
      else
        render json: { error: 'Internal Server Error'}, status: :internal_server_error
      end
    end

    def destroy
      @message.destroy
      render json: {}, status: :no_content
    end

    private
      def message_params
        params.permit(:body)
      end

      def correct_user
        @message = @current_user.messages.find_by(id: params[:id])
        render json: { error: 'Message not found' }, status: :not_found if @message.nil?
      end
  end
end