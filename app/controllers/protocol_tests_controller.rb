# -*- coding: utf-8 -*-
class ProtocolTestsController < ApplicationController

  before_filter :load_protocol
  before_filter :create_test, :only => [:show, :edit, :update, :destroy]

  def index
    @tests = ProtocolTest.find(:all)
  end

  def show
  end

  def edit
  end

  def update
    
    #czy to jest wywoływane przez formularz
    if @test.update_attributes(params[:test])
      #flash[:notice] = "Kontakt do #{@test.person.name} zaktualizowany"
      redirect_to person_url(@person)
    end
  end

  def new
    @test = @protocol.protocol_tests.build
  end

  def create
    @test = Protocol_test.new(params[:test])
    if @test.save
        #flash[:notice] = "Kontakt do #{@test.person.name} utworzony"
        redirect_to person_url(@person)
      else
        flash[:notice] = "Kontakt zawiera błąd"
      end
  end

  def destroy
    @test.destroy

    redirect_to person_url(@person)
  end

private
  def create_test
    @test = Protocol_test.my_find(params[:id])
  end

  def load_protocol
    @protocol = Protocol.my_find(params[:protocol_id])
  end
end
