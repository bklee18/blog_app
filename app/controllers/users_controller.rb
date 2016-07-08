class UsersController < ApplicationController
  def hello
    render html: "hello world"
  end

  def index
    @users = User.all
  end

  def show
  end

  def new
    @user = User.new
  end

end
