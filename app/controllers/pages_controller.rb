# frozen_string_literal: true

class PagesController < ApplicationController
  before_action :require_logout

  def home; end
end
