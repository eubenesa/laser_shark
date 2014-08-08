require 'spec_helper'

describe Activity do

  it "has a valid factory" do
    expect(build(:activity)).to be_valid
  end

  it "should be invalid without name" do
    activity = build(:activity, name: nil)
    expect(activity).to be_invalid
    expect(activity).to have(1).errors_on(:name)
  end

  it "should be invalid without day" do
    activity = build(:activity, day: nil)
    expect(activity).to be_invalid
    expect(activity).to have(1).errors_on(:day)
  end

  it "should calculate the end time of an activity" do
    activity = create(:activity, start_time: 900, duration: 90)
    activity.end_time.should eql 1030

    activity = create(:activity, start_time: 1100, duration: 30)
    activity.end_time.should eql 1130

    activity = create(:activity, start_time: 1130, duration: 30)
    activity.end_time.should eql 1200 

    activity = create(:activity, start_time: 1130, duration: 40)
    activity.end_time.should eql 1210 
  end

  it 'should allow you to add tags' do
    activity = create(:activity)
    activity.tags[:foo] = true
    activity.tags[:bar] = true
    expect(activity.tags.keys).to include(:foo, :bar)
    # expect(activity.save).to eq(true)
    retrieve_activity = Activity.find(activity.id)
    expect(retrieve_activity.tags.keys).to include("foo", "bar")
  end

  # it "should allow you to remove tags" do
  #   activity = create(:activity, tags: {:foo => true, :bar => true})
  #   retrieve_activity = Activity.find(activity.id)
  #   retrieve_activity.tags.delete("foo")
  #   expect(retrieve_activity.tags["foo"]).to eq(nil)
  #   expect(retrieve_activity.tags.keys).to include("bar")
  #   expect(retrieve_activity.update(tags: nil)).to eq(true)
  #   expect(activity.tags).to eq(nil)
  # end

end
