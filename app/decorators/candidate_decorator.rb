# coding: utf-8
module CandidateDecorator
  def button_type
    uid == '0' ? 'btn-success' : 'btn-default'
  end
end
