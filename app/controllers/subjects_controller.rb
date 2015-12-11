class SubjectsController < ApplicationController
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

  private
    def subject_params
      params.require(:subject).permit(:title, :description)
    end
end
