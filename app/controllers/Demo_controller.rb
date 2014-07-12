class DemoController < ApplicationController
  unloadable
  before_filter :find_project


  def sample_action
  end
end
