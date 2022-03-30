class DummyController < ApplicationController
  def index
    render :json => "Hi I'm Dummy"
  end
end
