class StaticPagesController < ApplicationController
  before_action :redirect_if_authenticated

  def splash
    # The splash view will be rendered for unauthenticated users
  end

  private

  def redirect_if_authenticated
    redirect_to categories_path if user_signed_in?
  end
end
