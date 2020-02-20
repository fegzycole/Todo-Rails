class Api::V1::TodolistitemsController < ApplicationController
  before_action :set_todolist_item, only: %i[update destroy]

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
    @todo_list_item.update(todo_item_update_params)

    respond_to do |format|
      if @todo_list_item.save
        format.json { render json: @todo_list_item, status: :created }
      else
        format.json { render json: @todo_list_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @todo_list_item.destroy

    respond_to do |format|
      format.json { render json: { message: 'Todolist successfully deleted' }, status: :created }
    end
  end

  private

  def todo_item_params
    params.require(:todolistitem).permit(:name, :completed, :todolist_id)
  end

  def todo_item_update_params
    params.require(:todolistitem).permit(:name, :completed)
  end

  def set_todolist_item
    @todo_list_item = Todolistitem.find(params[:id])
  end
end
