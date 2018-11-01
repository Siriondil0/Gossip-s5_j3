class LikeController < ApplicationController
    def new
        @good_like= Like.new
    end

    def create 
        gossip = Gossip.find(params[:gossip_id])
        like = gossip.likes.create
        url="/gossip/" + gossip.id.to_s
        redirect_to(url)
    end
    
    def destroy
        @good_like = like.find(params[:id])
        url= @good_like.likable.id.to_s
        @good_like.destroy
        redirect_to("/gossip/"+url)
    end
end
