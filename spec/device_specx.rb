require 'spec_helper'

describe "Device" do

  before(:all) do
    @devicexml = Device.new
  end

  it "should get all names as an array" do
    expect(@devicexml.get_all_names).to be_kind_of(Array)
  end

  it "should get all notes as an array" do
    expect(@devicexml.get_all_notes).to be_kind_of(Array)
  end

  it "should get notes and names as an array" do
    expect(@devicexml.get_notes_and_names).to be_kind_of(Array)
  end
end
