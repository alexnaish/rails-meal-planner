class RecipesController < ApplicationController
  before_action :logged_in, only: [:new, :create, :edit, :destroy]
  before_action :set_recipe, only: [:edit, :update, :destroy]
  rescue_from ActiveRecord::RecordNotFound, with: :return_to_index

  # GET /recipes
  def index
    @recipes = Recipe.all
  end

  # GET /recipes/1
  def show
    @recipe = Recipe.includes(:ingredients).find(params[:id])
  end

  # GET /recipes/new
  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  # GET /recipes/1/edit
  def edit
  end

  # POST /recipes
  def create
    @recipe = @current_user.recipes.new(recipe_params)
    if @recipe.save
      redirect_to @recipe, notice: 'Recipe was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /recipes/1
  def update

    puts '=-=--=-=-=-=-==--==-=-=--='
    puts recipe_params
    puts '=-=--=-=-=-=-==--==-=-=--='

    if @recipe.update(recipe_params)
      redirect_to @recipe, notice: "Recipe was successfully updated."
    else
      render :edit
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
    redirect_to recipes_url, notice: 'Recipe was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def recipe_params
      params.require(:recipe).permit(
        :name, :image,
        ingredients_attributes: [:id, :name, :_destroy])
    end

    def return_to_index
      redirect_to recipes_url, notice: 'Recipe not found.'
    end

end
