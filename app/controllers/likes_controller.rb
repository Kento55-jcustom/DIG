class LikesController < ApplicationController
    def create
        like = current_user.likes.create(ibane_id: params[:ibane_id]) #user_idとibane_idの二つを代入
        redirect_back(fallback_location: root_path)
      end
    
      def destroy
        like = Like.find_by(ibane_id: params[:ibane_id], user_id: current_user.id)
        like.destroy
        redirect_back(fallback_location: root_path)
      end
    
end
