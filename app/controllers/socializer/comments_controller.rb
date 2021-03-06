module Socializer
  class CommentsController < ApplicationController
    
    def new
      @comment = Comment.new
    end
  
    def create
      @comment = current_user.comments.build(params[:comment])
      @comment.activity_verb = 'add'
      @comment.scope = 'PUBLIC'
      @comment.activity_parent_id = @comment.object_id
      @comment.save!
      redirect_to stream_path
    end
  
    def edit
      @comment = current_user.comments.find(params[:id])
    end
  
    def update
      @comment = current_user.comments.find(params[:id])
      @comment.update_attributes!(params[:comment])
      redirect_to stream_path
    end
  
    def destroy
      @comment = current_user.comments.find(params[:id])
      @comment.destroy
      redirect_to stream_path
    end
  
  end
end
