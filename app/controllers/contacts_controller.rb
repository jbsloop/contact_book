class ContactsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_address_book
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :delete]

  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = @address_book.contacts
    @contacts.order(:first_name)
    @address_books = current_user.address_books
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = @address_book.contacts.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @address_book.contacts.new(contact_params)

    respond_to do |format|
      if @contact.save
        format.html { redirect_to @address_book, notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @contact }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to @address_book, notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @contact }
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to @address_book, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = @address_book.contacts.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :address, :address_book_id)
    end
    def set_address_book
      @address_book = current_user.address_books.find(params[:address_book_id])
    end
end
