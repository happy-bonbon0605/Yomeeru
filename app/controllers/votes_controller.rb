class VotesController < ApplicationController
  # yochiyochi message
  def index
  end

  # vote
  def select
    @vote = Vote.new
    @candidates = Candidate.all
  end

  # message for wife
  def message
    @vote = Vote.new(votde_user_id_params)
  end

  # create vote and message
  def vote
    @vote = Vote.new(vote_params)
    @vote.voting_user_id = current_user.id
    if @vote.save
      redirect_to :root, notice: '妻へ捧げる愛のメッセージをありがとうございました。'
    else
      render :selct, alert: "妻への愛が足りません。やり直しです。"
    end
  end

  private
  def vote_params
    params.require(:vote).permit(:voted_user_id, :message)
  end

  def votde_user_id_params
    params.require(:vote).permit(:voted_user_id)
  end
end
