# -*- coding: utf-8 -*-
class ContactsController < ApplicationController
  before_filter :create_contact, :only => [:show, :edit, :destroy]
  
  def index
    @contacts = Contact.find(:all)
  end

  def show
  end

  def edit
    #czy to jest wywoływane przez formularz
    if request.post? & @contact.update_attributes(params[:contact])
      #flash[:notice] = "Kontakt do #{@contact.person.name} zaktualizowany"
      redirect_to :action => :index
    end
  end

  def new
    @contact = Contact.new(params[:contact])
    if request.post?
      if @contact.save
        #flash[:notice] = "Kontakt do #{@contact.person.name} utworzony"
        redirect_to :action => :index
      else
        flash[:notice] = "Kontakt zawiera błąd"
      end
    end
  end

  def destroy
    @contact.destroy

    redirect_to:action => :index #(people_url)
  end


private
  def create_contact
    @contact = Contact.my_find(params[:id])
  end
end
