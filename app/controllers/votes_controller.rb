class VotesController < ApplicationController
  # yochiyochi message
  def index
    config_file_path = './lib/congratulations.yml'

    begin
      yaml_data = YAML.load_file(config_file_path)
      @congratulations = yaml_data['congratulations']
    rescue
      logger.error 'yaml読み込みがうまくいかないのでちょっと確認してみてね'
      render text: 'Herokuを動かすには愛が足りません。奥様に「愛してる」と言ってください。'
    end

    @vote = Vote.last
  end

  def select
    @vote = Vote.new
    @candidates = Candidate.where.not(uid: '0').shuffle[0..4] << Candidate.find_by(uid: '0')
  end

  def message
    @vote = Vote.new(voted_user_id_params)
  end

  def vote
    @vote = Vote.new(vote_params)
    @vote.voting_user_id = current_user.id
    if @vote.save
      redirect_to votes_path, notice: '奥様へ捧げる愛のメッセージをありがとうございました。'
    else
      flash.now[:alert] = '奥様への愛が足りません。やり直しです。'
      render :message
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
