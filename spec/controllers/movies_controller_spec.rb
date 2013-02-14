require 'spec_helper'

describe MoviesController do
  describe 'Finding movies with same director' do
    before :each do
      @fake_results = [ mock('movie1'), mock('movie2')]
    end
    it 'should call the model method that finds movies with the same director'do
      Movie.should_receive(:similar).with(1)
      post :similar, :id=>1
    end
    it 'should select the Search Results template for rendering' do
      #fake_results = [ mock('movie1'), mock('movie2') ]
      Movie.stub(:similar).and_return(@fake_results)
      post :similar, :id=>1
      response.should render_template('similar')
    end
    it 'should make the search results available to the template' do
      Movie.stub(:similar).and_return(@fake_results)
      post :similar, :id=>1
      assigns(:movies).should == @fake_results
    end
  end
end

