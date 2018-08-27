# frozen_string_literal: true

class WelcomeController < ApplicationController
  layout 'mozaic', only: [:setup]

  def index
    turbolinks_animate 'fadein'
  end

  def setup
    turbolinks_animate 'fadein'
    redirect_to app_root_url if already_setup?
    session[:setup] = true
  end

  def language
    modalist
  end

  private

  def already_setup?
    !params[:stay] && (current_user || session[:setup])
  end
end
