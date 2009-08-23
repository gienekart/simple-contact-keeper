# -*- coding: utf-8 -*-
class PeopleController < ApplicationController
  before_filter :create_person, :only => [:show, :delete]
  
  def index
    @people = Person.find(:all)
  end

  def show
  end

  def edit
    #czy to jest wywoływane przez formularz
    if request.post?
      @person = Person.new(params[:person])
      if @person.save
        flash[:notice] = "User #{@person.name} created"
        redirect_to :action => :index
      end
    else #czy może wywołane przez link do edit
      @person = Person.my_find(params[:id])
    end
  end

  def new
    @person = Person.new(params[:person])
    if request.post? and @person.save
      flash[:notice] = "User #{@person.name} created"
      redirect_to :action => :index
    end
  end

  def delete
    @person.destroy

    redirect_to(people_url)
  end


private
  def create_person
    @person = Person.my_find(params[:id])
  end
end
