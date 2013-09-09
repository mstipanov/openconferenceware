require 'spec_helper'

describe "/tracks/edit.html.erb" do
  include TracksHelper
  
  before(:each) do
    @event = stub_current_event!
    @track = stub_model(Track,
      :title => "value for title",
      :event => @event
    )
    assign(:track, @track)
  end

  it "should render edit form" do
    render "/tracks/edit.html.erb"
    
    response.should have_selector("form[action='#{track_path(@track)}'][method='post']") do |node|
      node.should have_selector("input#track_title[name='track[title]']")
      node.should have_selector("textarea#track_description[name='track[description]']")
    end
  end
end


