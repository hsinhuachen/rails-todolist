class Mission < ApplicationRecord
	belongs_to :user
	default_scope -> { order('sorting ASC').order('status ASC') }

	scope :pending, -> { Mission.where(:status => 0) }
	scope :progress, -> { Mission.where(:status => 1) }
	scope :finish, -> { Mission.where(:status => 2) }

	SORTING = [["急",0],["中",1],["低",2]]
	STATUS = [["待處理",0],["進行中",1],["已完成",2]]
end
