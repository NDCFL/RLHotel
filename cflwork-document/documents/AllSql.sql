create database hotelmanager default charset utf8;

use hotelmanager;
drop table IF EXISTS t_company;
create table t_company(
  id BIGINT primary key AUTO_INCREMENT,
  name VARCHAR(20) UNIQUE not null,
  represent varchar(50),
  phone varchar(11),
  tel varchar(11),
  address varchar(150),
  description varchar(500),
  create_time DATETIME,
  is_active int
)engine=innodb default charset=utf8;
insert into t_company values('1','瑞蓝酒店','陈闯','15563906390','15563906390','山东省青岛市','瑞蓝酒店是一个大型具有24个连锁酒店的公司，规模宏大	','2017-11-14 20:41:17','0');
drop table IF EXISTS t_role;
create table t_role(
  id BIGINT primary key AUTO_INCREMENT,
  title varchar(20) UNIQUE not null,
  description varchar(500),
  create_time DATETIME DEFAULT  now() not null,
  is_active TINYINT not null
)engine=innodb default charset=utf8;

drop table IF EXISTS t_user;
create table t_user(
  id BIGINT primary key AUTO_INCREMENT ,
  email VARCHAR(100) UNIQUE,
  phone VARCHAR(11) UNIQUE not NULL ,
  account_name VARCHAR(100) UNIQUE,
  password VARCHAR(100) NOT NULL ,
  nickname VARCHAR(20)  ,
  identity VARCHAR(18),
  realname VARCHAR(20)  ,
  gender TINYINT  ,
  birthday DATE  ,
  age int  ,
  address VARCHAR(150) ,
  qq VARCHAR(20),
  wechat VARCHAR(50),
  alipay VARCHAR(100),
  qq_openid VARCHAR(100) UNIQUE,
  weibo_openid VARCHAR(100) UNIQUE ,
  wechat_openid VARCHAR(100) UNIQUE ,
  headicon VARCHAR(200)  ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  company_id BIGINT not null,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_module;
create table t_module(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500) ,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_permission;
create table t_permission(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(50) NOT NULL ,
  permission VARCHAR(200) UNIQUE  NOT NULL ,
  description VARCHAR(500),
  module_id BIGINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_user_role;
create table t_user_role(
  id BIGINT primary key AUTO_INCREMENT ,
  user_id BIGINT NOT NULL,
  role_id BIGINT  NOT NULL,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (user_id) REFERENCES  t_user(id),
  FOREIGN KEY (role_id) REFERENCES  t_role(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_role_permission;
create table t_role_permission(
  id BIGINT primary key AUTO_INCREMENT ,
  role_id BIGINT,
  permission_id BIGINT,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (role_id) REFERENCES t_role(id),
  FOREIGN KEY (permission_id)  REFERENCES t_permission(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_process;
create table t_process(
  id BIGINT primary key AUTO_INCREMENT ,
  name VARCHAR(36) NOT NULL ,
  path VARCHAR(36) NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_deploy TINYINT NOT NULL ,
  deploy_time DATETIME NOT NULL ,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_contract_master;
create table t_contract_master(
  id BIGINT primary key AUTO_INCREMENT ,
  bank_name VARCHAR(50),
  bank_account_name VARCHAR(50),
  bank_account_no VARCHAR(18),
  create_time datetime default CURRENT_TIMESTAMP null,
  is_active int null,
  company_id bigint null,
  FOREIGN KEY (company_id) REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_contract;
create table t_contract(
  id BIGINT primary key AUTO_INCREMENT ,
  master_id BIGINT not null,
  company_id BIGINT not null,
  contract_contract VARCHAR(500) NOT NULL ,
  contract_years int NOT NULL ,
  contract_date DATE NOT NULL ,
  contract_no VARCHAR(100) NOT NULL ,
  min_profit DECIMAL(18,2) NOT NULL ,
  profit_rate DOUBLE NOT NULL ,
  month_pay DECIMAL(18,2) NOT NULL ,
  pay_date DATE ,
  create_time DATETIME DEFAULT  now() NOT NULL,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (master_id)  REFERENCES t_contract_master(id),
  FOREIGN KEY (company_id)REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_hotel;
create table t_hotel(
  id BIGINT primary key AUTO_INCREMENT,
  company_id BIGINT not null,
  contract_id BIGINT not null,
  hotel_manager_id BIGINT not null,
  title VARCHAR(100) not null,
  tel VARCHAR(11) not null,
  create_time DATETIME DEFAULT  now(),
  is_active TINYINT NOT NULL ,
  FOREIGN KEY (company_id) REFERENCES  t_company(id),
  FOREIGN KEY (contract_id) REFERENCES  t_contract(id),
  FOREIGN KEY (hotel_manager_id) REFERENCES t_user(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_hotel_employee;
create table t_hotel_employee(
  id BIGINT primary key AUTO_INCREMENT,
  company_id BIGINT not NULL ,
  hotel_id BIGINT not NULL ,
  user_id BIGINT not null,
  FOREIGN KEY (company_id) REFERENCES  t_company(id),
  FOREIGN KEY (hotel_id) REFERENCES  t_hotel(id),
  FOREIGN KEY (user_id) REFERENCES t_user(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_house_type;
create table t_house_type(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  company_id BIGINT not null,
  FOREIGN KEY (company_id) REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_house;
create table t_house(
  id BIGINT primary key AUTO_INCREMENT ,
  card_title VARCHAR(50) NOT NULL ,
  area DOUBLE NOT NULL ,
  unit_price DECIMAL(18,2) NOT NULL ,
  sale_price DECIMAL(18,2) NOT NULL ,
  type TINYINT NOT NULL ,
  description TEXT ,
  hotel_id BIGINT  NOT NULL ,
  shop_manager_id BIGINT NOT NULL ,
  shop_agent_id BIGINT  NOT NULL ,
  house_status TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (shop_manager_id)  REFERENCES  t_user(id),
  FOREIGN KEY (shop_agent_id) REFERENCES  t_user(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_payment_type;
create table t_payment_type(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_website;
create table t_cooperation_website(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_customer_order;
create table t_customer_order(
  id BIGINT primary key AUTO_INCREMENT ,
  company_id BIGINT not null,
  hotel_id BIGINT not null,
  shop_manager_id BIGINT  not null,
  house_id BIGINT  NOT NULL ,
  contract_id BIGINT  NOT NULL ,
  customer_name VARCHAR(200) NOT NULL ,
  customer_identity VARCHAR(200) NOT NULL ,
  customer_phone VARCHAR(11) NOT NULL ,
  customer_gender VARCHAR(20) NOT NULL ,
  customer_from TINYINT NOT NULL ,
  website_id BIGINT ,
  unit_price DECIMAL(18,2) NOT NULL ,
  total_days TINYINT NOT NULL ,
  house_pay DECIMAL(18,2) NOT NULL ,
  service_pay DECIMAL(18,2) NOT NULL ,
  deposit DECIMAL(18,2) NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  actual_return DECIMAL(18,2) NOT NULL ,
  payment_type_id BIGINT NOT NULL ,
  checkin_time DATETIME NOT NULL ,
  checkout_time DATETIME NOT NULL ,
  checkout_max_time DATETIME NOT NULL ,
  remark VARCHAR(500) ,
  order_status TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_check TINYINT NOT NULL ,
  check_remark VARCHAR(500) NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (house_id) REFERENCES  t_house(id),
  FOREIGN KEY (contract_id) REFERENCES t_contract(id),
  FOREIGN KEY (website_id) REFERENCES  t_cooperation_website(id)

)engine=innodb default charset=utf8;

drop table if EXISTS t_service_subject;
create table t_service_subject(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL,
  is_active TINYINT NOT NULL
)engine=innodb default charset=utf8;

drop table IF EXISTS t_customer_service;
create table t_customer_service(
  id BIGINT primary key AUTO_INCREMENT ,
  order_id BIGINT UNIQUE NOT NULL ,
  company_id BIGINT not null,
  hotel_id BIGINT not null,
  house_id BIGINT ,
  house_card_title VARCHAR (50) not NULL ,
  subject_id BIGINT not NULL ,
  account_type TINYINT  not NULL,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  is_pay TINYINT NOT NULL ,
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_check TINYINT NOT NULL ,
  check_remark VARCHAR(500) NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (order_id) REFERENCES t_customer_order(id),
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (house_id) REFERENCES t_house(id),
  FOREIGN KEY (subject_id) REFERENCES t_service_subject(id),
  FOREIGN KEY (hotel_id) REFERENCES  t_hotel(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cash_subject;
create table t_cash_subject(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  company_id BIGINT not null,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cash_accounts;
create table t_cash_accounts(
  id BIGINT primary key AUTO_INCREMENT ,
  company_id BIGINT not null,
  hotel_id BIGINT NOT NULL ,
  shop_manager_id BIGINT  NOT NULL ,
  account_type TINYINT NOT NULL ,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) NOT NULL ,
  subject_id BIGINT  NOT NULL ,
  description VARCHAR(500),
  remark VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  is_cash BIGINT NOT NULL ,
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (subject_id) REFERENCES t_cash_subject(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_company;
create table t_cooperation_company(
  id BIGINT primary key AUTO_INCREMENT ,
  company_id BIGINT not null,
  hotel_id BIGINT NOT NULL ,
  shop_manager_id BIGINT ,
  name VARCHAR(20) NOT NULL ,
  address VARCHAR(150) NOT NULL ,
  contact VARCHAR(20) NOT NULL ,
  tel VARCHAR(11),
  phone VARCHAR(11) NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT  now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (shop_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_subject;
create table t_cooperation_subject(
  id BIGINT primary key AUTO_INCREMENT ,
  title VARCHAR(20) UNIQUE NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  company_id BIGINT not null,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id)
)engine=innodb default charset=utf8;

drop table IF EXISTS t_cooperation_accounts;
create table t_cooperation_accounts(
  id BIGINT primary key AUTO_INCREMENT ,
  company_id BIGINT not null,
  hotel_id BIGINT NOT NULL ,
  shop_manager_id BIGINT  NOT NULL ,
  account_type TINYINT NOT NULL ,
  account_time DATETIME NOT NULL ,
  total_pay DECIMAL(18,2) not NULL ,
  subject_id BIGINT  NOT NULL ,
  description VARCHAR(500),
  remark VARCHAR(500),
  cooperation_company_id BIGINT NOT NULL ,
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (shop_manager_id) REFERENCES  t_user(id),
  FOREIGN KEY (subject_id) REFERENCES t_cooperation_company(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id)

)engine=innodb default charset=utf8;

drop table IF EXISTS t_rent_pay;
create table t_rent_pay(
  id BIGINT primary key AUTO_INCREMENT ,
  master_id BIGINT not null,
  hotel_id BIGINT not NULL ,
  company_id BIGINT not null,
  total_pay DECIMAL(18,2) NOT NULL ,
  pay_time int NOT NULL ,
  pay_type int NOT NULL ,
  pay_period_start DATE NOT NULL ,
  pay_period_end DATE NOT NULL ,
  is_cash int NOT NULL ,
  description VARCHAR(500),
  create_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  house_name VARCHAR(30) NOT NULL ,
  FOREIGN KEY (master_id) REFERENCES t_contract_master(id),
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id)
)engine=innodb default charset=utf8;


drop table IF EXISTS t_leave;
create table t_leave(
  id BIGINT primary key AUTO_INCREMENT ,
  company_id BIGINT NOT NULL ,
  hotel_id BIGINT NOT NULL ,
  hotel_manager_id BIGINT NOT NULL ,
  user_id BIGINT NOT NULL ,
  total_days TINYINT NOT NULL ,
  reason VARCHAR(100) not null,
  create_time DATETIME DEFAULT now() NOT NULL ,
  check_time DATETIME DEFAULT now() NOT NULL ,
  is_active TINYINT NOT NULL,
  FOREIGN KEY (company_id) REFERENCES t_company(id),
  FOREIGN KEY (hotel_id) REFERENCES t_hotel(id),
  FOREIGN KEY (hotel_manager_id) REFERENCES t_user(id),
  FOREIGN KEY (user_id) REFERENCES  t_user(id)
)engine=innodb default charset=utf8;
drop table IF EXISTS t_employee;
create table t_employee(
  id BIGINT PRIMARY KEY not NULL AUTO_INCREMENT,
  company_id BIGINT,
  hotel_id BIGINT,
  user_id BIGINT
)engine=innodb default charset=utf8;
drop table IF EXISTS t_house_others_item;
create table t_house_others_item(
  id BIGINT PRIMARY KEY not NULL AUTO_INCREMENT,
  company_id BIGINT,
  hotel_id BIGINT,
  house_id bigint,
  item_name VARCHAR(20),
  pay_money DECIMAL ,
  pay_time DATETIME DEFAULT now(),
  is_cash TINYINT,
  hander BIGINT,
  remark VARCHAR(300)

)engine=innodb default charset=utf8;
select t.*,(select nickname from t_user where t.hander=t_user.id) as hand,c.name,u.nickname,h.title,ho.card_title,co.contract_contract as contract,w.title as cwtitle,p.title as ptitle from t_customer_order t,t_company c,t_hotel h,t_house ho,t_contract co,t_user u,t_cooperation_website w,t_payment_type p where t.company_id=c.id and t.hotel_id=h.id and t.shop_manager_id=u.id and t.house_id=ho.id and t.contract_id=co.id and t.payment_type_id=p.id and t.website_id=w.id and  t.company_id=1 and t.hotel_id=2

select * from t_employee;

select * from t_house_others_item where company_id=1 and hotel_id=2 and house_id=2 order by pay_time desc

select * from t_house where leave_time>'2017-12-20 22:30:21'

select
  (select count(house_name) from t_rent_pay where hotel_id=2) as '2号酒店房源数houseTotal',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (day(now())+5)=day(first_pay_time)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;

select
  (select count(house_name) from t_rent_pay ) as '2号酒店房源数houseTotal',
  (select sum(total_pay) from t_rent_pay where  is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(total_pay) from t_rent_pay where  is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where  is_cash=0 and (day(now())+5)=day(first_pay_time)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(total_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where  is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(total_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(total_pay),0.0) from t_rent_pay where  is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay GROUP BY hotel_id;


select
  (select count(house_name) from t_rent_pay ) as '2号酒店房源数houseTotal',
  (select sum(first_pay) from t_rent_pay where  is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(first_pay) from t_rent_pay where  is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where  is_cash=0 and first_pay_time BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(first_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where  is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(first_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where  is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay limit 0,1

select
  (select count(house_name) from t_rent_pay where hotel_id=2) as '2号酒店房源数houseTotal',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (day(now())+5)=day(first_pay_time)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;

select
  (select count(house_name) from t_rent_pay where hotel_id=2) as '2号酒店房源数houseTotal',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (day(now())+5)=day(first_pay_time)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(sum_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;

select
  (select count(house_name) from t_rent_pay ) as '2号酒店房源数houseTotal',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=0 and (day(now())+5)=day(first_pay_time)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay GROUP BY hotel_id;


select
  (select count(house_name) from t_rent_pay ) as '2号酒店房源数houseTotal',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=0 and first_pay_time BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select sum(sum_pay) from t_rent_pay where  is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(sum_pay),0.0) from t_rent_pay where  is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay limit 0,1

select
  (select IfNULL(count(house_name),0) from t_rent_pay where hotel_id=2) as '2号酒店房源数houseTotal',
  (select IfNULL(sum(first_pay),0) from t_rent_pay where hotel_id=2 and is_cash=0) as '2号酒店待付资金dfPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and now()>first_pay_time) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(sum(total_pay)/(sum(pay_time)*12),0) from t_rent_pay where hotel_id=2) as '2号酒店平均每月monthPayMoney',
  (select IfNULL(sum(month_pay)/(count(house_name)),0) from t_rent_pay where hotel_id=2) as '2号酒店平均每间每月houseMonthPayMoney',
  (select IfNULL(sum(day_pay)/(count(house_name)),0) from t_rent_pay where hotel_id=2) as '2号酒店平均每间每天houseDayPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and first_pay_time BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select IfNULL(sum(first_pay),0) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=1 and month(now())=month(first_pay_time)) as '本月已付资金thisMonthPayAll',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and (month(now())+1)=month(first_pay_time)) as '次月待付资金nextMonthPay'

from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;


select sum(total_pay) from t_rent_pay where hotel_id=2;

select
  (select IfNULL(count(house_name),0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店房源数houseTotal',
  (select IfNULL(sum(spare_money),0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now())) as '2号酒店待付资金dfPayMoney',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店平均每间每月monthPayMoney',
  (select IfNULL(avg(month_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店平均每月monthPayMoney',
  (select IfNULL(avg(day_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店平均每月monthPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now()) and fact_pay_time BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select IfNULL(sum(datediff(date_add(fact_pay_time, interval pay_fact_time month),fact_pay_time))*avg(day_pay),0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now()) and month(now())=month(fact_pay_time)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=1 and month(now())=month(fact_pay_time)-1) as '本月已付资金thisMonthPayAll',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(first_pay_time)) as '本月待付资金thisMonthNotPay'
from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;






select
  (select IfNULL(count(house_name),0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店房源数houseTotal',
  (select IfNULL(sum(spare_money),0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now())) as '2号酒店待付资金dfPayMoney',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now()) and NOW()>facted_pay_time_start) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(avg(month_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店平均每月monthPayMoney',
  (select IfNULL(avg(day_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now())) as '2号酒店平均每间每月houseMonthPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now()) and facted_pay_time_end BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select IfNULL(sum(datediff(facted_pay_time_end,facted_pay_time_start))*avg(day_pay),0) from t_rent_pay where hotel_id=2 and is_cash=0 and year(first_pay_time)=year(now()) and month(now())=month(facted_pay_time_end)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(pay_money),0.0) from t_house_fact_pay t,t_rent_pay r where t.house_rent_id=r.id and t.house_rent_id=r.id and year(r.first_pay_time)=year(now())) as '本月已付资金thisMonthPayAll',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where hotel_id=2 and year(first_pay_time)=year(now()) and month(date_add(NOW(), interval 1 month))=month(facted_pay_time_end)) as '2号酒店次月应付nextMonthPay'
from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;

select
  (select IfNULL(count(house_name),0) from t_rent_pay where  year(first_pay_time)=year(now())) as '2号酒店房源数houseTotal',
  (select IfNULL(sum(spare_money),0) from t_rent_pay where  is_cash=0 and year(first_pay_time)=year(now())) as '2号酒店待付资金dfPayMoney',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where  year(first_pay_time)=year(now()) and NOW()>facted_pay_time_start) as '2号酒店超期未付chaoqiPayMoney',
  (select IfNULL(avg(month_pay),0.0) from t_rent_pay where  year(first_pay_time)=year(now())) as '2号酒店平均每月monthPayMoney',
  (select IfNULL(avg(day_pay),0.0) from t_rent_pay where  year(first_pay_time)=year(now())) as '2号酒店平均每间每月houseMonthPayMoney',
  (select IfNULL(sum(first_pay),0.0) from t_rent_pay where  is_cash=0 and year(first_pay_time)=year(now()) and facted_pay_time_end BETWEEN NOW() and date_add(now(), interval 5 day)) as '2号酒店近5日待付fiveDayPayMoney',
  (select IfNULL(sum(datediff(facted_pay_time_end,facted_pay_time_start))*avg(day_pay),0) from t_rent_pay where  is_cash=0 and year(first_pay_time)=year(now()) and month(now())=month(facted_pay_time_end)) as '本月应付资金thisMonthPayMoney',
  (select IfNULL(sum(pay_money),0.0) from t_house_fact_pay t,t_rent_pay r where t.house_rent_id=r.id and t.house_rent_id=r.id and year(r.first_pay_time)=year(now())) as '本月已付资金thisMonthPayAll',
  (select IfNULL(sum(month_pay),0.0) from t_rent_pay where  year(first_pay_time)=year(now()) and month(date_add(NOW(), interval 1 month))=month(facted_pay_time_end)) as '2号酒店次月应付nextMonthPay'
from t_rent_pay limit 0,1;


select
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='微信' and c.account_type=0 and month(c.create_time)=month('2017-12-5')) as wxin,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='微信' and c.account_type=1 and month(c.create_time)=month('2017-12-5')) as wxout,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='支付宝' and c.account_type=0 and month(c.create_time)=month('2017-12-5')) as zfbin,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='支付宝' and c.account_type=1 and month(c.create_time)=month('2017-12-5')) as zfbout,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='现金' and c.account_type=0 and month(c.create_time)=month('2018-1-4')) as zfbin,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='现金' and c.account_type=1 and month(c.create_time)=month('2018-1-4')) as zfbout,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='银联' and c.account_type=0 and month(c.create_time)=month('2018-1-4')) as zfbin,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and p.title='银联' and c.account_type=1 and month(c.create_time)=month('2018-1-4')) as zfbout,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and c.account_type=0 and month(c.create_time)=month('2017-12-5')) as zjin,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c,t_payment_type p where c.pay_type_id=p.id and c.account_type=1 and month(c.create_time)=month('2017-12-5')) as zjout
from t_cash_accounts GROUP BY  company_id;


select (select ifnull(sum(t.total_pay),0.0) from t_cash_accounts t where t.account_type=0 and t.description like concat('%%') and t.pay_type_id=2 and t.company_id=1 and t.hotel_id=-1 ) as sumMoneyIn,
(select ifnull(sum(t.total_pay),0.0) from t_cash_accounts t where t.account_type=1 and t.description like concat('%%') and t.pay_type_id=2 and t.company_id=1 and t.hotel_id=-1 ) as sumMoneyOut
from t_cash_accounts where company_id=1 and hotel_id=-1 GROUP BY company_id;

select
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c where c.account_type=0 and month(c.create_time)=month('2018-01-28 00:00:00.0') and c.hotel_id!=-1 and c.company_id=1 and c.hotel_id=4 ) as sumMoneyIn,
  (select ifnull(sum(c.total_pay),0.0) from t_cash_accounts c where c.account_type=1 and month(c.create_time)=month('2018-01-28 00:00:00.0') and c.hotel_id!=-1 and c.company_id=1 and c.hotel_id=4 ) as sumMoneyOut
from t_cash_accounts where company_id=1 and hotel_id!=-1  GROUP BY company_id;

<==        Row: 7, 1, 2, 7, 1, 2018-01-04 19:02:16.0, 2018-02-04 19:02:20.0, 3000.00, 2, 被套支出, 暂无批注, 2018-01-04 19:02:36.0, 0, 0, 0, 未审核, null, 97, 3, null, 15679760321, 红古轩酒店, 青岛瑞蓝铂悦酒店管理有限公司, 被套, 银联
<==        Row: 6, 1, 2, 7, 1, 2018-01-04 18:59:23.0, 2018-02-04 19:02:20.0, 3000.00, 1, 牙刷支出, 暂无批注, 2018-01-04 18:59:54.0, 0, 0, 0, 未审核, null, 97, 2, null, 15679760321, 红古轩酒店, 青岛瑞蓝铂悦酒店管理有限公司, 牙刷, 微信
<==        Row: 3, 1, 2, 7, 1, 2017-12-05 21:30:56.0, 2018-02-01 18:47:34.0, 700.00, 2, 被套支出, 账单无误, 2017-12-05 21:33:25.0, 0, 1, 1, 审核通过, 7, 30, 3, 15679760321, 15679760321, 红古轩酒店, 青岛瑞蓝铂悦酒店管理有限公司, 被套, 银联
<==        Row: 2, 1, 4, 7, 0, 2017-12-05 09:25:09.0, 2018-02-01 18:47:34.0, 900.00, 1, 牙刷进货, 暂无批注, 2017-12-05 21:27:48.0, 1, 1, 1, 审核通过, 7, 30, 2, 15679760321, 15679760321, 800, 青岛瑞蓝铂悦酒店管理有限公司, 牙刷, 微信
<==        Row: 1, 1, 2, 7, 0, 2017-12-03 22:56:17.0, 2018-02-01 18:47:34.0, 500.00, 1, 采购牙刷, 采购牙刷, 2017-12-03 22:56:56.0, 0, 1, 1, 审核通过, 7, 30, 1, 15679760321, 15679760321, 红古轩酒店, 青岛瑞蓝铂悦酒店管理有限公司, 牙刷, 支付宝
<==      Total: 5
<==        Row: 7, 1, 2, 7, 1, 2018-01-04 19:02:16.0, 2018-02-04 19:02:20.0, 3000.00, 2, 被套支出, 暂无批注, 2018-01-04 19:02:36.0, 0, 0, 0, 未审核, null, 97, 3, null, 15679760321, 青岛瑞蓝铂悦酒店管理有限公司, 被套, 银联
<==        Row: 6, 1, 2, 7, 1, 2018-01-04 18:59:23.0, 2018-02-04 19:02:20.0, 3000.00, 1, 牙刷支出, 暂无批注, 2018-01-04 18:59:54.0, 0, 0, 0, 未审核, null, 97, 2, null, 15679760321, 青岛瑞蓝铂悦酒店管理有限公司, 牙刷, 微信
<==        Row: 3, 1, 2, 7, 1, 2017-12-05 21:30:56.0, 2018-02-01 18:47:34.0, 700.00, 2, 被套支出, 账单无误, 2017-12-05 21:33:25.0, 0, 1, 1, 审核通过, 7, 30, 3, 15679760321, 15679760321, 青岛瑞蓝铂悦酒店管理有限公司, 被套, 银联
<==        Row: 1, 1, 2, 7, 0, 2017-12-03 22:56:17.0, 2018-02-01 18:47:34.0, 500.00, 1, 采购牙刷, 采购牙刷, 2017-12-03 22:56:56.0, 0, 1, 1, 审核通过, 7, 30, 1, 15679760321, 15679760321, 青岛瑞蓝铂悦酒店管理有限公司, 牙刷, 支付宝
<==      Total: 4

create database bag;
(select * from t_rent_pay where   year(facted_pay_time_end)=year(now()) and facted_pay_time_start BETWEEN NOW() and date_add(NOW(),interval 5 day) or date_add(NOW(),interval 5 day)>facted_pay_time_start and is_active=0)
(select IfNULL(sum(ceil(datediff(now(),facted_pay_time_start)/30/pay_time)*first_pay),0.0) from t_rent_pay where  year(fact_pay_time_start)=year(now()) and NOW()>facted_pay_time_start and is_active=0)
select id,ceil(datediff(now(),facted_pay_time_start)/30) from t_rent_pay where year(fact_pay_time_start)=year(now())

select datediff(now(),facted_pay_time_start) from t_rent_pay
create database bag;

select t.*,b.hotel_sin_name from t_price_item t,t_businessman b where t.businessman_id=b.id and  DATE_FORMAT(t.create_time, '%Y-%m-%d')=DATE_FORMAT('2018-03-19','%Y-%m-%d') and t.hotel_type_id='10' order by t.create_time desc

select t.*,b.hotel_sin_name from t_price_item t,t_businessman b where t.businessman_id=b.id and DATE_FORMAT(t.create_time, '%Y-%m-%d')=DATE_FORMAT('2018-03-19','%Y-%m-%d') order by t.create_time desc


select t.*,b.hotel_sin_name from t_price_item t,t_businessman b where t.businessman_id=b.id


select t.*,b.hotel_sin_name from t_price_item t,t_businessman b where t.businessman_id=b.id and DATE_FORMAT(t.create_time, '%Y-%m-%d')=DATE_FORMAT('2018-03-19','%Y-%m-%d') and t.hotel_type_id=10 order by t.create_time desc

















