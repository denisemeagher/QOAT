class Quote < ApplicationRecord
	has_one :author

  before_create :build_associations
  attr_accessor :author_name


  def as_json(options={})
    hash = super(:only => [:id,:body,:category,:tags,:terms,:source],
      :methods => [],
      :include => {
        :author => {:only => [:name,:description,:avatar]}
      }
    )
    remove_all_nil_fields(hash,["author"])
  end



  private
    def remove_all_nil_fields(obj,fields=[])
      fields.each do |field|
        obj[field].reject! { |_,v| v.blank? || _.nil? }
      end
      obj.reject! { |_,v| v.blank? }
    end

    def build_associations
      a = build_author
      a.name = self.author_name
    end
end
