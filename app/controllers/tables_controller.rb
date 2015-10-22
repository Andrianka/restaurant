class TablesController < ApplicationController

  def index
    @tables = Table.all
  end

  def show
    @table = Table.find(params[:id])
  end

  def new
    @table = Table.new
  end

  def create
    @table = Table.new(table_params)
    if @table.save
      redirect_to table_path(@table)
    else
      render :new
    end
  end

  def update
    @table = Product.find(params[:id])
    if @table.update_attributes(table_params)
      redirect_to table_path(@table)
    else
      render :show
    end
  end

  def destroy
    @table = Table.find(params[:id])
    if @table.destroy
      redirect_to tables_path
    end
  end

  private

  def table_params
    params.require(:table).permit(:nr, :quantity)
  end
end
