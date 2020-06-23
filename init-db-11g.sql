


CREATE TABLE  active_guests (
  ip varchar(15) NOT NULL,
  timestamp number(11) NOT NULL,
  PRIMARY KEY (ip)
);


CREATE TABLE  active_users (
  username varchar(30) NOT NULL,
  timestamp number NOT NULL,
  PRIMARY KEY (username)
) ;

CREATE TABLE categories (
  id number  default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  categoryName varchar2(255) DEFAULT '0',
  status number DEFAULT NULL,
  PRIMARY KEY (id)
);


INSERT INTO categories (id, categoryName, status)VALUES(1, 'Switches', 1);
INSERT INTO categories (id, categoryName, status)values(2, 'Routers', 1);
INSERT INTO categories (id, categoryName, status)values(4, 'LoadBalancers', 1);
INSERT INTO categories (id, categoryName, status)values(5, 'WANOptimizers', 1);
INSERT INTO categories (id, categoryName, status)values(8, 'Firewalls', 1);




CREATE TABLE cmdCatTbl (
  configCmdId number DEFAULT NULL,
  nodeCatId number DEFAULT NULL
);



INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(161, 1);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(161, 2);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(161, 4);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(161, 5);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(161, 8);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(162, 2);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(163, 1);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(163, 2);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(164, 1);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(164, 2);
INSERT INTO cmdCatTbl (configCmdId, nodeCatId)VALUES(165, 2);



CREATE TABLE compliancePolElem(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL ,
  elementName varchar2(255) NOT NULL,
  elementDesc varchar2(255) NOT NULL,
  singleParam1 number DEFAULT NULL ,
  singleLine1 varchar(255) DEFAULT NULL,
  status number DEFAULT '1',
  PRIMARY KEY (id)
);

COMMENT ON COLUMN compliancePolElem.singleParam1
   IS '1, equals. 2, contains';

CREATE TABLE compliancePolElemTbl(
  polId number DEFAULT NULL,
  elemId number DEFAULT NULL
);


CREATE TABLE compliancePolicies(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL ,
  policyName varchar2(255) DEFAULT NULL,
  policyDesc varchar2(255) DEFAULT NULL,
  status number DEFAULT '1',
  PRIMARY KEY (id)
);

CREATE TABLE complianceReportPolTbl(
  reportId number DEFAULT NULL,
  polId number DEFAULT NULL
);


CREATE TABLE complianceReports(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  reportsName varchar2(255) DEFAULT NULL,
  reportsDesc varchar2(255) DEFAULT NULL,
  status number DEFAULT '1',
  PRIMARY KEY (id)
);


CREATE TABLE configcommands(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  command varchar2(255) DEFAULT NULL,
  status number DEFAULT '1',
  PRIMARY KEY (id)
);

INSERT INTO configcommands (id, command, status) VALUES(161, 'show startup-config', 1);
INSERT INTO configcommands (id, command, status) VALUES(162, 'show ip route', 1);
INSERT INTO configcommands (id, command, status) VALUES(163, 'show cdp neigh', 1);
INSERT INTO configcommands (id, command, status) VALUES(164, 'show ip access-list', 1);
INSERT INTO configcommands (id, command, status) VALUES(165, 'show ip route', 1);


CREATE TABLE configs (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  deviceId number DEFAULT NULL,
  configLocation varchar2(255) DEFAULT NULL,
  configFilename varchar2(255) DEFAULT NULL,
  configDate date DEFAULT NULL,
  configTime date DEFAULT NULL,
  PRIMARY KEY (id)
);


/*CREATE TABLE customProperties (
  customProperty VARCHAR2(64) DEFAULT '' NOT NULL
);*/


/*CREATE TABLE devicemodelview (
  model VARCHAR2(255) DEFAULT NULL  NULL
);*/


CREATE TABLE nodes (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  deviceName varchar2(255) DEFAULT NULL,
  deviceUsername varchar2(255) DEFAULT NULL,
  devicePassword varchar2(255) DEFAULT NULL,
  deviceEnablePassword varchar2(255) DEFAULT NULL,
  deviceIpAddr varchar2(255) DEFAULT NULL,
  devicePrompt varchar2(255) DEFAULT NULL,
  deviceEnablePrompt varchar2(255) DEFAULT NULL,
  nodeCatId number DEFAULT NULL,
  templateId number DEFAULT NULL,
  vendorId varchar2(255) DEFAULT NULL,
  model varchar2(255) DEFAULT NULL,
  nodeVersion varchar2(255) DEFAULT NULL,
  nodeAddedBy varchar2(255) DEFAULT '-',
  defaultCreds number(1) DEFAULT NULL,
  defaultUsername varchar2(255) DEFAULT NULL,
  defaultPassword varchar2(255) DEFAULT NULL,
  defaultEnablePassword varchar2(255) DEFAULT NULL,
  deviceDateAdded date DEFAULT NULL,
  deviceLastUpdated date DEFAULT NULL,
  status number DEFAULT '1',
  custom_Location varchar2(255) DEFAULT NULL ,
  PRIMARY KEY (id)
);

COMMENT on column  nodes.custom_Location is 'Custom Property - Location';


CREATE TABLE reportData (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  device varchar2(255) DEFAULT NULL,
  "ERROR" clob,
  script varchar(50) DEFAULT NULL,
  status varchar(255) DEFAULT NULL,
  "DATE" date DEFAULT NULL,
  PRIMARY KEY (id)
);


CREATE TABLE settings (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  fileSaveChk number DEFAULT NULL,
  fileLocation varchar2(255) DEFAULT NULL,
  defaultNodeUsername varchar2(255) DEFAULT NULL,
  defaultNodePassword varchar2(255) DEFAULT NULL,
  defaultNodeEnable varchar2(255) DEFAULT NULL,
  useDefaultCredsManualSet number DEFAULT NULL,
  commandDebug number DEFAULT '0',
  commandDebugLocation varchar2(255) DEFAULT NULL,
  phpErrorLogging number(2) DEFAULT '0',
  phpErrorLoggingLocation varchar2(255) DEFAULT '/home/rconfig/logs/phpLog/',
  deviceConnectionTimout number(3) DEFAULT '10',
  smtpServerAddr varchar2(255) DEFAULT NULL,
  smtpFromAddr varchar2(255) DEFAULT NULL,
  smtpRecipientAddr clob,
  smtpAuth number(2) DEFAULT NULL,
  smtpAuthUser varchar2(100) DEFAULT NULL,
  smtpAuthPass varchar2(100) DEFAULT NULL,
  smtpLastTest varchar2(20) DEFAULT NULL,
  smtpLastTestTime date DEFAULT NULL,
  timeZone varchar2(100) DEFAULT NULL,
  ldapServer number(1) DEFAULT NULL,
  ldap_host varchar2(255) DEFAULT NULL,
  ldap_dn varchar2(255) DEFAULT NULL,
  ldap_user_group varchar2(255) DEFAULT NULL,
  ldap_admin_group varchar2(255) DEFAULT NULL,
  ldap_usr_dom varchar2(255) DEFAULT NULL,
  pageTimeout number DEFAULT '600' NOT NULL ,
  passwordEncryption number DEFAULT '0',
  PRIMARY KEY (id)
);

comment on column settings.commandDebug is '0 is default where 1 is debug on';
comment on column settings.pageTimeout is 'Page Timeout Value';

INSERT INTO settings (id, fileSaveChk, fileLocation, defaultNodeUsername, defaultNodePassword, defaultNodeEnable, useDefaultCredsManualSet, commandDebug, commandDebugLocation, phpErrorLogging, phpErrorLoggingLocation, deviceConnectionTimout, smtpServerAddr, smtpFromAddr, smtpRecipientAddr, smtpAuth, smtpAuthUser, smtpAuthPass, smtpLastTest, smtpLastTestTime, timeZone, ldapServer, pageTimeout, passwordEncryption) VALUES
  (1, 1, '/home/rconfig/data/', '', '', '', 0, 0, '/home/rconfig/logs/debugging/', 0, '/home/rconfig/logs/phpLog/', 15, '', '', '', 0, '', '', '', to_date('1980-01-01 00:00:00','yyyy-mm-dd hh24:mi:ss'), 'Asia/Shanghai', '0', 600, 0);


CREATE TABLE snippets (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  snippetName varchar2(255) NOT NULL,
  snippetDesc varchar2(255) NOT NULL,
  snippet CLOB NOT NULL,
  PRIMARY KEY (id)
) ;

CREATE TABLE tasks (
  id number(6) NOT NULL,
  taskType number(3) NOT NULL,
  taskname varchar2(255) NOT NULL,
  taskDescription varchar2(255) NOT NULL,
  snipId number(10) DEFAULT NULL,
  crontime varchar2(255) NOT NULL,
  croncmd varchar2(255) NOT NULL,
  addedBy varchar2(255) NOT NULL,
  dateAdded date NOT NULL,
  catId varchar2(255) DEFAULT NULL,
  catCommand varchar2(255) DEFAULT NULL,
  status number(2) NOT NULL,
  mailConnectionReport number(10) DEFAULT '0',
  mailErrorsOnly number(10) DEFAULT '0',
  complianceId number(10) DEFAULT NULL,
  PRIMARY KEY (id)
) ;

comment on column tasks.crontime is 'e.g. 5 * * 6 *';
comment on column tasks.croncmd is 'e.g. "php /script/script.php"';
comment on column tasks.addedBy is 'for later use';
comment on column tasks.catId is 'Used for Compare Reports Only';
comment on column tasks.catCommand is 'Used for Compare Reports Only';
comment on column tasks.status is 'if 2 = deleted and not in crontab';

CREATE TABLE userlevels (
  id number(10) NOT NULL,
  userlevel varchar2(50) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO userlevels (id, userlevel) VALUES(1, 'User');
INSERT INTO userlevels (id, userlevel) VALUES(9, 'Administrator');


CREATE TABLE users(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  username varchar2(30) NOT NULL,
  password varchar2(32) DEFAULT NULL,
  userid varchar2(32) DEFAULT NULL,
  userlevel number(1) NOT NULL,
  email varchar2(50) DEFAULT NULL,
  timestamp number(11) NOT NULL,
  status number(10) DEFAULT NULL,
  PRIMARY KEY (id)
);

INSERT INTO users (id, username, password, userid, userlevel, email, timestamp, status) VALUES
  (1, 'admin', '21232f297a57a5a743894a0e4a801fc3', '6c97424dc92f14ae78f8cc13cd08308d', 9, 'admin@domain.com', 1346920339, 1);


CREATE TABLE vendors(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  vendorName varchar2(50) DEFAULT '0',
  vendorLogo varchar2(255) DEFAULT 'images/logos/Coding16.png' NOT NULL ,
  status number(10) DEFAULT '0',
  PRIMARY KEY (id)
);

INSERT INTO vendors (id, vendorName, vendorLogo, status) VALUES
  (1, 'Cisco', 'images/vendor/cisco.jpg', 1);


CREATE VIEW customProperties
AS
select COLUMN_NAME  AS customProperty from user_tab_columns
where table_name = upper('nodes')
and COLUMN_NAME like upper('%custom%');


CREATE  VIEW devicemodelview AS
select DISTINCT model from nodes where model <> 'NULL'
and model is not null;


CREATE TABLE templates (
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  fileName varchar2(255) DEFAULT NULL,
  name varchar2(255) DEFAULT NULL,
  "DESC" varchar2(255) DEFAULT NULL,
  dateAdded date DEFAULT NULL,
  addedby varchar2(255) DEFAULT NULL,
  dateLastEdit date DEFAULT NULL,
  status number(11) DEFAULT '1',
  PRIMARY KEY (id)
);

INSERT INTO templates (id, fileName, name, "DESC", dateAdded, addedby, dateLastEdit, status) VALUES(1, '/home/rconfig/templates/ios-telnet-noenable.yml', 'Cisco IOS - TELNET - No Enable', 'Cisco IOS TELNET based connection without enable mode', to_date('2017-08-18','yyyy-mm-dd'), 'admin', NULL, 1);
INSERT INTO templates (id, fileName, name, "DESC", dateAdded, addedby, dateLastEdit, status) VALUES(2, '/home/rconfig/templates/ios-telnet-enable.yml', 'Cisco IOS - TELNET - Enable', 'Cisco IOS TELNET based connection with enable mode', to_date('2017-08-18','yyyy-mm-dd'), 'admin', NULL, 1);
INSERT INTO templates (id, fileName, name, "DESC", dateAdded, addedby, dateLastEdit, status) VALUES(3, '/home/rconfig/templates/ios-ssh-noenable.yml', 'Cisco IOS - SSH - No Enable', 'Cisco IOS SSH based connection without enable mode', to_date('2017-08-18','yyyy-mm-dd'), 'admin', NULL, 1);
INSERT INTO templates (id, fileName, name, "DESC", dateAdded, addedby, dateLastEdit, status) VALUES(4, '/home/rconfig/templates/ios-ssh-enable.yml', 'Cisco IOS - SSH - Enable', 'Cisco IOS SSH based connection with enable mode', to_date('2017-08-18','yyyy-mm-dd'), 'admin', NULL, 1);


CREATE TABLE menuPages(
  id number default to_number(SYS_GUID(),rpad('x',32,'x')) NOT NULL,
  pageName varchar2(50) DEFAULT '0' NOT NULL,
  breadcrumbText varchar2(100) DEFAULT '0' NOT NULL,
  annoucementText varchar2(100) DEFAULT '0' NOT NULL,
  menuName varchar2(100) DEFAULT '0' NOT NULL,
  topLevel varchar2(100) DEFAULT '0' NOT NULL,
  parentId number(11) DEFAULT '0' NOT NULL,
  menuSortId number(11) DEFAULT '0' NOT NULL,
  PRIMARY KEY (id)
);

INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(1, 'login.php', 'Login Page', 'Enter Username & Password to login', 'Login', '2', 1, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(2, 'compatibility.php', 'Compatibility Page', 'rConfig Compatibility Details', 'Compatibility', '2', 0, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(3, 'dashboard.php', 'Dashboard', 'View rConfig Server and Device Status on this page', 'Home', '1', 3, 1);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(4, 'devices.php', 'Devices', 'View/Edit Devices on this page', 'Devices', '1', 4, 2);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(5, 'devicemgmt.php', 'Devices > Device Management', 'Manage devices on this page', 'Device Management', '0', 5, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(7, 'customProperties.php', 'Devices > Custom Properties', 'Update Custom Properties on this page', 'Custom Properties', '0', 4, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(8, 'categories.php', 'Devices > Categories', 'Update Categories on this page', 'Categories', '0', 4, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(9, 'commands.php', 'Devices > Commands', 'Update Commands on this page', 'Commands', '0', 4, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(10, 'vendors.php', 'Devices > Vendors', 'Update Vendor details on this page', 'Vendors', '0', 4, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(11, 'configoverview.php', 'Configuration Tools > Overview', 'Configurations Overview', 'Configuration Tools', '1', 10, 4);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(12, 'configcompare.php', 'Configuration Tools > Comparison', 'Configurations Comparison', 'Compare', '0', 10, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(13, 'search.php', 'Configuration Tools > Search', 'Search Configurations', 'Config Search', '0', 10, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(14, 'snippets.php', 'Configuration Tools > Config Snippets', 'Configuration Snippets', 'Config Snippets', '0', 10, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(15, 'configreports.php', 'Configuration Tools > Reports', 'Reports', 'Reports', '0', 10, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(16, 'configlogging.php', 'Configuration Tools > Logging Information', 'Logging files and archives', 'Logs', '0', 10, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(17, 'complianceoverview.php', 'Compliance > Overview', 'Configuration Compliance Management Overview', 'Compliance', '1', 16, 5);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(18, 'compliancereports.php', 'Compliance > Reports', 'Configuration Compliance Reports', 'Reports', '0', 16, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(19, 'compliancepolicies.php', 'Compliance > Policies', 'Configuration Compliance Policies', 'Policies', '0', 16, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(20, 'compliancepolicyelements.php', 'Compliance > Policy Elements', 'Configuration Compliance Policy Elements', 'Policy Elements', '0', 16, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(21, 'settings.php', 'Settings > General Settings', 'Change general systems settings on this page', 'Settings', '1', 20, 6);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(22, 'scheduler.php', 'Scheduled Tasks', 'Manage Scheduled Tasks on this page', 'Scheduled Tasks', '1', 21, 3);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(23, 'useradmin.php', 'Settings > Users Management', 'Manage User details on this page', 'Users (Admin)', '0', 20, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(24, 'settingsBackup.php', 'Settings > Backup', 'Backup rConfig on this page', 'System Backup(Admin)', '0', 20, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(25, 'updater.php', 'Update', 'Update rConfig on this page', 'Updater', '2', 24, 0);
INSERT INTO menuPages (id, pageName, breadcrumbText, annoucementText, menuName, topLevel, parentId, menuSortId) VALUES(6, 'deviceConnTemplates.php', 'Devices > Device Connection Templates', 'Manage devices connection templates on this page', 'Connection Templates', '0', 4, 0);

--drop user rconfig2 cascade
--create user rconfig2 identified by rconfig2;
--grant dba to rconfig2;

update settings set timezone = 'Asia/Shanghai' where id = 1;


update menuPages set menuname = '登录' where menuname = 'Login';
update menuPages set menuname = '兼容性' where menuname = 'Compatibility';
update menuPages set menuname = '主页' where menuname = 'Home';
update menuPages set menuname = '设备' where menuname = 'Devices';
update menuPages set menuname = '设备管理' where menuname = 'Device Management';
update menuPages set menuname = '自定义属性' where menuname = 'Custom Properties';
update menuPages set menuname = '类别' where menuname = 'Categories';
update menuPages set menuname = '配置项指令' where menuname = 'Commands';
update menuPages set menuname = '厂商' where menuname = 'Vendors';
update menuPages set menuname = '配置工具' where menuname = 'Configuration Tools';
update menuPages set menuname = '比较' where menuname = 'Compare';
update menuPages set menuname = '配置搜索' where menuname = 'Config Search';
update menuPages set menuname = '配置脚本' where menuname = 'Config Snippets';
update menuPages set menuname = '报表' where menuname = 'Reports';
update menuPages set menuname = '日志' where menuname = 'Logs';
update menuPages set menuname = '策略组' where menuname = 'Compliance';
update menuPages set menuname = '报表' where menuname = 'Reports';
update menuPages set menuname = '策略' where menuname = 'Policies';
update menuPages set menuname = '策略元素' where menuname = 'Policy Elements';
update menuPages set menuname = '设置' where menuname = 'Settings';
update menuPages set menuname = '定时任务' where menuname = 'Scheduled Tasks';
update menuPages set menuname = '用户' where menuname = 'Users (Admin)';
update menuPages set menuname = '系统备份' where menuname = 'System Backup(Admin)';
update menuPages set menuname = '更新程序' where menuname = 'Updater';
update menuPages set menuname = '连接模板' where menuname = 'Connection Templates';


update menuPages set breadcrumbtext = '登录页面',annoucementtext = '输入登录的用户与密码' where pagename = 'login.php';
update menuPages set breadcrumbtext = '策略组页面',annoucementtext = 'TY-Commander 策略组详情' where pagename = 'compatibility.php';
update menuPages set breadcrumbtext = '面板',annoucementtext = '查看TY-Commander服务与设备状态' where pagename = 'dashboard.php';
update menuPages set breadcrumbtext = '设备',annoucementtext = '查看和编辑设备' where pagename = 'devices.php';
update menuPages set breadcrumbtext = '设备 > 设备管理',annoucementtext = '管理设备' where pagename = 'devicemgmt.php';
update menuPages set breadcrumbtext = '设备 > 自定义属性',annoucementtext = '更新自定义属性' where pagename = 'customProperties.php';
update menuPages set breadcrumbtext = '设备 > 类别',annoucementtext = '更新类别' where pagename = 'categories.php';
update menuPages set breadcrumbtext = '设备 > 配置项指令',annoucementtext = '更新配置项' where pagename = 'commands.php';
update menuPages set breadcrumbtext = '设备 > 厂商',annoucementtext = '更新厂商详情' where pagename = 'vendors.php';
update menuPages set breadcrumbtext = '配置工具 > 总览',annoucementtext = '配置总览' where pagename = 'configoverview.php';
update menuPages set breadcrumbtext = '配置工具 > 比对',annoucementtext = '配置对比' where pagename = 'configcompare.php';
update menuPages set breadcrumbtext = '配置工具 > 查询',annoucementtext = '查询配置' where pagename = 'search.php';
update menuPages set breadcrumbtext = '配置工具 > 配置脚本',annoucementtext = '配置脚本' where pagename = 'snippets.php';
update menuPages set breadcrumbtext = '配置工具 > 报表',annoucementtext = '报表' where pagename = 'configreports.php';
update menuPages set breadcrumbtext = '配置工具 > 日志信息',annoucementtext = '记录文件与归档' where pagename = 'configlogging.php';
update menuPages set breadcrumbtext = '策略组 > 总览',annoucementtext = '配置策略组管理总览' where pagename = 'complianceoverview.php';
update menuPages set breadcrumbtext = '策略组 > 报表',annoucementtext = '配置策略组报表' where pagename = 'compliancereports.php';
update menuPages set breadcrumbtext = '策略组 > 策略',annoucementtext = '配置策略组策略' where pagename = 'compliancepolicies.php';
update menuPages set breadcrumbtext = '策略组 > 策略元素',annoucementtext = '配置策略组策略元素' where pagename = 'compliancepolicyelements.php';
update menuPages set breadcrumbtext = '设置 > 通用设置',annoucementtext = '更新通用系统设置' where pagename = 'settings.php';
update menuPages set breadcrumbtext = '定时任务',annoucementtext = '管理定时任务' where pagename = 'scheduler.php';
update menuPages set breadcrumbtext = '设置 > 用户管理',annoucementtext = '管理用户详细' where pagename = 'useradmin.php';
update menuPages set breadcrumbtext = '设置 > 备份',annoucementtext = '备份TY-Commander' where pagename = 'settingsBackup.php';
update menuPages set breadcrumbtext = '更新',annoucementtext = '更新TY-Commander' where pagename = 'updater.php';
update menuPages set breadcrumbtext = '设备 > 设备连接模板',annoucementtext = '管理设备连接模板' where pagename = 'deviceConnTemplates.php';

alter table CATEGORIES add parent_id number;

create table SYS_USER_TOKEN
(
  USER_ID     VARCHAR2(50) primary key,
  TOKEN       VARCHAR2(1000) not null unique,
  EXPIRE_TIME TIMESTAMP(6),
  UPDATE_TIME TIMESTAMP(6)
);



create table sys_task(
  id varchar2(65) PRIMARY KEY ,
  name VARCHAR2(65) not NULL ,
  obj_id number,
  description VARCHAR2(1000)
);

create table sys_task_step(
  id VARCHAR2(65) PRIMARY KEY ,
  task_id VARCHAR2(65) REFERENCES sys_task(id) ON DELETE SET NULL,
  snippet_id number REFERENCES SNIPPETS(id) on DELETE CASCADE,
  sort number not null,
  description VARCHAR2(1000)
);
CREATE INDEX sys_task_step_Task_id_ind on sys_task_step(task_id);
CREATE INDEX sys_task_step_snippet_id_ind on sys_task_step(snippet_id);
CREATE UNIQUE index sys_task_step_unque  ON sys_task_step(task_id,snippet_id,sort);

alter table sys_task_step add pre_func clob;
alter table sys_task_step add post_func clob;
alter table sys_task_step add error_continue char(1) default '0' not null;

alter table snippets add cat_id number CONSTRAINT fk_cano  REFERENCES CATEGORIES(id) on delete set null;

create table cmd_log(
id number  default to_number(SYS_GUID(),rpad('x',32,'x')) primary key,
log_level varchar2(20) not null,
rid number not null,
cmd_id number not null,
type varchar2(10) not null,
prompt varchar2(50),
content clob,
result clob,
create_time date
)

