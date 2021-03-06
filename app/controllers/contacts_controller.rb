class ContactsController < ApplicationController
  before_action :set_contact, only: [:show, :edit, :update, :destroy, :delete]
  before_action :set_address_book
  # GET /contacts
  # GET /contacts.json
  def index
    @contacts = @address_book.contacts
    @contacts.order(:first_name)
  end

  # GET /contacts/1
  # GET /contacts/1.json
  def show
  end

  # GET /contacts/new
  def new
    @contact = Contact.new
  end

  # GET /contacts/1/edit
  def edit
  end

  # POST /contacts
  # POST /contacts.json
  def create
    @contact = @address_book.contacts.new(contact_params)
    @contact.address_book_id = @address_book.id
    @contact.user_id = current_user.id

    respond_to do |format|
      if @contact.save
        format.html { redirect_to address_book_contacts_path(@address_book), notice: 'Contact was successfully created.' }
        format.json { render :show, status: :created, location: @address_book }
      else
        format.html { render :new }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /contacts/1
  # PATCH/PUT /contacts/1.json
  def update
    respond_to do |format|
      if @contact.update(contact_params)
        format.html { redirect_to address_book_contacts_path(@address_book), notice: 'Contact was successfully updated.' }
        format.json { render :show, status: :ok, location: @address_book }
        format.js
      else
        format.html { render :edit }
        format.json { render json: @contact.errors, status: :unprocessable_entity }
        format.js
      end
    end
  end

  # DELETE /contacts/1
  # DELETE /contacts/1.json
  def destroy
    @contact.destroy
    respond_to do |format|
      format.html { redirect_to address_book_contacts_url, notice: 'Contact was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def delete

  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_contact
      @contact = Contact.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def contact_params
      params.require(:contact).permit(:first_name, :last_name, :phone_number, :email, :is_favorite)
    end

    def set_address_book
      @address_book = current_user.address_books.find(params[:address_book_id])
    end
end
