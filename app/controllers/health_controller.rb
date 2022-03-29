class HealthController < ApplicationController
  def welcome
    render :html => "<h1>Hi! I'm live</h1>".html_safe
  end
end
