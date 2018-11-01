class LikeController < ApplicationController
    def new
        @good_like = Like.new
    end

    def create 
        puts params
        gossip = Gossip.find(params[:gossip_id])
        puts session[:user_id]
        if session[:user_id]
            like = gossip.likes.create!(user: User.find(session[:user_id]))
        end
        url="/gossip/" + gossip.id.to_s
        redirect_to(url)
    end
    
    def destroy
        @good_like = Like.find(params[:id])
        url= @good_like.likable.id.to_s
        @good_like.destroy
        redirect_to("/gossip/"+url)
    end
end
