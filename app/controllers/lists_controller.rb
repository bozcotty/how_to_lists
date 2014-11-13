class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

  def index
    @lists = List.all
  end

  def show
  end

  def new
    @list = List.new
  end

  def create
    @list = List.new(list_params)
    if @list.save
      flash[:notice] = 'List was successfully created.'
      redirect_to @list
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @list.update(list_params)
      flash[:notice] = "List was successfully updated."
      redirect_to @list
    else
      flash[:error] = "Error updating List, please try again."
      render :edit
    end
  end

  def destroy
    @list.destroy
    flash[:notice] = 'List was successfully deleted.'
    redirect_to lists_path
  end

  private

  def set_list
    @list = List.find(params[:id])
  end

  def list_params
    params.require(:list).permit(:title)
  end

end
