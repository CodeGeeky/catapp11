class CitemsController < ApplicationController
  def add
    @citem = Citem.new
  end
end
