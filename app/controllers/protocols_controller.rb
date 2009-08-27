# -*- coding: utf-8 -*-
class ProtocolsController < ApplicationController
  before_filter :load_protocol, :only => [:show, :edit, :destroy]

  def index
    @protocols = Protocol.my_find(:all)
  end

  def show
  end

  def new
    @protocol = Protocol.new(params[:protocol])
    if request.post?
      if  @protocol.save
        flash[:notice] = "Protokół #{@protocol.name} utworzony"
        redirect_to :action => :index
      else
        flash[:notice] = "Protokół #{@protocol.name} nie mógł zostać utworzony"
      end
    end
  end

  def edit
    if request.post?
      if  @protocol.update_attributes(params[:protocol])
        flash[:notice] = "Protokół #{@protocol.name} utworzony"
        redirect_to :action => :index
      else
        flash[:notice] = "Protokół #{@protocol.name} nie mógł zostać utworzony"
      end
    end
  end

  def destroy
    @protocol.destroy

    redirect_to:action => :index 
  end

  private
  def load_protocol
    @protocol = Protocol.my_find(params[:id])
  end
end
