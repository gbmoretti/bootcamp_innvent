require 'spec_helper'

describe "colaboradors/edit" do
  before(:each) do
    @colaborador = assign(:colaborador, stub_model(Colaborador,
      :nome => "MyString",
      :matricula => "MyString",
      :cargo => "MyString"
    ))
  end

  it "renders the edit colaborador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", colaborador_path(@colaborador), "post" do
      assert_select "input#colaborador_nome[name=?]", "colaborador[nome]"
      assert_select "input#colaborador_matricula[name=?]", "colaborador[matricula]"
      assert_select "input#colaborador_cargo[name=?]", "colaborador[cargo]"
    end
  end
end
