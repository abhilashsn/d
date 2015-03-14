class KeywordsController < ApplicationController
  include SegmentSupport
  before_action :set_keyword, :load_keywords, only: [:edit, :update, :destroy]
  # before_action :current_sub_seg, only: [:edit, :update, :destroy]
  # before_action :require_login, :reload_on_published

  def edit
   #@keyword = Keyword.find(params[:id])
    load_keywords
  end

  # # POST /keywords
  def create
    @keyword = Keyword.new(keyword_params)
    #@keyword.segment_detail_id = current_sub_seg.id
    flash[:notice] = 'Keyword was successfully reset'
    unless params[:commit] == 'RESET'
      if @keyword.save
        #@keyword.assign_user(current_user)
        flash[:notice] = 'Keyword was successfully created.'
        @keyword = Keyword.new
      end
    end
    load_keywords
    render 'create_or_update'
  end

  # PATCH/PUT /keywords/1
  def update
   # @keyword = Keyword.find(params[:id])
    #@keyword.segment_detail_id = current_sub_seg.id
    flash[:notice] = 'Keyword was successfully reset'
    unless params[:commit] == 'RESET'
      if @keyword.update(keyword_params)
       # @keyword.assign_user(current_user)
        flash[:notice] = 'Keyword was successfully updated.'
        @keyword = Keyword.new
      end
    end
    load_keywords
    render 'create_or_update'
  end

  # DELETE /keywords/1
  def destroy
   # @keyword = Keyword.find(params[:id])
    @keyword.destroy
    flash[:notice] = 'Keyword was successfully deleted.'
    @keyword = Keyword.new
    load_keywords
    render 'create_or_update'
  end

  private
  def load_keywords
    @keywords = Keyword.all
  end

  # Use callbacks to share common setup or constraints between actions.
  def set_keyword
    @keyword = Keyword.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def keyword_params
    params.require(:keyword).permit(:keyword_value, :segment_id, :segment_detail_id).merge(party: current_party)
  end
end
