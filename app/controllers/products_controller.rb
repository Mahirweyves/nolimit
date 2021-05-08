class ProductsController < ApplicationController
 before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, except: [:index, :show, :terms_and_conditions, :privacy_policy]


  # GET /products or /products.json
   def index
      

    @categories = Category.all    

    cate = params[:cate]

    if cate.present?
      @products = Product.where(:category_id => cate).paginate(:page => params[:page], per_page: 2).order('created_at desc')
     else
      @products = Product.paginate(:page => params[:page], per_page: 6).order('created_at desc')
    end
# if params[:search]
#       @search_term = params[:search]
#       @products= @products.search_by(@search_term)
#     end
  end

  # GET /products/1 or /products/1.json
  def show
     @categories = Category.all 
  end

  # GET /products/new
  def new
    @product = current_user.products.build
    @categories = Category.all 
  end

  # GET /products/1/edit
  def edit
    @categories = Category.all 
  end

  # POST /products or /products.json
 def create
    @product = current_user.products.build(product_params)
    @categories = Category.all   
 
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json
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

  # DELETE /products/1 or /products/1.json
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
      @product = Product.friendly.find(params[:id])
      @categories = Category.all 
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:name, :address, :price, :description, :company_name, :available_date, :telephone_number, :link, :category_id, :user_id, images: [])
    end
end
