class Admin::HomesController < ApplicationController
before_action :authenticate_admin!
  def top
    @chart = Post.group(:cpu_kind).count
    @items = RakutenWebService::Ichiba::Item.search(keyword: "Magnate IM")
    items = []
    @items.all.each {|a| items<< {name: a["itemName"], code: a["itemCode"], obj: a}}
    @items = items.select { |a| a[:code] == "f142182-ayase:10000243"}
    @items = @items.map { |a| a[:obj] }
  end

end
