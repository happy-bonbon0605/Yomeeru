class VotesController < ApplicationController
  # yochiyochi message
  def index
    config_file_path = './lib/congratulations.yml'

    begin
      yaml_data = YAML.load_file(config_file_path)
    rescue
      # Configファイルが不正な構文 => 終了する
      logger.error 'congratulations.yml is invalid'
      exit
    end

    @congratulations = yaml_data['congratulations']

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
