class WelcomeController < ApplicationController
  # skip_before_action :authenticate_user!, only: [:index]

  def index
  end

  def send_email
    name = params[:name]
    email = params[:email]
    message = params[:message]
    ContactMailer.home_form(name, email, message).deliver_later
    redirect_to root_path, notice: 'Thanks! Your message was sent.'
  end
end
