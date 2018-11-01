class CommentController < ApplicationController
    def new
        @good_comment = Comment.new
    end

    def create 
        gossip = Gossip.find(params[:gossip_id])
        comment = gossip.comments.create!(content: params[:comment][:content], user: gossip.user)
        url="/gossip/" + gossip.id.to_s
        redirect_to(url)
    end

    def edit
        @good_comment = Comment.find(params[:id]) 
    end

    def update
        @good_comment = Comment.find(params[:id]) 
        @good_comment.update_attributes(content: params[:comment][:content])
        url="/gossip/" + @good_comment.commentable.id.to_s
        redirect_to(url)
    end
    
    def destroy
        
    end

end
