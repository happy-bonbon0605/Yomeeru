class VotesController < ApplicationController
  # yochiyochi message
  def index
  end

  # vote
  def select
    @vote = Vote.new
    @candidates = Candidate.where.not(uid: '0').shuffle[0..4] << Candidate.find_by(uid: '0')
  end

  # message for wife
  def message
  end

  # create vote and message
  def vote
  end
end
