require 'spec_helper'

describe(Survey) do
  it 'converts the title to uppercase' do
    survey = Survey.create({:title => 'happy hour survey'})
    expect(survey.title()).to(eq("Happy hour survey"))
  end
end
