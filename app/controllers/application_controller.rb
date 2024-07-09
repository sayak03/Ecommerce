# frozen_string_literal: true

# Class for Application controller
class ApplicationController < ActionController::Base
  before_action :authenticate_admin!
end
