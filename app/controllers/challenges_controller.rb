class ChallengesController < ApplicationController

  before_filter :load_protocol
  before_filter :create_challenge, :only => [:show, :edit, :update, :destroy]

  def index
    @challenges = Challenge.find(:all)
  end

  def show
  end

  def edit
  end

  def update
    
    #czy to jest wywoływane przez formularz
    if @challenge.update_attributes(params[:challenge])
      #flash[:notice] = "Kontakt do #{@challenge.person.name} zaktualizowany"
      redirect_to protocol_url(@protocol)
    end
  end

  def new
    # @challenge = @protocol.challenges.build
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(params[:challenge])
    # @challenge.result = params[:challenge][:result]
    if params[:challenge][:result] == 'true'
       @challenge.result = true
    else
       @challenge.result = false
    end

    if @challenge.save
        #flash[:notice] = "Kontakt do #{@challenge.person.name} utworzony"
        redirect_to protocol_url(@protocol)
    else
        flash[:notice] = "Kontakt zawiera błąd"
        redirect_to :action => :new
    end
  end

  def destroy
    @challenge.destroy

    redirect_to protocol_url(@protocol)
  end

private
  def create_challenge
    @challenge = Challenge.my_find(params[:id])
  end

  def load_protocol
    @protocol = Protocol.my_find(params[:protocol_id])
  end
end
