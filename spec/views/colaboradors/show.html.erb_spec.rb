require 'spec_helper'

describe "colaboradors/show" do
  before(:each) do
    @colaborador = assign(:colaborador, stub_model(Colaborador,
      :nome => "Nome",
      :matricula => "Matricula",
      :cargo => "Cargo"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Nome/)
    rendered.should match(/Matricula/)
    rendered.should match(/Cargo/)
  end
end
