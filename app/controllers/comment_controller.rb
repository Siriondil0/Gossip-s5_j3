class CommentController < ApplicationController
  def new
    @good_comment = Comment.new
  end

  def create 
    gossip = Gossip.find(params[:gossip_id])
    if session[:user_id]
      user = User.find(session[:user_id])
    else
      user = User.User.create!(city:City.first, first_name: "Ano", last_name: "Nimus", email: "ano.nimus@anomymus.com")
    end  
    comment = gossip.comments.create!(content: params[:comment][:content], user: user)
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
    @good_comment = Comment.find(params[:id])
    url= @good_comment.commentable.id.to_s
    if session[:user_id]
      user = User.find(session[:user_id])
      if user == @good_comment.user
        @good_comment.destroy
      end
    end
    redirect_to("/gossip/"+url)
  end

end
