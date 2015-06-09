class Product < ActiveRecord::Base
    validates :title, :description, :image_url, presence: true
    validates :price , :numericality => {:greater_than_or_equal_to => 0.01}
    validates :title, :uniqueness => true
    
    has_many :line_items
    before_destroy :ensure_not_referenced_by_any_line_item
    
    def ensure_not_referenced_by_any_line_item
        if line_items.count.zero?
                return true
            else
                errors.add(:base, "Line Items presents")
                return false
            end
        end
        

end
