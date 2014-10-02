class StepsController < ApplicationController
  before_action :set_list
  before_action :set_step, only: [:show, :edit, :update, :destroy]

  def show
  end

  def new
    @step = Step.new
  end

  def create
    @step = @list.steps.new(step_params)
    if @step.save
      flash[:notice] = "Step created successfully"
      redirect_to @list
    else
      render :new
    end
  end

  def edit
  end

  def update
    if @step.update(step_params)
      flash[:notice] = "Step updated successfully"
      redirect_to [@list, @step]
    else
      render :edit
    end
  end

  def destroy
    @step.destroy
    redirect_to @list
  end



  private

  def set_list
    @list = List.find(params[:list_id])
  end

  def set_step
    @step = Step.find(params[:id])
  end

  def step_params
    params.require(:step).permit(:item)
  end
end
