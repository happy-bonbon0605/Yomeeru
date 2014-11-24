class VotesController < ApplicationController
  # yochiyochi message
  def index
  end

  def select
    @vote = Vote.new
    @candidates = Candidate.all
  end

  def message
    @vote = Vote.new(voted_user_id_params)
  end

  def vote
    @vote = Vote.new(vote_params)
    @vote.voting_user_id = current_user.id
    if @vote.save
      redirect_to :root, notice: '奥様へ捧げる愛のメッセージをありがとうございました。'
    else
      render :select, alert: "奥様への愛が足りません。やり直しです。"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:voted_user_id, :message)
  end

  def voted_user_id_params
    params.require(:vote).permit(:voted_user_id)
  end
end
