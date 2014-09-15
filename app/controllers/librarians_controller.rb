class LibrariansController < ApplicationController
  before_action :set_librarian, only: [:show, :edit, :update, :destroy]

  def index
    @librarians = Librarian.all
  end

  def new
    @librarian = Librarian.new
  end

  def create
    @librarian = Librarian.new(librarian_params)
    if @librarian.save
      redirect_to @librarian, notice: "Reader successfully created!"
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
    if @librarian.update(librarian_params)
      redirect_to @librarian, notice: "Reader successfully updated!"
    else
      flash.now[:error] = "Can't save sorry:("
      render :edit
    end
  end

  def destroy
    @librarian.destroy
    redirect_to librarian_path, notice: "Reader successfully destroyed!"
  end

  private
    def set_librarian
      @librarian = Librarian.find(params[:id])
    end

    def librarian_params
      params.require(:librarian).permit(:name, :birth_date)
    end

end
