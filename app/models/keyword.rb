class Keyword < ActiveRecord::Base
 # include Segmentable                  # required
  # belongs_to :segment
  # default_scope { order('created_at DESC') }

  # validates :keyword, presence: true,
  #           length: { maximum: 150 },
  #           uniqueness: {if: :unique_keyword?}

  # def unique_keyword?
  #   keywords = party.keywords(segment_detail.segn_code, segment_detail.segn_type)
  #   unless keywords.blank?
  #     keywords.map(&:keyword).include?(keyword)
  #   else
  #     false
  #   end
  # end
end