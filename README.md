# Rails todolist

* 建立使用者登入
* 建立任務

#### 建立任務模組
	rails g model mission item:string duedate:text
	rails g migration add_column_to_mission user_id:integer

#### 增加任務欄位
增加設定優先順序、目前狀態  
	rails g migration add_column_to_mission2 sorting:string status:string
	rails g migration change_column_to_mission
