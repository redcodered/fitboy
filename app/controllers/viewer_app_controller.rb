class ViewerAppController < ApplicationController
  def app
  end
  
  def test
    render json: { test: 'hi' }
  end
end