class Admin::GreatsController < ApplicationController
  before_action :authenticate_admin!
end
