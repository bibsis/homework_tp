require 'csv' 
require 'linear-regression' 
class ApplicationController < ActionController::Base
  protect_from_forgery with: :null_sessions
  
def calc
  app = params[:file].read
  m = CSV.parse(app)
  i = 0
  sum = 0
  while i < m.length do 
  sum = sum + m[i][0].to_i
  i+=1
  end
  render plain: '%.2f'%sum.ceil
end

def second 
  app = params[:file].read
  m = CSV.parse(app)
  i = 0
  sum = 0
  while i < m.length do 
  if m[i][2].to_i % 2 != 0
  sum = sum + m[i][1].to_i
  end
  i+=1
  end
  render plain: '%.2f'%sum.ceil
end

def thirty
  app = params[:file].read
  m = CSV.parse(app)
  i = 0
  p = 0
  sum = 0
  max = 0
  while i < m.length do 
   while p < 30 do 
   sum = sum + m[i+p][0].to_i
   p+=1
   end
  if(sum > max) 
  max = sum 
  end
  i+=1
  end
  render plain: '%.2f'%max.ceil
end

def lin
  app = params[:file].read
  m = CSV.parse(app)
  i = 1
  k = 0
  ind = []
  values = []
  while(i <= m.length)
  ind[i-1] = i
  end
  while(k < m.length)
  values[k][0] = k
  end
  l = Regression::Linear.new(ind, values)
  b = linear.intercept
  a = linear.slope
  render plain: "#{'%.6f' % a},#{'%.6f' % b}"
  end
  end

