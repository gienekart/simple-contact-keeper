class PeopleController < ApplicationController
  def index
    @people = Person.find(:all)
  end

  def show
  end

  def edit
  end

  def new
  end

end
