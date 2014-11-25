# coding: utf-8
require 'test_helper'

class CandidateDecoratorTest < ActiveSupport::TestCase
  def setup
    @candidate = Candidate.new.extend CandidateDecorator
  end

  # test "the truth" do
  #   assert true
  # end
end
