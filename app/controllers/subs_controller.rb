class SubsController < ApplicationController
  def index
    @subs = Sub.all
    render :index
  end

  def new
    @my_sub = Sub.new
    render :new
  end

  def create
    my_sub = Sub.new(sub_params)
    if my_sub.save
      redirect_to sub_url(my_sub)
    else
      flash[:messages] = my_sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def show
    my_sub = Sub.find_by(:id => params[:id])
    render :show
  end

  def update
    my_sub = Sub.find_by(id: params[:id])
    if my_sub.update(sub_params)
      redirect_to sub_url(my_sub)
    else
      flash[:messages] = my_sub.errors.full_messages
      redirect_to new_sub_url
    end
  end

  def edit
    @my_sub = Sub.find_by(:id => params[:id])
    render :edit
  end

  private

  def sub_params
    params.require(:sub).permit(:title, :description, :user_id)
  end
end
