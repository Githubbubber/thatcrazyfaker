require 'faker'

class PostsController < ApplicationController
  before_action :set_post, only: [:show]

  def index
    @posts = Post.all
  end

  def show
    @post = Post.find(params[:id])
    # debugger
  end

  def new
  end

  def create
      # byebug
      if params[:commit] == "Hipster"
          # Title field
          fhs   = Faker::Hipster.sentence.gsub(/[.]/, "").titleize
          # Author field
          fnfn  = Faker::Name.first_name.capitalize + ", hipster clone"
          # Content field
          fhp   = "\"" + Faker::Hipster.paragraphs.join(" ") + "\""
          
          # Add post to db
          @post = Post.new(title: fhs, author: fnfn, content: fhp)
      elsif params[:commit] == "Hacker"
          # Title field
          fha   = Faker::Hacker.adjective.gsub(/[.]/, "").split.map(&:capitalize)*' '
          # Author field
          fnfn2 = Faker::Name.first_name.capitalize + ", hacker whiz"
          # Content field
          fhsss = "\"" + Faker::Hacker.say_something_smart.capitalize + "\""

          # Add post to db
          @post = Post.new(title: fha, author: fnfn2, content: fhsss)
      elsif params[:commit] == "Star Wars"
          # Title field
          swq   = "A Star Wars Quote"
          # Author field
          fswc  = Faker::StarWars.character
          # Content field
          fswq  = "\"" + Faker::StarWars.quote.capitalize + "\""
          # Add post to db
          @post = Post.new(title: swq, author: fswc, content: fswq)
          
      # byebug
          respond_to do |format|
              if @post.save
                format.html { redirect_to @post, notice: 'Post was successfully created.' }
                format.json { render :show, status: :created, location: @post }
              else
                format.html { render :new }
                format.json { render json: @post.errors, status: :unprocessable_entity }
              end
          end
      end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    # def post_params
    #   params.require(:post).permit(:title, :author, :content)
    # end
end
