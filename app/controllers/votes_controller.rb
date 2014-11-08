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
    @vote = Vote.new
    @vote.voted_user_id = params[:vote][:voted_user_id]
  end

  # create vote and message
  def vote
  end
end
