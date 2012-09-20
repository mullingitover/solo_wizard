require 'spec_helper'

describe SoloistScriptsController do

  describe "GET new" do
    it "should assign @soloist_script" do
      get :new
      assigns(:soloist_script).should be_instance_of(SoloistScript)
    end
  end

  describe "POST create" do
    before do
      @recipe1 = FactoryGirl.create :recipe, :name => "abc"
      @recipe2 = FactoryGirl.create :recipe, :name => "def"
    end

    context "with valid params" do
      before do
        @params =  {:soloist_script => {:recipe_ids => [@recipe1.id, @recipe2.id] }}
      end

      it "should create a soloist script" do
        lambda {
          post :create, @params
        }.should change(SoloistScript, :count).by(1)
      end

      it "should create 2 recipes for the soloist script" do
        lambda {
          post :create, @params
        }.should change(RecipeSelection, :count).by(2)

        recipes = assigns(:soloist_script).recipes
        recipes.sort_by(&:name).should == [@recipe1, @recipe2]
      end

      it "should redirect to the show page" do
        post :create, @params
        response.should redirect_to soloist_script_path(assigns(:soloist_script))
      end
    end
  end

  describe "GET show" do
    before do
      @recipe1 = FactoryGirl.create :recipe, :name => "abc"
      @recipe2 = FactoryGirl.create :recipe, :name => "def"

      @soloist_script = FactoryGirl.create :soloist_script
      @soloist_script.recipe_ids = [@recipe1.id, @recipe2.id]
      @soloist_script.save!
    end

    context "with a valid soloist_script uid" do
      context "with an html format" do
        it "should render successfully" do
          get :show, :id => @soloist_script
          response.should be_success
        end
      end

      context "with an sh format" do
        render_views
        it "should render successfully" do
          get :show, :id => @soloist_script, :format => :sh
          response.should be_success
        end

        it "should contain the recipes" do
          get :show, :id => @soloist_script, :format => :sh
          response.body.should include("gem install soloist")
          response.body.should include("- abc")
          response.body.should include("- def")
        end
      end
    end

    context "with an invalid soloist_script uid" do
      it "should raise an active record not found" do
        lambda {
          get :show, :id => 555
        }.should raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end