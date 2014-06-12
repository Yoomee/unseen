class DocumentsController < ApplicationController
  load_and_authorize_resource

  def create
    if @document.save
      redirect_to documents_path, :notice => 'Document was successfully created.'
    else
      render :new
    end
  end

  def destroy
    @document.destroy
    redirect_to documents_path
  end

  def edit
  end

  def index
    @documents = @documents.order('created_at DESC').paginate(:page => params[:page], :per_page => 20)
  end

  def new
  end

  def show
    send_file(@document.file.path, :filename => "#{@document.name}.#{@document.file.ext}")
  end

  def update
    if @document.update_attributes(params[:document])
      redirect_to documents_path, notice: 'Document was successfully updated.'
    else
      render :edit
    end
  end

end
