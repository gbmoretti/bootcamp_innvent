class ColaboradorsController < ApplicationController
  # GET /colaboradors
  # GET /colaboradors.json
  def index
    @colaboradors = Colaborador.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @colaboradors }
    end
  end

  # GET /colaboradors/1
  # GET /colaboradors/1.json
  def show
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @colaborador }
    end
  end

  # GET /colaboradors/new
  # GET /colaboradors/new.json
  def new
    @colaborador = Colaborador.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @colaborador }
    end
  end

  # GET /colaboradors/1/edit
  def edit
    @colaborador = Colaborador.find(params[:id])
  end

  # POST /colaboradors
  # POST /colaboradors.json
  def create
    @colaborador = Colaborador.new(params[:colaborador])

    respond_to do |format|
      if @colaborador.save
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully created.' }
        format.json { render json: @colaborador, status: :created, location: @colaborador }
      else
        format.html { render action: "new" }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /colaboradors/1
  # PUT /colaboradors/1.json
  def update
    @colaborador = Colaborador.find(params[:id])

    respond_to do |format|
      if @colaborador.update_attributes(params[:colaborador])
        format.html { redirect_to @colaborador, notice: 'Colaborador was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @colaborador.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /colaboradors/1
  # DELETE /colaboradors/1.json
  def destroy
    @colaborador = Colaborador.find(params[:id])
    @colaborador.destroy

    respond_to do |format|
      format.html { redirect_to colaboradors_url }
      format.json { head :no_content }
    end
  end
end
