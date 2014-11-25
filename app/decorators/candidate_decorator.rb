# coding: utf-8
module CandidateDecorator
  def button_type
    wife? ? 'btn-success' : 'btn-default'
  end

  def button_disable?
    wife? ? true : false
  end

  private

  def wife?
    uid == '0'
  end

end
