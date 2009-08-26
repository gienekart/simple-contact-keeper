# -*- coding: utf-8 -*-
class PeopleController < ApplicationController
  before_filter :create_person, :only => [:show, :edit, :destroy]
  
  def index
    @people = Person.find(:all)
  end

  def show
  end

  def edit
    #czy to jest wywoływane przez formularz
    if request.post? & @person.update_attributes(params[:person])
      flash[:notice] = "Kontakt #{@person.name} zaktualizowany"
      redirect_to :action => :index
    end
  end

  def new
    @person = Person.new(params[:person])
    if request.post? and @person.save
      flash[:notice] = "Kontakt #{@person.name} utworzony"
      redirect_to :action => :index
    end
  end

  def destroy
    @person.destroy

    redirect_to:action => :index #(people_url)
  end


private
  def create_person
    @person = Person.my_find(params[:id])
  end
end
