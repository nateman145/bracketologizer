class BracketNodesController < ApplicationController
  # GET /bracket_nodes
  # GET /bracket_nodes.xml
  def index
    @bracket_nodes = BracketNode.all

    respond_to do |format|
      format.html # index.html.haml
      format.xml  { render :xml => @bracket_nodes }
    end
  end

  # GET /bracket_nodes/1
  # GET /bracket_nodes/1.xml
  def show
    @bracket_node = BracketNode.find(params[:id])

    respond_to do |format|
      format.html # show.html.haml
      format.xml  { render :xml => @bracket_node }
    end
  end

  # GET /bracket_nodes/new
  # GET /bracket_nodes/new.xml
  def new
    @bracket_node = BracketNode.new

    respond_to do |format|
      format.html # new.html.haml
      format.xml  { render :xml => @bracket_node }
    end
  end

  # GET /bracket_nodes/1/edit
  def edit
    @bracket_node = BracketNode.find(params[:id])
  end

  # POST /bracket_nodes
  # POST /bracket_nodes.xml
  def create
    @bracket_node = BracketNode.new(params[:bracket_node])

    respond_to do |format|
      if @bracket_node.save
        format.html { redirect_to(@bracket_node, :notice => 'BracketNode was successfully created.') }
        format.xml  { render :xml => @bracket_node, :status => :created, :location => @bracket_node }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @bracket_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /bracket_nodes/1
  # PUT /bracket_nodes/1.xml
  def update
    @bracket_node = BracketNode.find(params[:id])

    respond_to do |format|
      if @bracket_node.update_attributes(params[:bracket_node])
        format.html { redirect_to(@bracket_node, :notice => 'BracketNode was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @bracket_node.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /bracket_nodes/1
  # DELETE /bracket_nodes/1.xml
  def destroy
    @bracket_node = BracketNode.find(params[:id])
    @bracket_node.destroy

    respond_to do |format|
      format.html { redirect_to(bracket_nodes_url) }
      format.xml  { head :ok }
    end
  end
end
