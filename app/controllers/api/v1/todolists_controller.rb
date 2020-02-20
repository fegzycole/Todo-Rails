class Api::V1::TodolistsController < ApplicationController
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
    @todolist = Todolist.find(params[:id])

    @todolist.update(todo_update_params)

    respond_to do |format|
      if @todolist.save
        format.json { render json: @todolist, status: :created }
      else
        format.json { render json: @todolist.errors, status: :unprocessable_entity }
      end
    end
  end

  def todo_params
    params.require(:todolist).permit(:title, :user_id)
  end

  def todo_update_params
    params.require(:todolist).permit(:title)
  end
end
