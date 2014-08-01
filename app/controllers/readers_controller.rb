class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]

  def index
    @readers = Reader.order(:name)
  end

  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)
    if @reader.save
      redirect_to @reader
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @reader.update(reader_params)
      redirect_to @reader
    else
      render :edit
    end
  end

  def destroy
    @reader.destroy
    redirect_to readers_path
  end

  private
    def set_reader
      @reader = Reader.find(params[:id])
    end

    def reader_params
      params.require(:reader).permit(:name, :reader_card_id, :birthday, :notes, :address)      
    end
end
