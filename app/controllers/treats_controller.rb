# encoding: UTF-8
class TreatsController < ApplicationController


def eatit
  treat = Treat.find(params[:id])
  treat.done = true
  treat.save
  redirect_to root_path
end

end