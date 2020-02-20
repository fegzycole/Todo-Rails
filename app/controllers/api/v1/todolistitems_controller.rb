class Api::V1::TodolistitemsController < ApplicationController
  def create
    @todo_list_item = Todolistitem.new(todo_item_params)

    respond_to do |format|
      if @todo_list_item.save
        format.json { render json: @todo_list_item, status: :created }
      else
        format.json { render json: @todo_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    @todo_list_item = Todolistitem.find(params[:id])

    @todo_list_item.update(todo_item_update_params)

    respond_to do |format|
      if @todo_list_item.save
        format.json { render json: @todo_list_item, status: :created }
      else
        format.json { render json: @todo_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def todo_item_params
    params.require(:todolistitem).permit(:name, :completed, :todolist_id)
  end

  def todo_item_update_params
    params.require(:todolistitem).permit(:name, :completed)
  end
end
