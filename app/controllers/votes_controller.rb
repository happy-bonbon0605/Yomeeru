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
  end

  # create vote and message
  def vote
  end
end
