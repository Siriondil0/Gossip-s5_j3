class CommentController < ApplicationController
  def new
    @good_comment = Comment.new
    @comment_original= Comment.find(params[:comment_id])
  end

  def create 
    if session[:user_id]
      user = User.find(session[:user_id])
    else
      user = User.create!(city:City.first, first_name: "Ano", last_name: "Nimus", email: "ano.nimus@anomymus.com")
    end  
    if params[:gossip_id]
      gossip = Gossip.find(params[:gossip_id])
      new_comment = gossip.comments.create!(content: params[:comment][:content], user: user)
    else
      puts 'moi'
      puts params[:comment][:comment_id]
      puts params[:comment_id]
      comment= Comment.find(params[:comment_id])
      new_comment= comment.comments.create!(content: params[:comment][:content], user: user)
      gossip = comment.commentable
    end
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
