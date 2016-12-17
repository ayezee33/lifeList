class ListsController < ApplicationController
  before_action :set_list, only: [:show, :edit, :update, :destroy]

# GET /lists
# GET /lists.json
def index
  @lists = List.all
end

# GET /lists/1
# GET /lists/1.json
def show
end

# GET /lists/new
def new
  @lists = List.new
end

# GET /lists/1/edit
def edit
end

# POST /lists
# POST /lists.json
def create
  @lists = List.new(list_params)

  respond_to do |format|
    if @lists.save
      format.html { redirect_to @lists, notice: 'Life list was successfully created.' }
      format.json { render :show, status: :created, location: @lists }
    else
      format.html { render :new }
      format.json { render json: @lists.errors, status: :unprocessable_entity }
    end
  end
end

# PATCH/PUT /lists/1
# PATCH/PUT /lists/1.json
def update
  respond_to do |format|
    if @lists.update(list_params)
      format.html { redirect_to @lists, notice: 'Life list was successfully updated.' }
      format.json { render :show, status: :ok, location: @lists }
    else
      format.html { render :edit }
      format.json { render json: @lists.errors, status: :unprocessable_entity }
    end
  end
end

# DELETE /lists/1
# DELETE /lists/1.json
def destroy
  @lists.destroy
  respond_to do |format|
    format.html { redirect_to root_url, notice: 'Life list was successfully deleted.' }
    format.json { head :no_content }
  end
end

private
  # Use callbacks to share common setup or constraints between actions.
  def set_list
    @lists = List.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def list_params
    params.require(:list).permit(:title, :description)
  end
end
