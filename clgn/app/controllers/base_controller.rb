class BaseController < ApplicationController
  def get_search_params(all_params=nil)
    if(all_params)
      full_params = Hash.new
      all_params.each do |name,value|
        unless value.to_s.empty?
            full_params[name]=value
        end
      end
      return full_params
    else
      return all_params
    end
  end
end