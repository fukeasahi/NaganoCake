class Item < ApplicationRecord
	attachment :image # ここを追加（_idは含めません）
	enum sales_status: { 売り切れ: false, 販売中: true }
	belongs_to :genre
	has_many :cart_items, dependent: :destroy
	has_many :order_details, dependent: :destroy

	def self.search(search)
      if search
        Item.where(['name LIKE ?', "%#{search}%"])
      else
        Item.none
      end
    end

end
