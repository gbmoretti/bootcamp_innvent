require 'spec_helper'

describe "colaboradors/new" do
  before(:each) do
    assign(:colaborador, stub_model(Colaborador,
      :nome => "MyString",
      :matricula => "MyString",
      :cargo => "MyString"
    ).as_new_record)
  end

  it "renders new colaborador form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", colaboradors_path, "post" do
      assert_select "input#colaborador_nome[name=?]", "colaborador[nome]"
      assert_select "input#colaborador_matricula[name=?]", "colaborador[matricula]"
      assert_select "input#colaborador_cargo[name=?]", "colaborador[cargo]"
    end
  end
end
