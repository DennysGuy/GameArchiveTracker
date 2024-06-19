class ArchiveController < ApplicationController
  before_action :authenticate_user!, only: [:index, :checkout]
  def index
  end

  def checkout
  end

  def search
  end

  def collections
  end

end
