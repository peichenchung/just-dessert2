class Admin::DessertsController < ApplicationController
  before_action :authenticate_user!
  before_action :authenticate_admin

  def index #後台首頁  
  end

end
