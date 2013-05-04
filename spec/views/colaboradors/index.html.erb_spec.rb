require 'spec_helper'

describe "colaboradors/index" do
  before(:each) do
    assign(:colaboradors, [
      stub_model(Colaborador,
        :nome => "Nome",
        :matricula => "Matricula",
        :cargo => "Cargo"
      ),
      stub_model(Colaborador,
        :nome => "Nome",
        :matricula => "Matricula",
        :cargo => "Cargo"
      )
    ])
  end

  it "renders a list of colaboradors" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Nome".to_s, :count => 2
    assert_select "tr>td", :text => "Matricula".to_s, :count => 2
    assert_select "tr>td", :text => "Cargo".to_s, :count => 2
  end
end
