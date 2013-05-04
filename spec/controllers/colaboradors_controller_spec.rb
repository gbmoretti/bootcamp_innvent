require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe ColaboradorsController do

  # This should return the minimal set of attributes required to create a valid
  # Colaborador. As you add validations to Colaborador, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { { "nome" => "MyString" } }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ColaboradorsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET index" do
    it "assigns all colaboradors as @colaboradors" do
      colaborador = Colaborador.create! valid_attributes
      get :index, {}, valid_session
      assigns(:colaboradors).should eq([colaborador])
    end
  end

  describe "GET show" do
    it "assigns the requested colaborador as @colaborador" do
      colaborador = Colaborador.create! valid_attributes
      get :show, {:id => colaborador.to_param}, valid_session
      assigns(:colaborador).should eq(colaborador)
    end
  end

  describe "GET new" do
    it "assigns a new colaborador as @colaborador" do
      get :new, {}, valid_session
      assigns(:colaborador).should be_a_new(Colaborador)
    end
  end

  describe "GET edit" do
    it "assigns the requested colaborador as @colaborador" do
      colaborador = Colaborador.create! valid_attributes
      get :edit, {:id => colaborador.to_param}, valid_session
      assigns(:colaborador).should eq(colaborador)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Colaborador" do
        expect {
          post :create, {:colaborador => valid_attributes}, valid_session
        }.to change(Colaborador, :count).by(1)
      end

      it "assigns a newly created colaborador as @colaborador" do
        post :create, {:colaborador => valid_attributes}, valid_session
        assigns(:colaborador).should be_a(Colaborador)
        assigns(:colaborador).should be_persisted
      end

      it "redirects to the created colaborador" do
        post :create, {:colaborador => valid_attributes}, valid_session
        response.should redirect_to(Colaborador.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved colaborador as @colaborador" do
        # Trigger the behavior that occurs when invalid params are submitted
        Colaborador.any_instance.stub(:save).and_return(false)
        post :create, {:colaborador => { "nome" => "invalid value" }}, valid_session
        assigns(:colaborador).should be_a_new(Colaborador)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Colaborador.any_instance.stub(:save).and_return(false)
        post :create, {:colaborador => { "nome" => "invalid value" }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested colaborador" do
        colaborador = Colaborador.create! valid_attributes
        # Assuming there are no other colaboradors in the database, this
        # specifies that the Colaborador created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Colaborador.any_instance.should_receive(:update_attributes).with({ "nome" => "MyString" })
        put :update, {:id => colaborador.to_param, :colaborador => { "nome" => "MyString" }}, valid_session
      end

      it "assigns the requested colaborador as @colaborador" do
        colaborador = Colaborador.create! valid_attributes
        put :update, {:id => colaborador.to_param, :colaborador => valid_attributes}, valid_session
        assigns(:colaborador).should eq(colaborador)
      end

      it "redirects to the colaborador" do
        colaborador = Colaborador.create! valid_attributes
        put :update, {:id => colaborador.to_param, :colaborador => valid_attributes}, valid_session
        response.should redirect_to(colaborador)
      end
    end

    describe "with invalid params" do
      it "assigns the colaborador as @colaborador" do
        colaborador = Colaborador.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Colaborador.any_instance.stub(:save).and_return(false)
        put :update, {:id => colaborador.to_param, :colaborador => { "nome" => "invalid value" }}, valid_session
        assigns(:colaborador).should eq(colaborador)
      end

      it "re-renders the 'edit' template" do
        colaborador = Colaborador.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Colaborador.any_instance.stub(:save).and_return(false)
        put :update, {:id => colaborador.to_param, :colaborador => { "nome" => "invalid value" }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested colaborador" do
      colaborador = Colaborador.create! valid_attributes
      expect {
        delete :destroy, {:id => colaborador.to_param}, valid_session
      }.to change(Colaborador, :count).by(-1)
    end

    it "redirects to the colaboradors list" do
      colaborador = Colaborador.create! valid_attributes
      delete :destroy, {:id => colaborador.to_param}, valid_session
      response.should redirect_to(colaboradors_url)
    end
  end

end
