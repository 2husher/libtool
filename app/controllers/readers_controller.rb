class ReadersController < ApplicationController
  before_action :set_reader, only: [:show, :edit, :update, :destroy]

  def index
    @readers = Reader.paginate(page: params[:page])
  end

  def new
    @reader = Reader.new
  end

  def create
    @reader = Reader.new(reader_params)
    @reader.date_of_registration = Date.today
    @reader.reader_card_id = set_reader_card_id

    if @reader.save
      redirect_to @reader, notice: "Reader successfully created!"
    else
      flash.now[:error] = "Can't save sorry:("
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    @reader.date_of_registration = Date.today
    #@reader.reader_card_id = set_reader_card_id

    if @reader.update(reader_params)
      #debugger
      redirect_to @reader, notice: "Reader successfully updated!"
    else
      flash.now[:error] = "Can't save sorry:("
      render :edit
    end
  end

  def destroy
    @reader.destroy
    #debugger
    redirect_to readers_url, notice: "Reader successfully destroyed!"
  end

  def debtors
    @readers = Reader.includes(:books).where("books.returning_date < ?", Date.today).paginate(page: params[:page])
  end

  private
    def set_reader
      @reader = Reader.find(params[:id])
    end

    def reader_params
      params.require(:reader).permit(:first_name, :middle_name, :last_name, :date_of_birth,
                                     :home_phone, :street, :home_number, :building, :flat_number,
                                     :profession_notes)
    end

    def set_reader_card_id
      reader_card_max = Reader.maximum(:reader_card_id)
      if reader_card_max.nil?
          reader_card_id = "0000"
      else
          reader_card_id = sprintf("%04d", reader_card_max.to_i + 1)
      end
    end
end
