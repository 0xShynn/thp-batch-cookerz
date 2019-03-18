class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:create]

  def create
    @recipe = Recipe.find(params[:recipe_id])
    comment = Comment.new(user_id: current_user.id, recipe_id: @recipe.id, description: params[:comment][:description])
    if comment.save
      redirect_to recipe_path(@recipe)
    end 
  end 

  def destroy
    @recipe = Recipe.find(params[:recipe_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to recipe_path(@recipe)
  end

end
