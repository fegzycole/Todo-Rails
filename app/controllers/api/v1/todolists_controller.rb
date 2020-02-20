# frozen_string_literal: true

class Api::V1::TodolistsController < ApplicationController
  before_action :set_todolist, only: %i[update destroy]

  def create
    @todolist = Todolist.new(todo_params)

    respond_to do |format|
      if @todolist.save
        format.json { render json: @todolist, status: :created }
      else
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @todolist.update(todo_update_params)

    respond_to do |format|
      if @todolist.save
        format.json { render json: @todolist, status: :created }
      else
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todolist.destroy

    respond_to do |format|
      format.json { render json: { message: 'Todolist successfully deleted' }, status: :created }
    end
  end

  private

  def todo_params
    params.require(:todolist).permit(:title, :user_id)
  end

  def todo_update_params
    params.require(:todolist).permit(:title)
  end

  def set_todolist
    @todolist = Todolist.find(params[:id])

    unless @todolist
      respond_to do |format|
        format.json { render json: { error: 'id does not exist' }, status: :created }
      end
    end
  end
end
