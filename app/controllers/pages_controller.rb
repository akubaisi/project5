class PagesController < ApplicationController
  def home
  @title = "Home"
  end

  def contact
  @tite = "Contact"
  end

  def about
  @tite = "About"
  end
  
  def help
  @tite = "Help"
  end
  
 end
