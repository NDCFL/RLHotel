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
  (select count(house_name) from t_rent_pay where hotel_id=2) as '2号酒店房源数',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0) as '2号酒店待付资金',
  (select sum(total_pay) from t_rent_pay where hotel_id=2 and is_cash=0 and month(now())=month(pay_period_start)) as '本月应付资金'

from t_rent_pay where hotel_id=2 GROUP BY  hotel_id;















