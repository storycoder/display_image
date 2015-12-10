class GalleriesController < ApplicationController

	def index
		@galleries = Gallery.all
	end

	def show
		@gallery = Gallery.find(params[:id])
	end

	def new
		@gallery = Gallery.new
	end

	def edit
		@gallery = Gallery.find(params[:id])
	end

	def create
		@gallery = Gallery.new(gallery_params)

		if @gallery.save
			redirect_to @gallery, notice: 'Gallery created successfully'
		else
			render :new
		end
	end

	def update
		@gallery = Gallery.find(params[:id])

		if @gallery.update(params[:gallery].permit(:pic, :description, :photo))
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_path, notice: 'Post deleted successfully'
	end

	private

		def gallery_params
			params.require(:gallery).permit(:pic, :description, :photo)
		end
end
