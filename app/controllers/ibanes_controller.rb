class IbanesController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create]
    def index
    @ibanes= Ibane.all
    @tags = Tag.all
       search = params[:search]
    @ibanes = Ibane.joins(:user).where("name LIKE ? OR artist LIKE ? OR about LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%")
       if params[:tag_ids].present?
          ibane_ids = []
          params[:tag_ids].each do |key, value| 
          if value == "1"
           Tag.find_by(name: key).ibanes.each do |p| 
             ibane_ids << p.id
           end
          end
               end
               ibane_ids = ibane_ids.uniq
               @ibanes = @ibanes.where(id: ibane_ids) if ibane_ids.present?
           end
    end
    def new
        @ibane = Ibane.new
      end
    
      def create
        ibane = Ibane.new(ibane_params)
        ibane.user_id = current_user.id
        if ibane.save!
          redirect_to :action => "index"
        else
          redirect_to :action => "new"
        end
      end
      def show
        @ibane = Ibane.find(params[:id])
        @comments = @ibane.comments
        @comment = Comment.new
      end
      def edit
        @ibane = Ibane.find(params[:id])
      end
      def update
        ibane = Ibane.find(params[:id])
        if ibane.update(ibane_params)
          redirect_to :action => "show", :id => ibane.id
        else
          redirect_to :action => "new"
        end
      end
      def destroy
        ibane = Ibane.find(params[:id])
        ibane.destroy
        redirect_to action: :index
      end

      private
      def ibane_params
        params.require(:ibane).permit(:name, :artist, :link, :about, :overall, :level, :evaluation, :assessment, :valuation, tag_ids:[])
      end
end