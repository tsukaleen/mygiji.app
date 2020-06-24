class GijiController < ApplicationController
#  before_action :move_to_index, except: :index
 
  def index
  @gijis = Giji.order("created_at DESC").page(params[:page]).per(5)
 
  end
  
  def new 
end

 def create
   Giji.create(name: giji_params[:name], image: giji_params[:image], text: giji_params[:text], user_id: current_user.id)
 end
 
 def destroy
      giji = Giji.find(params[:id])
      giji.destroy if giji.user_id == current_user.id
 end
 
 def update
    giji = Giji.find(params[:id])
    if giji.user_id == current_user.id
      giji.update(giji_params)
    end
  end
  
 def edit
  @gijis = Giji.find(params[:id])
 end
 
 def show
    @giji = Giji.find(params[:id])
    @gijis = Giji.find(params[:id])
    @comments = @giji.comments.includes(:user)
 end
 
 def search
    @gijis = Giji.where('text LIKE(?)', "%#{params[:search]}%").order("created_at DESC").page(params[:page])
end
 
 private
 def giji_params
   params.permit(:name, :image, :text)
 end
end
