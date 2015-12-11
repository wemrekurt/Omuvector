class SubjectsController < ApplicationController
	before_action :authenticate_user!, except: [:index,:show]
  def index
		@subjects = Subject.all.order('created_at DESC')
  end

  def new
    @subject = Subject.new
  end

  def show
    @subject = Subject.find(params[:id])
  end

  def create
    @subject = Subject.new(subject_params)

      if @subject.save
        redirect_to @subject
      else
        render 'new'
      end
  end

  def edit
    @subject = Subject.find(params[:id])
  end

  def update
    @subject = Subject.find(params[:id])

    if @subject.update(params[:subject].permit(:title,:description))
      redirect_to @subject
    else
      render 'edit'
    end
  end

  def destroy
    @subject = Subject.find(params[:id])
    @subject.destroy

    redirect_to root_path
  end

  private
    def subject_params
      params.require(:subject).permit(:title, :description)
    end
end
