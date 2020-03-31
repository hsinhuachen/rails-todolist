class Mission < ApplicationRecord
	belongs_to :user
	default_scope -> { order('sorting ASC').order('status ASC') }

	SORTING = [["急",0],["中",1],["低",2]]
	STATUS = [["待處理",0],["進行中",1],["已完成",2]]
end
