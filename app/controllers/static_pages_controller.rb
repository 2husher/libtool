class StaticPagesController < ApplicationController
  def home
  end

  def about
  end

  def contacts
  end

  def help
    respond_to do |format|
      format.html
      format.text
    end
  end
end
