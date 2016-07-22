class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index #this matches app/views/products/index.html.erb
    if Rails.env.development?
      if params[:q]
        search_term = params[:q]
        @products = Product.where("name LIKE ?", "%#{search_term}%")
      else
        @products = Product.all
      end 
    else
      if params[:q]
        search_term = params[:q]
        @products = Product.where("name ilike ?", "%#{search_term}%")
      else
        @products = Product.all
      end
    end
    @products_featured = Product.limit(3)
  end

  # GET /products/1
  # GET /products/1.json
  def show #this matches app/views/products/show.html.erb
    @comments = @product.comments.order("created_at DESC").paginate(:page =>params[:page], :per_page=>3)
  end

  # GET /products/new
  def new #this matches app/views/products/new.html.erb
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: 'Product was successfully created.' }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: 'Product was successfully updated.' }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: 'Product was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:name, :category, :description, :image_url, :color, :price)
    end
end
