class CommentsController < ApplicationController
  def create
    @subject = Subject.find(params[:subject_id])
    @comment = @subject.comments.create(params[:comment].permit(:name,:body))

    redirect_to subject_path(@subject)
  end

  def destroy
    @subject = Subject.find(params[:subject_id])
    @comment = @subject.comments.find(params[:id])
    @comment.destroy

    redirect_to subject_path(@subject)
  end

end
