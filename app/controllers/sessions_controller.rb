class SessionsController < ApplicationController
  skip_before_action :login!, only: [:new, :create]

  def new ; end
end
