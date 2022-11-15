# frozen_string_literal: true

class RkController < ApplicationController
  before_action :set_original_arr, only: :view
  before_action :validate_empty, only: :view 
  before_action :validate_last, only: :view
  before_action :validate_alphabet, only: :view
  before_action :validate_array, only: :view
  before_action :validate_all, only: :view
  
  def input 
  end

  def set_original_arr
    @original_array = params[:array]
    @k = params[:k].to_i
  end

  def validate_alphabet
    flash[:notice] = 'Не должно быть букв' unless !@original_array.match?(/[A-Za-z]/).nil?
  end
  
  def validate_last
    flash[:notice] = 'Последний символ должен быть числом' unless @original_array.match(/\DZ/).nil?
  end

  def validate_empty
    flash[:notice] = 'Массив не должен быть пустым' unless @original_array.length != 0
  end

  def validate_array
    flash[:notice] = 'Должны быть массив через пробел' unless !(@original_array.match(/^[\d -]+$/).nil?)
  end

  def validate_all
    redirect_to home_path unless flash.empty?
  end
  
  def view

    @original_array = @original_array.split(' ').map(&:to_i)
    @transformed_array = transform(@original_array.clone, @k)
  end

  private

  def transform(array, k)
    array[array.index(array.min)], array[array.index(array.max)], array[k] = array.max, array.min, array.max + array.min
    array
  end
end
