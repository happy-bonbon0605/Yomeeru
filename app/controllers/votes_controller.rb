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
