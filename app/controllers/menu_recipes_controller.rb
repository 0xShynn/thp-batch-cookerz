class MenuRecipesController < ApplicationController
 
  def create
    puts '$' * 60
    puts params.inspect
    menu_recipe = MenuRecipe.new(recipe_id: params[:recipe_id], menu_id: params[:menu_id])
    
    if menu_recipe.save
      flash[:success] = "La recette a bien été ajoutée à ton menu !"
      redirect_to user_path(current_user)
    else
      flash[:error] = "Désolé, la recette n'a pas été ajoutée !"
      redirect_to user_path(current_user)
    end
  end
end
