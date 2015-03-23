class BracketsController < ApplicationController
  # GET /brackets
  # GET /brackets.xml
  def index
    @brackets = Bracket.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @brackets }
    end
  end

  # GET /brackets/1
  # GET /brackets/1.xml
  def show
    @bracket = Bracket.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/new
  # GET /brackets/new.xml
  def new
    @bracket = Bracket.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @bracket }
    end
  end

  # GET /brackets/1/edit
  def edit
    @bracket = Bracket.find(params[:id])
  end

  # POST /brackets
  # POST /brackets.xml
  def create
    @bracket = Bracket.new(params[:bracket])

    respond_to do |format|
      if @bracket.save
        format.html { redirect_to(@bracket, :notice => 'Bracket was successfully created.') }
        format.xml  { render :xml => @bracket, :status => :created, :location => @bracket }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /brackets/1
  # PUT /brackets/1.xml
  def update
    @bracket = Bracket.find(params[:id])

    respond_to do |format|
      if @bracket.update_attributes(params[:bracket])
        format.html { redirect_to(@bracket, :notice => 'Bracket was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bracket.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /brackets/1
  # DELETE /brackets/1.xml
  def destroy
    @bracket = Bracket.find(params[:id])
    @bracket.destroy

    respond_to do |format|
      format.html { redirect_to(brackets_url) }
      format.xml  { head :ok }
    end
  end
end
