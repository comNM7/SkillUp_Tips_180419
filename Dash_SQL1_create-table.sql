use test; -- "tadash_201709"データベースへ接続


-- "button_info"テーブル作成
create table button_info (
	button_color int, 
	item_id int, 
	primary key (button_color)  -- object_numカラムを主キーに設定
	) ENGINE=InnoDB default charset=utf8mb4;



-- "dash_button"テーブル作成
create table order_history (
	history_id int, 
	item_id int, 
	event_name varchar(10), 
	event_data DATETIME, 
	primary key (history_id)
	) ENGINE=InnoDB default charset=utf8mb4;
	


-- "dash_history"テーブルを作成
create table item_info (
	item_id int,  -- 履歴ID(レコードを追加する時に割り当てる一意な番号)
	item_name varchar(20), 
	item_place varchar(20), 
	is_ordering boolean,  -- レコード登録日時
	primary key (item_id)  -- -- history_numカラムを主キーに設定
	) ENGINE=InnoDB default charset=utf8mb4;


create table ta_info (
	ta_id int,
	ta_name varchar(255), 
	ta_email varchar(255),
	primary key (ta_id)
	) ENGINE=InnoDB default charset=utf8mb4;


-- "dash_button"テーブルのobject_numカラムが、"dash_objinfo"テーブルのobject_numカラムを参照するように設定する。
-- ALTER TABLE テーブル名 ADD FOREIGN KEY (制約を張りたいカラム) REFERENCES 張りたいテーブル(張りたいカラム);

alter table button_info add foreign key (item_id) references item_info(item_id);

alter table order_history add foreign key (item_id) references item_info(item_id);
