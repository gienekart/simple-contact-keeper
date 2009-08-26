# -*- coding: utf-8 -*-
class ContactsController < ApplicationController
  before_filter :load_person
  before_filter :create_contact, :only => [:show, :edit, :update, :destroy]
  
  def index
    # @person = Person.my_find(params[:id])
    @contacts = Contact.find(:all)
  end

  def show
  end

  def edit
  end

  def update
    
    #czy to jest wywoływane przez formularz
    if @contact.update_attributes(params[:contact])
      #flash[:notice] = "Kontakt do #{@contact.person.name} zaktualizowany"
      redirect_to person_url(@person)
    end
  end

  def new
    @contact = @person.contacts.build
  end

  def create
    @contact = Contact.new(params[:contact])
    if @contact.save
        #flash[:notice] = "Kontakt do #{@contact.person.name} utworzony"
        redirect_to person_url(@person)
      else
        flash[:notice] = "Kontakt zawiera błąd"
      end
  end

  def destroy
    @contact.destroy

    redirect_to person_url(@person)
  end


private
  def create_contact
    @contact = Contact.my_find(params[:id])
  end

  def load_person
    @person = Person.my_find(params[:person_id])
  end
end
