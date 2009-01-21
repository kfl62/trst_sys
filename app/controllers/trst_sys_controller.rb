class TrstSysController < ApplicationController
  layout 'layouts/default'
  before_filter :require_user

  def index
  end
end
