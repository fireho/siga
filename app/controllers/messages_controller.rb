class MessagesController < ApplicationController
  #before_filter :load_users, :only => [:new, :create]

  # GET /messages
  # GET /messages.xml
  def index
    @messages = current_user.messages.all(:order=>'created_at DESC')

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.xml
  def show
    @message = current_user.messages.find(params[:id])
    @message.read!
    @reply = Message.new
    @reply.parent = @message

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.xml
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  # POST /messages
  # POST /messages.xml
  def create
    @message = current_user.messages_sent.build(params[:message])

    respond_to do |format|
      if @message.save
        flash[:notice] = 'Mensagem foi enviada!'
        format.html { redirect_back_or_default(inbox_path) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end


  # DELETE /messages/1
  # DELETE /messages/1.xml
  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end

  private

  def load_users
    @users = current_user.users.uniq.map { |u| [u.name, u.id]}
  end
end
